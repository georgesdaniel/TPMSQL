-- TP1, Creation et Insertion de données

select sysdate() from dual;
drop database monresto;
create database IF NOT exists monresto;
use monresto;

-- Creation de la table Commande
create table Commande (
	idcommande int not null primary key auto_increment, 
	nom varchar(100) not null, 
	datecommande datetime, 
	total float
);

-- Creation de la table Plat
 
create table Plat (
 idplat int not null primary key auto_increment,
 nomplat varchar(100) not null,
 tarif float);
 
 
 -- Creation de la table Commande Plats pour lier les tables Commande et Plat
create table Commande_plats (
  idcommandeplat int not null primary key auto_increment,
  idcommande int not null, 
  constraint fk_cmdp_idcmd foreign key (idcommande) references commande (idcommande) on delete restrict,
  idplat int not null,
  constraint fk_cmdp_idp foreign key (idplat) references plat (idplat) on delete restrict);  
 
 -- Creation de la table Ingredient
 
 create table Ingredient (
idingredient int not null primary key auto_increment,
 nomingredient varchar(100) not null);
 
  -- Creation de la table Plat Ingredients afin de lier Ingredient et Plat
  
create table Plat_ingredients (
  -- idingredientplat int not null primary key auto_increment,
  idingredient int not null,
  idplat int not null,
  quantite int not null,
  constraint fk_ing_idi foreign key (idingredient) references ingredient (idingredient) on delete restrict,
  
  constraint fk_ing_idp foreign key (idplat) references plat (idplat) on delete restrict);  
  
  -- Insertion de données dans la table commande
  
  insert into commande (nom,datecommande,total) 
  values ('commandetable1', '2017-08-05 11:41:00', 135.00),
         ('commandetable2', '2017-08-05 12:41:00', 25.00),
         ('commandetable3', '2017-08-05 13:41:00', 165.00);
 
 -- Insertion de données dans la table plat
 
 insert into plat (nomplat,tarif) 
 values ('Saumon sur son lit rocheux', 55.00),
         ('Boeuf farci', 35.00),
         ('Soleil végétarien', 75.50);
         
    
    -- Insertion de données dans la table Ingredient    
  insert into ingredient (nomingredient) 
  values ('coeur de saumon'),
         ('citron'),
         ('jaret de boeuf'),
         ('oignons');  
       
       
	insert into commande_plats (idcommande, idplat)
    values (1,1), -- La table 1 a commandé un "Saumon sur son lit Rocheux"
           (1,2); -- La table 1 a également commandé un "Boeuf farci"
    
    insert into plat_ingredients (idingredient,idplat,quantite)   
    values (1,1,3),
           (1,2,5);
 