<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class DateStatusExtension extends AbstractExtension
{
    public function getFilters(): array
    {
        return [new TwigFilter('date_status', [$this, 'dateStatus'])];
    }

    /**
     * Retourne 'expired', 'soon' (< 3 mois) ou 'ok'.
     * Accepte DD/MM/YYYY ou MM/YYYY.
     */
    public function dateStatus(?string $date): ?string
    {
        if (!$date) {
            return null;
        }

        $dt = \DateTime::createFromFormat('d/m/Y', $date)
            ?: \DateTime::createFromFormat('m/Y', $date);

        if (!$dt) {
            return null;
        }

        $now = new \DateTime('today');
        $soon = (new \DateTime('today'))->modify('+3 months');

        if ($dt < $now) {
            return 'expired';
        }
        if ($dt <= $soon) {
            return 'soon';
        }
        return 'ok';
    }
}
