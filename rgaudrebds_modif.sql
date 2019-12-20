-- 1.
DELETE FROM theme WHERE nomt = 'Fantastique';

-- 2.
DELETE FROM theme WHERE codeT NOT IN (SELECT theme FROM themecollection);

-- 3.

ALTER TABLE livre ADD CONSTRAINT positivitenumL CHECK (numL>0); 

INSERT INTO livre (-1, 'La Créature', 'C06', 'A10', 'A10', 'E02', 1998);
/* Cette commande retourne une erreur la contrainte a donc été ajouté*/


-- 4.

/*Les informations relatives aux pays sont situées dans la table Auteur et la table Editeur.*/
/*Ajouter une table pays limitera la redondance et limitera l'espace mémoire utilisé.*/


/*La table doit contenir un code avec pour chaque pays le nom et la nationalite*/

CREATE TABLE pays (
	 codeP integer NOT NULL,
	 nomP varchar(50) NOT NULL,
	 nationalite varchar(50) NOT NULL,
   PRIMARY KEY (codeP)
);

/*Il faut intégrer tous les pays présents dans les tables auteur et editeur.*/

SELECT distinct nationalite FROM auteur;
SELECT distinct pays FROM editeur;

INSERT INTO pays VALUES (1,'Belgique','Belge');
INSERT INTO pays VALUES (2,'France','Francaise');
INSERT INTO pays VALUES (3,'Brésil','Bresilienne');

/*Il faut ajouter un nouvel attribut pays aux tables auteur et editeur, puis relier cette attribut au code pays correspondant de des individus auteur et editeur. Une fois que chacun est relié au bon pays on peut supprimer l'attribut nationalite de Auteur et l'attribut pays de editeur.*/

ALTER TABLE auteur
ADD pays integer REFERENCES pays(codeP);

ALTER TABLE editeur
RENAME COLUMN pays TO paysAncien;

ALTER TABLE editeur
ADD pays integer REFERENCES pays(codeP);

UPDATE auteur
SET pays = (SELECT codeP FROM pays WHERE upper(auteur.nationalite) = upper(pays.nationalite));

UPDATE editeur
SET pays = (SELECT codeP FROM pays WHERE upper(editeur.paysancien) = upper(pays.nomP));

ALTER TABLE auteur
DROP nationalite;

ALTER TABLE editeur
DROP paysancien;

-- 5.

INSERT INTO auteur (codeA, nomA, prenomA, pays)
    VALUES('A11', 'Diaz Canales', 'Juan', '3');
    
/* Le type du code pays n'est pas le même il faut le modifier pour avoir un code numérique*/

INSERT INTO auteur (codeA, nomA, prenomA, pays)
    VALUES('A11', 'Diaz Canales', 'Juan', '3');
    
-- 6.

/*Le modèle relationnel contient une table qui tient compte des prêt avec leur date si l'on doit retenir l'historique. Si un ami nous a emprunté 2 fois le même livre, on doit être capable de retrouver cette information. */

CREATE TABLE amis (
	 codeA varchar(3) NOT NULL,
	 nomA varchar(30) NOT NULL,
	 prenomA varchar(30),
   PRIMARY KEY (codeA)
);


CREATE TABLE pret (
	 codeL varchar(3) NOT NULL references livre(numL),
	 codeA varchar(30) NOT NULL references amis(codeA),
	 dateDebut date,
	 dateFin date,
   PRIMARY KEY (codeL, CodeA, dateDebut)
);
