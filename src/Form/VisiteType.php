<?php

namespace App\Form;

use App\Entity\Visite;
use App\Form\VisiteDateType;
use App\Repository\ServiceRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VisiteType extends AbstractType
{
    public function __construct(private ServiceRepository $serviceRepository) {}

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $services = $this->serviceRepository->findBy([], ['service' => 'ASC']);
        $choices = [];
        foreach ($services as $s) {
            $choices[$s->getService()] = $s->getService();
        }

        $builder
            ->add('genre', ChoiceType::class, [
                'label'       => 'Genre',
                'required'    => false,
                'choices'     => ['Monsieur' => 'Monsieur', 'Madame' => 'Madame'],
                'placeholder' => '-- Genre --',
                'attr'        => ['class' => 'form-select'],
            ])
            ->add('agentVisite', TextType::class, ['label' => 'Nom', 'required' => false, 'attr' => ['placeholder' => 'NOM', 'style' => 'text-transform:uppercase']])
            ->add('prenomVisite', TextType::class, ['label' => 'Prénom', 'required' => false])
            ->add('poleServiceVisite', ChoiceType::class, [
                'label'       => 'Pôle / Service',
                'required'    => false,
                'choices'     => $choices,
                'placeholder' => '-- Choisir --',
                'attr'        => ['class' => 'form-select'],
            ])
            ->add('emploiVisite', TextType::class, ['label' => 'Emploi', 'required' => false])
            ->add('dates', CollectionType::class, [
                'entry_type'   => VisiteDateType::class,
                'allow_add'    => true,
                'allow_delete' => true,
                'by_reference' => false,
                'label'        => false,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Visite::class]);
    }
}
