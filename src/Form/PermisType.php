<?php

namespace App\Form;

use App\Entity\Permis;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PermisType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $dp = ['class' => 'form-control form-control-sm date-picker', 'placeholder' => 'JJ/MM/AAAA'];
        $mm = ['class' => 'form-control form-control-sm', 'placeholder' => 'MM/AAAA'];

        $builder
            ->add('nom', TextType::class, [
                'label' => 'Nom',
                'attr' => ['class' => 'form-control form-control-sm', 'style' => 'text-transform:uppercase'],
            ])
            ->add('prenom', TextType::class, [
                'label' => 'Prénom',
                'required' => false,
                'attr' => ['class' => 'form-control form-control-sm'],
            ])
            // Permis C
            ->add('permisCObtention', TextType::class, ['label' => 'Obtention', 'required' => false, 'attr' => $dp])
            ->add('permisCValidite', TextType::class, ['label' => 'Validité', 'required' => false, 'attr' => $dp])
            // Permis D
            ->add('permisDObtention', TextType::class, ['label' => 'Obtention', 'required' => false, 'attr' => $dp])
            ->add('permisDValidite', TextType::class, ['label' => 'Validité', 'required' => false, 'attr' => $dp])
            // Permis E
            ->add('permisEObtention', TextType::class, ['label' => 'Obtention', 'required' => false, 'attr' => $dp])
            ->add('permisEValidite', TextType::class, ['label' => 'Validité', 'required' => false, 'attr' => $dp])
            // FIMO
            ->add('fimoType', ChoiceType::class, [
                'label' => 'Type',
                'required' => false,
                'choices' => ['Marchandises' => 'marchandises', 'Voyageurs' => 'voyageurs'],
                'placeholder' => '-- Type --',
                'attr' => ['class' => 'form-select form-select-sm'],
            ])
            ->add('fimoObtention', TextType::class, ['label' => 'Obtention', 'required' => false, 'attr' => $mm])
            ->add('fimoProchaine', TextType::class, ['label' => 'Prochaine', 'required' => false, 'attr' => $mm])
            // FCO
            ->add('fcoObtention', TextType::class, ['label' => 'Obtention', 'required' => false, 'attr' => $mm])
            ->add('fcoProchaine', TextType::class, ['label' => 'Prochaine', 'required' => false, 'attr' => $mm])
            // Visite médicale
            ->add('visiteMedicaleRealisee', TextType::class, ['label' => 'Réalisée le', 'required' => false, 'attr' => $mm])
            ->add('visiteMedicaleProchaine', TextType::class, ['label' => 'Prochaine', 'required' => false, 'attr' => $mm])
            // Notes
            ->add('notes', TextareaType::class, [
                'label' => 'Notes',
                'required' => false,
                'attr' => ['class' => 'form-control form-control-sm', 'rows' => 3],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Permis::class]);
    }
}
