const PRENOMS_F = new Set([
  'aaliyah','abby','abigail','ada','adele','adèle','adeline','adriana','agathe','agnes','agnès',
  'albane','alexandra','alice','alicia','alida','aline','alison','alissa','allegra','alma','alix',
  'amandine','ambre','amelie','amélie','amina','anaelle','anaëlle','anais','anaïs','anastasia',
  'andree','andrée','angele','angèle','angelique','angélique','anissa','anita','anna','annabelle',
  'anne','annick','antoinette','ariane','arielle','astrid','aurelie','aurélie','aurore','axelle',
  'barbara','beatrice','béatrice','beatrix','benedicte','bénédicte','bernadette','brigitte',
  'candice','carmen','caroline','catherine','cecile','cécile','celine','céline','charlotte',
  'chloe','chloé','christelle','christèle','christine','clara','clémence','clemence','clotilde','coralie','corinne',
  'delphine','denise','diane',
  'edith','elisa','elisabete','elisabeth','elise','élise','ella','eloise','eloïse','emilie','émilie',
  'emma','emmanuelle','eva','eve','evelyne','évelyne',
  'fanny','fatima','flora','florence','france','francine','francoise','françoise',
  'genevieve','geneviève',
  'helene','hélène',
  'ines','inès','irene','irène','isabelle',
  'jade','jessica','joelle','joëlle','josephine','joséphine','judith','julie','juliette',
  'karen','katia','karine',
  'laura','laure','laurence','laurie','layla','lea','léa','leila','léonie','leonie','lila','lilou',
  'lisa','lise','lison','lou','louise','lucie','luna','lydie','lydia',
  'maelle','maëlle','maelys','maëlys','maeva','magali','malika','manon','margaux','margot',
  'marie','marianne','marion','marlene','marlène','mathilde','maud','melanie','mélanie',
  'melissa','mélissa','mia','michelle','morgane','muriel',
  'nadia','nadine','nancy','naima','naïma','nathalie','noemie','noémie','nora','noura',
  'oceane','océane','odile','olivia',
  'pascale','patricia','pauline','perrine',
  'rachel','romane','roxane',
  'sabrina','sandra','sara','sarah','séverine','severine','sibylle','sidonie','sirine',
  'soizic','solène','solene','sophie','stephanie','stéphanie','suzanne','sylvie',
  'tiffany','typhaine',
  'valerie','valérie','vanessa','veronique','véronique','victoria',
  'wendy',
  'yael','yaël','yaelle','yaëlle','yasmine','yolande',
  'zoe','zoé','zora',
]);

const PRENOMS_M = new Set([
  'aaron','adam','adrien','alexandre','alexis','antoine','arthur','aurelien','aurélien','axel',
  'baptiste','benjamin','boris','brendan','bruno',
  'charles','christophe','clement','clément','colin',
  'damien','david','denis','didier','dylan',
  'edouard','édouard','emile','émile','ethan','evan',
  'fabien','fabrice','florian','francois','françois','frederic','frédéric',
  'gabriel','gael','gaël','geoffrey','georges','guillaume',
  'henri','hugo',
  'jacky','jacques','jean','julien','jerome','jérôme',
  'kevin',
  'laurent','lenny','leo','léo','loic','loïc','louis','luca','lucas','ludovic',
  'marc','martin','mathieu','mathis','maxime','maxence','mohamed','mehdi','mickael','michaël','michel',
  'nathan','nicolas','noah','noe','noé',
  'olivier',
  'paul','philippe','pierre','patrick',
  'quentin',
  'raphael','raphaël','romain','robin','remy','rémy',
  'samuel','simon','stephane','stéphane','sebastien','sébastien',
  'theo','théo','thomas','timothee','timothée','tom','tristan',
  'valentin','victor','vincent',
  'xavier',
  'yann','yannick','yoann',
]);

function detectGenre(prenom) {
  const p = prenom.toLowerCase().normalize('NFC');
  if (PRENOMS_F.has(p)) return 'Madame';
  if (PRENOMS_M.has(p)) return 'Monsieur';
  return null;
}

document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.prenom-genre-trigger').forEach(function (input) {
    const form = input.closest('form');
    const genreSelect = form ? form.querySelector('.genre-autofill') : null;
    if (!genreSelect) return;
    input.addEventListener('input', function () {
      const genre = detectGenre(this.value.trim());
      if (genre) genreSelect.value = genre;
    });
  });
});
