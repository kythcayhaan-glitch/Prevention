<?php

namespace App\Form;

use App\Entity\Rqth;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RqthType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('genre', ChoiceType::class, [
                'label' => 'Genre',
                'required' => false,
                'choices' => ['Monsieur' => 'Monsieur', 'Madame' => 'Madame'],
                'placeholder' => '-- Genre --',
                'attr' => ['class' => 'form-select'],
            ])
            ->add('agentRqth', TextType::class, ['label' => 'Nom', 'required' => false, 'attr' => ['style' => 'text-transform:uppercase']])
            ->add('prenomRqth', TextType::class, ['label' => 'Prénom', 'required' => false])
            ->add('poleServiceRqth', TextType::class, ['label' => 'Pôle / Service', 'required' => false])
            ->add('emploiRqth', TextType::class, ['label' => 'Emploi', 'required' => false])
            ->add('etatRqth', ChoiceType::class, [
                'label' => 'État',
                'required' => false,
                'choices' => [
                    'Attribué' => 'Attribué',
                    'En cours' => 'En cours',
                    'A renouveler' => 'A renouveler',
                    'Refusé' => 'Refusé',
                    'Expiré' => 'Expiré',
                ],
                'placeholder' => '-- Choisir --',
            ])
            ->add('dateAttributionRqth', TextType::class, ['label' => 'Date d\'attribution', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('dateFinAttributionRqth', TextType::class, ['label' => 'Date de fin', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Rqth::class]);
    }
}
