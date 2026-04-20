<?php

namespace App\Form;

use App\Entity\Stock;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class StockType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('designation', TextType::class, ['label' => 'Désignation', 'required' => false])
            ->add('ref', TextType::class, ['label' => 'Référence', 'required' => false])
            ->add('prix', NumberType::class, ['label' => 'Prix unitaire (€)', 'required' => false, 'scale' => 2])
            ->add('stockMini', IntegerType::class, ['label' => 'Stock minimum', 'required' => false])
            ->add('stockReel', IntegerType::class, ['label' => 'Stock réel', 'required' => false])
            ->add('donnee', IntegerType::class, ['label' => 'Donné', 'required' => false])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Stock::class]);
    }
}
