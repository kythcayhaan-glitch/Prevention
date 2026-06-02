<?php

namespace App\Form;

use App\Entity\Inter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date', TextType::class, ['label' => 'Date', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('type', ChoiceType::class, [
                'label' => 'Type',
                'required' => false,
                'choices' => [
                    'Intervention' => 'Intervention',
                    'Visite de prévention' => 'Visite de prévention',
                    'RQTH' => 'RQTH',
                    'FIPHFP' => 'FIPHFP',
                    'EPI' => 'EPI',
                ],
                'placeholder' => '-- Choisir --',
            ])
            ->add('service', ChoiceType::class, [
                'label' => 'Service',
                'required' => false,
                'placeholder' => '-- Choisir --',
                'choices' => array_combine($options['services'], $options['services']),
            ])
            ->add('panneAnnonce', TextareaType::class, ['label' => 'Description', 'required' => false])
            ->add('urgence', ChoiceType::class, ['label' => 'Urgence', 'required' => false, 'choices' => ['A traiter' => 'a_traiter', 'En cours' => 'en_cours', 'Traité' => 'traite'], 'placeholder' => '--'])
            ->add('interEffect', TextareaType::class, ['label' => 'Intervention effectuée', 'required' => false])
            ->add('observation', TextareaType::class, ['label' => 'Observation', 'required' => false])
            ->add('actions', CollectionType::class, [
                'entry_type' => InterActionType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
                'label' => false,
            ])
            ->add('agentVisite', ChoiceType::class, [
                'label' => 'Agent concerné',
                'required' => false,
                'placeholder' => '-- Choisir --',
                'choices' => array_combine($options['agents'], $options['agents']),
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Inter::class,
            'agents' => [],
            'services' => [],
        ]);
    }
}
