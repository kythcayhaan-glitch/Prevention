<?php

namespace App\Form;

use App\Entity\Visite;
use App\Form\VisiteDateType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VisiteType extends AbstractType
{
    private static array $conditionFields = [
        'travailPencheVisite' => 'Travail penché',
        'deboutVisite'        => 'Debout prolongé',
        'conduiteVisite'      => 'Conduite',
        'utilisationVisite'   => 'Écran',
        'travailHautVisite'   => 'Travail en hauteur',
        'travailIsoVisite'    => 'Travail isolé',
        'travailBasVisite'    => 'Travail en position basse',
        'effortVisite'        => 'Effort / Force',
    ];

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('agentVisite', TextType::class, ['label' => 'Nom', 'required' => false, 'attr' => ['placeholder' => 'NOM', 'style' => 'text-transform:uppercase']])
            ->add('prenomVisite', TextType::class, ['label' => 'Prénom', 'required' => false])
            ->add('poleServiceVisite', TextType::class, ['label' => 'Pôle / Service', 'required' => false])
            ->add('emploiVisite', TextType::class, ['label' => 'Emploi', 'required' => false])
            ->add('dates', CollectionType::class, [
                'entry_type' => VisiteDateType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
                'label' => false,
            ])
            ->add('type', ChoiceType::class, [
                'label' => 'Type de visite',
                'required' => false,
                'choices' => [
                    'Visite de prévention' => 'Visite de prévention',
                    'Visite de reprise'    => 'Visite de reprise',
                    'Visite spontanée'     => 'Visite spontanée',
                    'Visite périodique'    => 'Visite périodique',
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
            ->add('tpt1Du', TextType::class, ['label' => 'TPT 1 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt1Au', TextType::class, ['label' => 'TPT 1 au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt2Du', TextType::class, ['label' => 'TPT 2 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt2Au', TextType::class, ['label' => 'TPT 2 au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt3Du', TextType::class, ['label' => 'TPT 3 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt3Au', TextType::class, ['label' => 'TPT 3 au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt4Du', TextType::class, ['label' => 'TPT 4 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt4Au', TextType::class, ['label' => 'TPT 4 au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('port', TextType::class, ['label' => 'Port de charges', 'required' => false])
            ->add('epi', ChoiceType::class, ['label' => 'EPI', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('epiDetail', TextareaType::class, ['label' => 'Détail EPI', 'required' => false])
        ;

        foreach (self::$conditionFields as $field => $label) {
            $builder->add($field, CheckboxType::class, [
                'label'    => $label,
                'required' => false,
                'attr'     => ['class' => 'form-check-input'],
            ]);
            $builder->get($field)->addModelTransformer(new CallbackTransformer(
                fn($v) => (bool)$v,
                fn($v) => $v ? 1 : 0
            ));
        }
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Visite::class]);
    }
}
