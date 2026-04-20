<?php

namespace App\Form;

use App\Entity\Fiphfp;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FiphfpType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('agentFiphfp', TextType::class, ['label' => 'Agent', 'required' => false])
            ->add('poleFiphfp', TextType::class, ['label' => 'Pôle / Service', 'required' => false])
            ->add('demandeFiphfp', TextType::class, ['label' => 'N° Demande', 'required' => false])
            ->add('dateDemandeFiphfp', TextType::class, ['label' => 'Date de demande', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY']])
            ->add('objetFiphfp', TextType::class, ['label' => 'Objet', 'required' => false])
            ->add('etatDemandeFiphfp', ChoiceType::class, [
                'label' => 'État',
                'required' => false,
                'choices' => [
                    'En attente' => 'En attente',
                    'Accordé' => 'Accordé',
                    'Refusé' => 'Refusé',
                    'Payé' => 'Payé',
                ],
                'placeholder' => '-- Choisir --',
            ])
            ->add('detailDemandeFiphfp', TextareaType::class, ['label' => 'Détail', 'required' => false])
            ->add('montantDepenseFiphfp', IntegerType::class, ['label' => 'Montant dépensé (€)', 'required' => false])
            ->add('montantDemandeFiphfp', IntegerType::class, ['label' => 'Montant demandé (€)', 'required' => false])
            ->add('montantAccordeFiphfp', IntegerType::class, ['label' => 'Montant accordé (€)', 'required' => false])
            ->add('accordPayeLe', TextType::class, ['label' => 'Accord payé le', 'required' => false, 'attr' => ['placeholder' => 'DD/MM/YYYY']])
            ->add('urgenceFiphfp', ChoiceType::class, ['label' => 'Urgence', 'required' => false, 'choices' => ['Oui' => 1, 'Non' => 0], 'placeholder' => '--'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Fiphfp::class]);
    }
}
