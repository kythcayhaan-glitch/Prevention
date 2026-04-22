<?php

namespace App\Form;

use App\Entity\VisiteDate;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VisiteDateType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date', TextType::class, [
                'label' => false,
                'required' => false,
                'attr' => ['placeholder' => 'JJ/MM/AAAA', 'class' => 'form-control date-picker'],
            ])
            ->add('type', ChoiceType::class, [
                'label' => false,
                'required' => false,
                'choices' => [
                    'Réalisée' => 'realisee',
                    'Prévue' => 'prochaine',
                ],
                'placeholder' => '-- Type --',
                'attr' => ['class' => 'form-select'],
            ])
            ->add('categorie', ChoiceType::class, [
                'label' => false,
                'required' => false,
                'choices' => [
                    'Entretien Infirmier' => 'ESTI',
                    'Visite à la demande du médecin de prévention' => 'MDP',
                    'Visite périodique' => 'VP',
                ],
                'placeholder' => '-- Catégorie --',
                'attr' => ['class' => 'form-select'],
            ])
            ->add('heure', TextType::class, [
                'label' => false,
                'required' => false,
                'attr' => ['placeholder' => 'HH:MM', 'class' => 'form-control conv-field', 'style' => 'width:80px'],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => VisiteDate::class]);
    }
}
