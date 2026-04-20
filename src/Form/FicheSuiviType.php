<?php

namespace App\Form;

use App\Entity\Visite;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FicheSuiviType extends AbstractType
{
    private static array $conditionFields = [
        'travailPencheVisite' => 'Travail penché',
        'deboutVisite'        => 'Debout prolongé',
        'conduiteVisite'      => 'Conduite',
        'utilisationVisite'   => 'Écran',
        'travailHautVisite'   => 'Travail en hauteur',
        'travailIsoVisite'    => 'Travail isolé',
        'travailBasVisite'    => 'Position basse',
        'effortVisite'        => 'Effort / Force',
    ];

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('restrictionVisite', TextareaType::class, ['label' => 'Restrictions', 'required' => false, 'attr' => ['rows' => 3]])
            ->add('recommandationVisite', TextareaType::class, ['label' => 'Recommandations', 'required' => false, 'attr' => ['rows' => 3]])
            ->add('limitationVisite', TextareaType::class, ['label' => 'Limitations', 'required' => false, 'attr' => ['rows' => 3]])
            ->add('observation', TextareaType::class, ['label' => 'Observations', 'required' => false, 'attr' => ['rows' => 3]])
        ;

        // Conditions de travail : checkboxes avec transformateur int ↔ bool
        foreach (self::$conditionFields as $field => $label) {
            $builder->add($field, CheckboxType::class, [
                'label'    => $label,
                'required' => false,
                'attr'     => ['class' => 'form-check-input'],
            ]);
            $builder->get($field)->addModelTransformer(new CallbackTransformer(
                fn($v) => (bool)$v,         // int → bool pour l'affichage
                fn($v) => $v ? 1 : 0        // bool → int pour la sauvegarde
            ));
        }

        $builder
            ->add('port', TextType::class, ['label' => 'Port de charges', 'required' => false])
            ->add('epi', ChoiceType::class, ['label' => 'EPI', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('epiDetail', TextareaType::class, ['label' => 'Détail EPI', 'required' => false, 'attr' => ['rows' => 2]])
            ->add('tempsPartielVisite', ChoiceType::class, ['label' => 'Temps partiel thérapeutique', 'required' => false, 'choices' => ['Oui' => 'oui', 'Non' => 'non'], 'placeholder' => '--'])
            ->add('tpt1Du', TextType::class, ['label' => 'TPT 1 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt1Au', TextType::class, ['label' => 'au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt2Du', TextType::class, ['label' => 'TPT 2 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt2Au', TextType::class, ['label' => 'au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt3Du', TextType::class, ['label' => 'TPT 3 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt3Au', TextType::class, ['label' => 'au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt4Du', TextType::class, ['label' => 'TPT 4 du', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('tpt4Au', TextType::class, ['label' => 'au', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker']])
            ->add('prochaineDate', TextType::class, [
                'mapped'   => false,
                'label'    => 'Date prévue',
                'required' => false,
                'attr'     => ['placeholder' => 'DD/MM/YYYY', 'class' => 'form-control date-picker'],
            ])
            ->add('prochaineCategorie', ChoiceType::class, [
                'mapped'   => false,
                'label'    => 'Catégorie',
                'required' => false,
                'choices'  => [
                    'Entretien Infirmier'                        => 'ESTI',
                    'Visite à la demande du médecin de prévention' => 'MDP',
                    'Visite périodique'                          => 'VP',
                ],
                'placeholder' => '-- Catégorie --',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Visite::class]);
    }
}
