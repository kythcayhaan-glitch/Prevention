<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/admin/utilisateur')]
#[IsGranted('ROLE_SUPER_ADMIN')]
class UserAdminController extends AbstractController
{
    #[Route('/', name: 'app_user_index')]
    public function index(UserRepository $repository): Response
    {
        return $this->render('user/index.html.twig', [
            'users' => $repository->findAll(),
        ]);
    }

    #[Route('/nouveau', name: 'app_user_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plainPassword = $form->get('plainPassword')->getData();
            if ($plainPassword) {
                $user->setPassword($hasher->hashPassword($user, $plainPassword));
            }
            $em->persist($user);
            $em->flush();
            $this->addFlash('success', 'Utilisateur créé.');
            return $this->redirectToRoute('app_user_index');
        }

        return $this->render('user/form.html.twig', ['form' => $form, 'title' => 'Nouvel utilisateur']);
    }

    #[Route('/{id}/modifier', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plainPassword = $form->get('plainPassword')->getData();
            if ($plainPassword) {
                $user->setPassword($hasher->hashPassword($user, $plainPassword));
            }
            $em->flush();
            $this->addFlash('success', 'Utilisateur modifié.');
            return $this->redirectToRoute('app_user_index');
        }

        return $this->render('user/form.html.twig', ['form' => $form, 'title' => 'Modifier l\'utilisateur']);
    }

    #[Route('/theme', name: 'app_user_theme', methods: ['POST'])]
    #[IsGranted('ROLE_USER')]
    public function saveTheme(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $allowed = ['', 'sombre', 'marine', 'foret', 'bordeaux'];
        $theme = $request->getPayload()->getString('theme');
        if (!in_array($theme, $allowed, true)) {
            return new JsonResponse(['ok' => false], 400);
        }
        $user = $this->getUser();
        $user->setTheme($theme ?: null);
        $em->flush();
        return new JsonResponse(['ok' => true]);
    }

    #[Route('/{id}/supprimer', name: 'app_user_delete', methods: ['POST'])]
    public function delete(Request $request, User $user, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($user);
            $em->flush();
            $this->addFlash('success', 'Utilisateur supprimé.');
        }
        return $this->redirectToRoute('app_user_index');
    }
}
