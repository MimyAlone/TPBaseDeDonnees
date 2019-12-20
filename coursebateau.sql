-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Vendredi 16 Novembre 2007 à 17:09
-- Version du serveur: 4.1.9
-- Version de PHP: 4.3.10
-- 
-- Base de données: coursebateau
-- 

-- --------------------------------------------------------
drop table inscription;
drop table resultat;
drop table competition;
drop table bateau;
drop table categorie;

-- 
-- Structure de la table categorie
-- 
CREATE TABLE categorie (
  ncat int not null,
  libelle varchar(40),
  PRIMARY KEY (ncat)
);

-- 
-- Contenu de la table categorie
-- 
INSERT INTO categorie VALUES (1, 'Ultime');
INSERT INTO categorie VALUES (2, 'Monocoque');
INSERT INTO categorie VALUES (3, 'Multi 50');
INSERT INTO categorie VALUES (4, 'Classe Unique');
INSERT INTO categorie VALUES (5, 'Deriveur');

-- 
-- Structure de la table bateau
-- 

CREATE TABLE bateau (
  nbat int NOT NULL,
  nombat varchar(40) NOT NULL default '',
  sponsor varchar(40) NOT NULL default '',
  ncat int references categorie,
  PRIMARY KEY  (nbat)
) ;

-- 
-- Contenu de la table bateau
-- 

INSERT INTO bateau VALUES (1, 'Sodebo', 'Sodebo', 1);
INSERT INTO bateau VALUES (2, 'Bonduelle', 'Bonduelle', 1);
INSERT INTO bateau VALUES (3, 'Groupe Bel', 'Bel', 2);
INSERT INTO bateau VALUES (4, 'Veolia', 'Veolia', 2);
INSERT INTO bateau VALUES (5, 'Banque Populaire', 'Banque Populaire', 1);
INSERT INTO bateau VALUES (6, 'Alinghi', 'Alinghi', 1);
INSERT INTO bateau VALUES (7, 'Ville de Paris', 'Ville de Paris', 2);
INSERT INTO bateau VALUES (8, 'VdP2', 'Ville de Paris', 2);
INSERT INTO bateau VALUES (9, 'Groupama 3', 'Groupama', 1);
INSERT INTO bateau VALUES (10, 'Maitre Coq', 'Maitre Coq', 4);
INSERT INTO bateau VALUES (11, 'Bretagne', 'Credit Mutuel de Bretagne', 4);
INSERT INTO bateau VALUES (12, 'Normandy Elite Team', 'Region Haute Normandie', 4);
-- --------------------------------------------------------

-- 
-- Structure de la table competition
-- 

CREATE TABLE competition (
  ncomp int NOT NULL,
  nomcomp varchar(40) NOT NULL default '',
  datcomp date NOT NULL ,
  gaincomp int,
  PRIMARY KEY  (ncomp)
) ;

-- 
-- Contenu de la table competition
-- 
INSERT INTO competition VALUES (1, 'AG2R', '2011-08-18', 100000);
INSERT INTO competition VALUES (2, 'Vendee Globe', '2011-08-15', 350000);
INSERT INTO competition VALUES (3, 'Le Figaro', '2014-07-02', 200000);
INSERT INTO competition VALUES (4, 'Louis Vuitton Cup', '2011-10-17', 1000000);
INSERT INTO competition VALUES (5, 'America Cup', '2011-10-17', 10000000);
INSERT INTO competition VALUES (6, 'Tour de France', '2011-08-18', 10000);

-- --------------------------------------------------------

-- 
-- Structure de la table resultat
-- 

CREATE TABLE resultat (
  nbat int NOT NULL references bateau,
  ncomp int NOT NULL references competition,
  rang int NOT NULL ,
  PRIMARY KEY  (nbat,ncomp)
) ;

-- 
-- Contenu de la table resultat
-- 

INSERT INTO resultat VALUES (3, 1, 1);
INSERT INTO resultat VALUES (3, 6, 3);
INSERT INTO resultat VALUES (4, 2, 3);
INSERT INTO resultat VALUES (2, 1, 2);
INSERT INTO resultat VALUES (2, 2, 1);
INSERT INTO resultat VALUES (3, 2, 2);
INSERT INTO resultat VALUES (10, 3, 1);
INSERT INTO resultat VALUES (11, 3, 2);
INSERT INTO resultat VALUES (12, 3, 3);
INSERT INTO resultat VALUES (7, 4, 1);
INSERT INTO resultat VALUES (2, 4, 2);
INSERT INTO resultat VALUES (3, 5, 1);


CREATE TABLE inscription (
  nbat int NOT NULL default '0',
  ncomp int NOT NULL default '0',
  PRIMARY KEY  (nbat,ncomp)
) ;

-- 
-- Contenu de la table inscription
-- 

INSERT INTO inscription VALUES (3, 1);
INSERT INTO inscription VALUES (3, 6);
INSERT INTO inscription VALUES (4, 2);
INSERT INTO inscription VALUES (2, 1);
INSERT INTO inscription VALUES (10, 3);
INSERT INTO inscription VALUES (2, 4);
INSERT INTO inscription VALUES (2, 2);
INSERT INTO inscription VALUES (3, 2);
INSERT INTO inscription VALUES (9, 3);
INSERT INTO inscription VALUES (3, 4);
INSERT INTO inscription VALUES (3, 5);
INSERT INTO inscription VALUES (7, 4);
INSERT INTO inscription VALUES (7, 5);
INSERT INTO inscription VALUES (5, 4);
INSERT INTO inscription VALUES (5, 5);
INSERT INTO inscription VALUES (5, 2);
INSERT INTO inscription VALUES (11, 3);
INSERT INTO inscription VALUES (12, 3);
