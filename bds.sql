
DROP TABLE themeCollection;
DROP TABLE livre;
DROP TABLE editeur;
DROP TABLE auteur;
DROP TABLE collection; 
DROP TABLE theme; 


--
-- Structure de la table collection
--
CREATE TABLE collection (
	 codeC varchar(3) NOT NULL,
   nomC varchar(30),
   PRIMARY KEY (codeC)
);
--
-- Contenu de la table collection
--
INSERT INTO collection VALUES ('C01', 'Tintin');
INSERT INTO collection VALUES ('C02', 'Asterix');
INSERT INTO collection VALUES ('C03', 'Lucky Luck');
INSERT INTO collection VALUES ('C04', 'Largo Winch');
INSERT INTO collection VALUES ('C05', 'Gaston Lagaffe');
INSERT INTO collection VALUES ('C06', 'Les mondes d''aldebaran');
INSERT INTO collection VALUES ('C07', 'Lady S');



--
-- Structure de la table theme
--
CREATE TABLE theme (
	 codeT varchar(3) NOT NULL,
   nomT varchar(30),
   PRIMARY KEY (codeT)
);
--
-- Contenu de la table theme
--
INSERT INTO theme VALUES ('T01', 'Aventure');
INSERT INTO theme VALUES ('T02', 'Humour');
INSERT INTO theme VALUES ('T03', 'Policier');
INSERT INTO theme VALUES ('T04', 'Science-fiction');
INSERT INTO theme VALUES ('T05', 'Business-thriller');
INSERT INTO theme VALUES ('T06', 'Espionnage');
INSERT INTO theme VALUES ('T07', 'Historique');
INSERT INTO theme VALUES ('T08', 'Fantastique');


--
-- Structure de la table theme-collection
--
CREATE TABLE themeCollection (
	 theme varchar(3) NOT NULL references theme(codeT),
   collection varchar(3) NOT NULL references collection(codeC),
   PRIMARY KEY (theme,collection)
);
--
-- Contenu de la table theme
--
INSERT INTO themeCollection VALUES ('T04', 'C01');
INSERT INTO themeCollection VALUES ('T01', 'C03');
INSERT INTO themeCollection VALUES ('T03', 'C01');
INSERT INTO themeCollection VALUES ('T02', 'C05');
INSERT INTO themeCollection VALUES ('T04', 'C06');
INSERT INTO themeCollection VALUES ('T01', 'C01');
INSERT INTO themeCollection VALUES ('T02', 'C03');
INSERT INTO themeCollection VALUES ('T01', 'C06');
INSERT INTO themeCollection VALUES ('T02', 'C02');
INSERT INTO themeCollection VALUES ('T05', 'C04');
INSERT INTO themeCollection VALUES ('T06', 'C07');


--
-- Structure de la table auteur
--
CREATE TABLE auteur (
	 codeA varchar(3) NOT NULL,
   nomA varchar(30) NOT NULL,
	 prenomA varchar(30) NOT NULL,
	 pseudoA varchar(30),
	 nationalite varchar(30),
   PRIMARY KEY (codeA)
);
--
-- Contenu de la table auteur
--
INSERT INTO auteur VALUES ('A01', 'de Bevere', 'Maurice', 'Morris', 'BELGE');
INSERT INTO auteur VALUES ('A02', 'Uderzo', 'Albert', NULL, 'Francaise');
INSERT INTO auteur VALUES ('A03', 'Gosciny', 'Rene', NULL, 'FRANCAISE');
INSERT INTO auteur VALUES ('A04', 'Remi', 'Georges', 'Hergé', 'Belge');
INSERT INTO auteur VALUES ('A05', 'Roba', 'Jean', NULL, 'belge');
INSERT INTO auteur VALUES ('A06', 'Franquin', 'Andre', NULL, 'BELGE');
INSERT INTO auteur VALUES ('A07', 'Francq', 'Philippe', NULL, 'BELGE');
INSERT INTO auteur VALUES ('A08', 'Van Hamme', 'Jean', NULL, 'Belge');
INSERT INTO auteur VALUES ('A09', 'Aymond', 'Philippe', NULL, 'francaise');
INSERT INTO auteur VALUES ('A10', 'de Oliveira', 'Luiz Eduardo', 'Leo', 'Bresilienne');




--
-- Structure de la table editeur
--
CREATE TABLE editeur (
	 codeE varchar(3) NOT NULL,
   nomE varchar(30) NOT NULL,
	 pays varchar(30),
   PRIMARY KEY (codeE)
);
--
-- Contenu de la table editeur
--
INSERT INTO editeur VALUES ('E01', 'Dupuis', 'Belgique');
INSERT INTO editeur VALUES ('E02', 'Dargaud', 'France');
INSERT INTO editeur VALUES ('E03', 'Casterman', 'Belgique');



--
-- Structure de la table livre
--
CREATE TABLE livre (
	 numL integer NOT NULL,
   titre varchar(50) NOT NULL,
	 collection varchar(3) NOT NULL references collection(codeC) on delete cascade,
	 dessinateur varchar(3) NOT NULL references auteur(codeA),
	 scenariste varchar(3) NOT NULL references auteur(codeA),
	 editeur varchar(3) references editeur(codeE),
	 anneeED integer,
   PRIMARY KEY (collection,numL)
);
--
-- Contenu de la table livre
--
INSERT INTO livre VALUES (5, 'La Créature', 'C06', 'A10', 'A10', 'E02', 1998);
INSERT INTO livre VALUES (7, 'Les Survivants', 'C06', 'A10', 'A10', 'E02', 2001);
INSERT INTO livre VALUES (3, 'La Photo', 'C06', 'A10', 'A10', 'E02', 1996);
INSERT INTO livre VALUES (1, 'La Catastrophe', 'C06', 'A10', 'A10', 'E02', 1994);
INSERT INTO livre VALUES (6, 'La Planète', 'C06', 'A10', 'A10', 'E02', 2000);
INSERT INTO livre VALUES (2, 'La Blonde', 'C06', 'A10', 'A10', 'E02', 1995);
INSERT INTO livre VALUES (4, 'Le Groupe', 'C06', 'A10', 'A10', 'E02', 1997);

INSERT INTO livre VALUES (10, 'ADN', 'C07', 'A09', 'A09', 'E01', 2014);
INSERT INTO livre VALUES (6, 'Salade portugaise', 'C07', 'A09', 'A08', 'E01', 2009);
INSERT INTO livre VALUES (12, 'Rapport de forces', 'C07', 'A09', 'A09', 'E01', 2016);
INSERT INTO livre VALUES (5, 'Une taupe à Washington', 'C07', 'A09', 'A08', 'E01', 2008);

INSERT INTO livre VALUES (23, 'Les Dalton courent toujours', 'C03', 'A01', 'A03', 'E01', 1964);
INSERT INTO livre VALUES (45, 'L''Empereur Smith', 'C03', 'A01', 'A03',  'E02', 1976);
INSERT INTO livre VALUES (32, 'La Diligence', 'C03', 'A01', 'A03', 'E02', 1968);
INSERT INTO livre VALUES (38, 'Ma Dalton', 'C03', 'A01', 'A03', 'E02', 1971);
INSERT INTO livre VALUES (24, 'La Caravane', 'C03', 'A01', 'A03', 'E01', 1964);
INSERT INTO livre VALUES (22, 'Les Dalton dans le blizzard', 'C03', 'A01', 'A03', 'E01', 1963);
INSERT INTO livre VALUES (8, 'Phil Defer', 'C03', 'A01', 'A01', 'E01', 1956);
INSERT INTO livre VALUES (16, 'En remontant le Mississippi', 'C03', 'A01', 'A03', 'E01', 1961);

INSERT INTO livre VALUES (14, 'La Saga des gaffes', 'C05', 'A06', 'A06', 'E01', 1982);
INSERT INTO livre VALUES (9, 'Le Cas Lagaffe', 'C05', 'A06', 'A06', 'E01', 1971);
INSERT INTO livre VALUES (7, 'Un gaffeur sachant gaffer', 'C05', 'A06', 'A06', 'E01', 1969);

INSERT INTO livre VALUES (7, 'La Forteresse de Makiling', 'C04', 'A07', 'A08', 'E01', 1996);
INSERT INTO livre VALUES (15, 'Les Trois Yeux des gardiens du Tao', 'C04', 'A07', 'A08', 'E01', 2007);
INSERT INTO livre VALUES (8, 'L''Heure du Tigre', 'C04', 'A07', 'A08', 'E01', 1997);
INSERT INTO livre VALUES (16, 'La Voie et la Vertu', 'C04', 'A07', 'A08', 'E01', 2008);

INSERT INTO livre VALUES (16, 'Objectif Lune', 'C01', 'A04', 'A04', 'E03', 1953);
INSERT INTO livre VALUES (14, 'Le Temple du Soleil', 'C01', 'A04', 'A04', 'E03', 1949);
INSERT INTO livre VALUES (23, 'Tintin et les Picaros', 'C01', 'A04', 'A04', 'E03', 1976);

INSERT INTO livre VALUES (15, 'La Zizanie', 'C02', 'A02', 'A03', 'E02', 1970);
INSERT INTO livre VALUES (7, 'Le Combat des chefs', 'C02', 'A02', 'A03', 'E02', 1966);
INSERT INTO livre VALUES (1, 'Asterix le Gaulois', 'C02', 'A02', 'A03', 'E02', 1961);
INSERT INTO livre VALUES (8, 'Asterix chez les Bretons', 'C02', 'A02', 'A03', 'E02', 1966);
