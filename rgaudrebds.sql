-- REQUETES SQL --

-- 1.

SELECT  L.numL, L.titre, L.collection
FROM livre L
WHERE L.dessinateur IN (SELECT DISTINCT scenariste FROM livre)
ORDER BY L.collection, L.titre;


SELECT  L.numL, L.titre, L.collection
FROM livre L INNER JOIN (SELECT DISTINCT scenariste FROM livre) L2 ON L.dessinateur = L2.scenariste
ORDER BY L.collection, L.titre;

/*

 numl |            titre            | collection 
------+-----------------------------+------------
   14 | Le Temple du Soleil         | C01
   16 | Objectif Lune               | C01
   23 | Tintin et les Picaros       | C01
   16 | En remontant le Mississippi | C03
   45 | L'Empereur Smith            | C03
   24 | La Caravane                 | C03
   32 | La Diligence                | C03
   23 | Les Dalton courent toujours | C03
   22 | Les Dalton dans le blizzard | C03
   38 | Ma Dalton                   | C03
    8 | Phil Defer                  | C03
   14 | La Saga des gaffes          | C05
    9 | Le Cas Lagaffe              | C05
    7 | Un gaffeur sachant gaffer   | C05
    2 | La Blonde                   | C06
    1 | La Catastrophe              | C06
    5 | La Créature                 | C06
    3 | La Photo                    | C06
    6 | La Planète                  | C06
    4 | Le Groupe                   | C06
    7 | Les Survivants              | C06
   10 | ADN                         | C07
   12 | Rapport de forces           | C07
    6 | Salade portugaise           | C07
    5 | Une taupe à Washington      | C07
(25 lignes)
*/

-- 2.

SELECT  L.numL, L.titre, L.collection
FROM livre L INNER JOIN livre L2 on L.numL = L2.numL AND L.dessinateur = L2.scenariste
ORDER BY L.collection, L.titre;

/*
 numl |           titre           | collection 
------+---------------------------+------------
   14 | Le Temple du Soleil       | C01
   16 | Objectif Lune             | C01
   23 | Tintin et les Picaros     | C01
    8 | Phil Defer                | C03
   14 | La Saga des gaffes        | C05
    9 | Le Cas Lagaffe            | C05
    7 | Un gaffeur sachant gaffer | C05
    2 | La Blonde                 | C06
    1 | La Catastrophe            | C06
    5 | La Créature               | C06
    3 | La Photo                  | C06
    6 | La Planète                | C06
    4 | Le Groupe                 | C06
    7 | Les Survivants            | C06
   10 | ADN                       | C07
   12 | Rapport de forces         | C07
(16 lignes)
*/

-- 3.
SELECT A.prenomA, A.nomA, count(L.numL) as NBLIVREDESSINESCENARISE
FROM AUTEUR A INNER JOIN livre L ON A.codeA = L.dessinateur AND A.codeA = L.scenariste
GROUP BY A.codeA;

/*
   prenoma    |    noma     | nblivredessinescenarise 
--------------+-------------+-------------------------
 Maurice      | de Bevere   |                       1
 Georges      | Remi        |                       3
 Luiz Eduardo | de Oliveira |                       7
 Andre        | Franquin    |                       3
 Philippe     | Aymond      |                       2
(5 lignes)
*/

-- 4.

SELECT DISTINCT A1.nationalite NATIONALITEDESSINATEUR, A1.nomA, A2.nationalite NATIONALITESCENARISTE, A2.nomA
FROM (livre L INNER JOIN auteur A1 ON L.dessinateur = A1.codeA) INNER JOIN auteur A2 ON A2.codeA = L.scenariste;

/*
 nationalitedessinateur |    noma     | nationalitescenariste |    noma     
------------------------+-------------+-----------------------+-------------
 Francaise              | Uderzo      | FRANCAISE             | Gosciny
 francaise              | Aymond      | Belge                 | Van Hamme
 BELGE                  | de Bevere   | BELGE                 | de Bevere
 BELGE                  | Francq      | Belge                 | Van Hamme
 Belge                  | Remi        | Belge                 | Remi
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny
 francaise              | Aymond      | francaise             | Aymond
 BELGE                  | Franquin    | BELGE                 | Franquin
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira
(9 lignes)
*/


-- 5. 

SELECT A1.nationalite NATIONALITEDESSINATEUR, A1.nomA, A2.nationalite NATIONALITESCENARISTE, A2.nomA, L.collection, L.titre
FROM (livre L INNER JOIN auteur A1 ON L.dessinateur = A1.codeA) INNER JOIN auteur A2 ON A2.codeA = L.scenariste
ORDER BY L.collection, L.titre;

/* nationalitedessinateur |    noma     | nationalitescenariste |    noma     | collection |               titre                
------------------------+-------------+-----------------------+-------------+------------+------------------------------------
 Belge                  | Remi        | Belge                 | Remi        | C01        | Le Temple du Soleil
 Belge                  | Remi        | Belge                 | Remi        | C01        | Objectif Lune
 Belge                  | Remi        | Belge                 | Remi        | C01        | Tintin et les Picaros
 Francaise              | Uderzo      | FRANCAISE             | Gosciny     | C02        | Asterix chez les Bretons
 Francaise              | Uderzo      | FRANCAISE             | Gosciny     | C02        | Asterix le Gaulois
 Francaise              | Uderzo      | FRANCAISE             | Gosciny     | C02        | La Zizanie
 Francaise              | Uderzo      | FRANCAISE             | Gosciny     | C02        | Le Combat des chefs
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | En remontant le Mississippi
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | L'Empereur Smith
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | La Caravane
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | La Diligence
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | Les Dalton courent toujours
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | Les Dalton dans le blizzard
 BELGE                  | de Bevere   | FRANCAISE             | Gosciny     | C03        | Ma Dalton
 BELGE                  | de Bevere   | BELGE                 | de Bevere   | C03        | Phil Defer
 BELGE                  | Francq      | Belge                 | Van Hamme   | C04        | L'Heure du Tigre
 BELGE                  | Francq      | Belge                 | Van Hamme   | C04        | La Forteresse de Makiling
 BELGE                  | Francq      | Belge                 | Van Hamme   | C04        | La Voie et la Vertu
 BELGE                  | Francq      | Belge                 | Van Hamme   | C04        | Les Trois Yeux des gardiens du Tao
 BELGE                  | Franquin    | BELGE                 | Franquin    | C05        | La Saga des gaffes
 BELGE                  | Franquin    | BELGE                 | Franquin    | C05        | Le Cas Lagaffe
 BELGE                  | Franquin    | BELGE                 | Franquin    | C05        | Un gaffeur sachant gaffer
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | La Blonde
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | La Catastrophe
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | La Créature
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | La Photo
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | La Planète
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | Le Groupe
 Bresilienne            | de Oliveira | Bresilienne           | de Oliveira | C06        | Les Survivants
 francaise              | Aymond      | francaise             | Aymond      | C07        | ADN
 francaise              | Aymond      | francaise             | Aymond      | C07        | Rapport de forces
 francaise              | Aymond      | Belge                 | Van Hamme   | C07        | Salade portugaise
 francaise              | Aymond      | Belge                 | Van Hamme   | C07        | Une taupe à Washington
(33 lignes)
*/
