<?php

namespace App\Form;

use App\Entity\Inter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
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
            ->add('service', TextType::class, ['label' => 'Service', 'required' => false])
            ->add('panneAnnonce', TextareaType::class, ['label' => 'Description', 'required' => false])
            ->add('urgence', ChoiceType::class, ['label' => 'Urgence', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('intervenant', TextType::class, ['label' => 'Intervenant 1', 'required' => false])
            ->add('tauxIntervenant', NumberType::class, ['label' => 'Taux horaire', 'required' => false, 'scale' => 2])
            ->add('intervenant2', TextType::class, ['label' => 'Intervenant 2', 'required' => false])
            ->add('tauxIntervenant2', NumberType::class, ['label' => 'Taux horaire 2', 'required' => false, 'scale' => 2])
            ->add('intervenant3', TextType::class, ['label' => 'Intervenant 3', 'required' => false])
            ->add('tauxIntervenant3', NumberType::class, ['label' => 'Taux horaire 3', 'required' => false, 'scale' => 2])
            ->add('duree', NumberType::class, ['label' => 'Durée (h)', 'required' => false, 'scale' => 2])
            ->add('coutMatos', NumberType::class, ['label' => 'Coût matériel (€)', 'required' => false, 'scale' => 2])
            ->add('interEffect', TextareaType::class, ['label' => 'Intervention effectuée', 'required' => false])
            ->add('observation', TextareaType::class, ['label' => 'Observation', 'required' => false])
            ->add('agentVisite', TextType::class, ['label' => 'Agent visité', 'required' => false])
            ->add('poleServiceVisite', TextType::class, ['label' => 'Pôle/Service', 'required' => false])
            ->add('dateVisite', TextType::class, ['label' => 'Date visite', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('rqthVisite', ChoiceType::class, ['label' => 'RQTH', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('restrictionVisite', TextareaType::class, ['label' => 'Restrictions', 'required' => false])
            ->add('recommandationVisite', TextareaType::class, ['label' => 'Recommandations', 'required' => false])
            ->add('limitationVisite', TextareaType::class, ['label' => 'Limitations', 'required' => false])
            ->add('tempsPartielVisite', ChoiceType::class, ['label' => 'TPT', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('par', TextType::class, ['label' => 'Par', 'required' => false])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Inter::class]);
    }
}
