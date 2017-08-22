-- question 1
select nom
 from agence;

-- question 2
select idAgence
 from agence
 where nom='orpi';

-- question 3
select * 
from logement
 limit 1;

-- question 4
select count(*) as Nombre_de_logements
 from logement;

-- question 5
select * from logement
 where categorie='vente' and prix < 150000
 order by prix asc;

-- question 6
select count(*) as nombre 
from logement
 where categorie = 'location';

-- question 7
select distinct ville 
from demande;

-- question 8
select count(*) as nombre_biens_en_vente, ville
 from logement 
 where categorie ='vente'
 group by ville;
 
 -- question 9
 select idLogement, genre
 from logement
 where categorie ='location';
 
 -- question 10
 
 select idLogement, genre, superficie
 from logement
 where superficie > 20 and superficie <30;
 
 -- question 11
 
 select min(prix) as Prix_minimum, genre, ville
 from logement
 where categorie = 'vente';
 
 -- question 12
 
 select ville
 from logement 
 where categorie = 'vente' and genre ='maison';
 
 -- question 13
update logement_agence
  set frais = '730'
  where idLogement = '5246';
  
   -- Verification que la mise à jour a été effectuée
  select idLogement, frais
  from logement_agence
  where idLogement ='5246';
 
  -- question 14
  
  select logement.idLogement, logement.categorie, logement.genre from logement, logement_agence, agence
  where logement.idLogement = logement_agence.idLogement
  and logement_agence.idAgence = agence.idAgence
  and agence.nom = 'laforet';
  
 
 
 
 
