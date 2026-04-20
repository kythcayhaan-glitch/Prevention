<?php

namespace App\Form;

use App\Entity\Visite;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VisiteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('agentVisite', TextType::class, ['label' => 'Agent', 'required' => false])
            ->add('poleServiceVisite', TextType::class, ['label' => 'Pôle / Service', 'required' => false])
            ->add('emploiVisite', TextType::class, ['label' => 'Emploi', 'required' => false])
            ->add('dateVisite', TextType::class, ['label' => 'Date de visite', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY']])
            ->add('type', ChoiceType::class, [
                'label' => 'Type de visite',
                'required' => false,
                'choices' => [
                    'Visite de prévention' => 'Visite de prévention',
                    'Visite de reprise' => 'Visite de reprise',
                    'Visite spontanée' => 'Visite spontanée',
                    'Visite périodique' => 'Visite périodique',
                ],
                'placeholder' => '-- Choisir --',
            ])
            ->add('rqthVisite', ChoiceType::class, [
                'label' => 'RQTH',
                'required' => false,
                'choices' => ['Oui' => 'oui', 'Non' => 'non', 'En cours' => 'en cours'],
                'placeholder' => '-- Choisir --',
            ])
            ->add('restrictionVisite', TextareaType::class, ['label' => 'Restrictions', 'required' => false])
            ->add('recommandationVisite', TextareaType::class, ['label' => 'Recommandations', 'required' => false])
            ->add('limitationVisite', TextareaType::class, ['label' => 'Limitations', 'required' => false])
            ->add('observation', TextareaType::class, ['label' => 'Observations', 'required' => false])
            ->add('tempsPartielVisite', ChoiceType::class, [
                'label' => 'Temps partiel thérapeutique',
                'required' => false,
                'choices' => ['Oui' => 'oui', 'Non' => 'non'],
                'placeholder' => '-- Choisir --',
            ])
            ->add('tpt1Du', TextType::class, ['label' => 'TPT 1 du', 'required' => false])
            ->add('tpt1Au', TextType::class, ['label' => 'TPT 1 au', 'required' => false])
            ->add('tpt2Du', TextType::class, ['label' => 'TPT 2 du', 'required' => false])
            ->add('tpt2Au', TextType::class, ['label' => 'TPT 2 au', 'required' => false])
            ->add('tpt3Du', TextType::class, ['label' => 'TPT 3 du', 'required' => false])
            ->add('tpt3Au', TextType::class, ['label' => 'TPT 3 au', 'required' => false])
            ->add('tpt4Du', TextType::class, ['label' => 'TPT 4 du', 'required' => false])
            ->add('tpt4Au', TextType::class, ['label' => 'TPT 4 au', 'required' => false])
            ->add('travailPencheVisite', ChoiceType::class, ['label' => 'Travail penché', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('deboutVisite', ChoiceType::class, ['label' => 'Debout prolongé', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('conduiteVisite', ChoiceType::class, ['label' => 'Conduite', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('utilisationVisite', ChoiceType::class, ['label' => 'Ecran', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('travailHautVisite', ChoiceType::class, ['label' => 'Travail en hauteur', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('travailIsoVisite', ChoiceType::class, ['label' => 'Travail isolé', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('travailBasVisite', ChoiceType::class, ['label' => 'Travail en position basse', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('effortVisite', ChoiceType::class, ['label' => 'Effort / Force', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
            ->add('port', TextType::class, ['label' => 'Port de charges', 'required' => false])
            ->add('epi', ChoiceType::class, ['label' => 'EPI', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('epiDetail', TextareaType::class, ['label' => 'Détail EPI', 'required' => false])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Visite::class]);
    }
}
