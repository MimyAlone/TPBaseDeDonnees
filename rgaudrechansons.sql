1.
SELECT *
FROM CHANTEUR;

/* c_ref |     c_nom     |  c_prenom  
-------+---------------+------------
     1 | bashung       | alain
    10 | marienneau    | corinne
    11 | mc solar      | 
    12 | fauque        | jean
    13 | les valentins | 
    14 | zazie         | 
    15 | le forestier  | maxime
    16 | jonasz        | michel
    17 | cabrel        | francis
     2 | souchon       | alain
     3 | chamfort      | alain
     4 | springsteen   | bruce
    18 | renaud        | 
     5 | les innocents | 
     6 | telephone     | 
     7 | aubert        | jean-louis
     8 | bertignac     | louis
     9 | kolinka       | richard
(18 lignes)*/


2.
SELECT c_ref, c_libelle
FROM CATEGORIE
WHERE c_ref = 2;

/* c_ref | c_libelle 
-------+-----------
     2 | rock
(1 ligne)
*/

3.
SELECT upper(c_nom || c_prenom) as Personne
FROM CHANTEUR
WHERE c_nom is NOT NULL AND
c_prenom is NOT NULL;

/*      personne      
--------------------
 BASHUNGALAIN
 MARIENNEAUCORINNE
 FAUQUEJEAN
 LE FORESTIERMAXIME
 JONASZMICHEL
 CABRELFRANCIS
 SOUCHONALAIN
 CHAMFORTALAIN
 SPRINGSTEENBRUCE
 AUBERTJEAN-LOUIS
 BERTIGNACLOUIS
 KOLINKARICHARD
(12 lignes)*/

4.
SELECT c_titre
FROM CHANSON
WHERE c_annee < 1990;

/*       c_titre        
----------------------
 two hearts
 born in the USA
 bijou bijou
 manu
 independence day
 la bombe humaine
 hygiaphone
 dure limite
 metro (c'est trop)
 un autre monde
 jamais content
 poulaillers'song
 hungry heart
 les jours sans moi
 the river
 born to run
 thunder road
 night
 blinded by the light
 growin'up
(20 lignes)
*/

5.
SELECT d_titre
FROM DISQUE
WHERE d_annee > 1990 AND
d_annee < 1995
ORDER BY d_titre ASC;

/*       d_titre        
----------------------
 c'est deja ca
 chatterton
 fous a lier
 la totale
 neuf
 night
 qui seme le vent rec
(7 lignes)
*/

6.
SELECT c_titre
FROM CHANSON
WHERE left(c_titre,1) = 'm';

/*       c_titre        
----------------------
 ma petite entreprise
 madame reve
 manu
 malaxe
 metro (c'est trop)
 mens
 mon dernier soldat
(7 lignes)
*/

7.
SELECT c_titre
FROM CHANSON
WHERE c_titre LIKE '%mens%';

/*     c_titre     
-----------------
 la nuit je mens
 mens
(2 lignes)
*/



8.
SELECT DISTINCT c_ref
FROM CATEGORIE Inner join DISQUE ON c_ref = d_categ;

/* c_ref 
-------
     2
     4
     1
(3 lignes)
*/

9.
SELECT count(DISTINCT c_ref) as Nbcat
FROM CATEGORIE Inner join DISQUE ON c_ref = d_categ;

/* nbcat 
-------
     3
(1 ligne)
*/

10.
SELECT c_ref, count(d_ref) as NBDisque
FROM CATEGORIE Inner join DISQUE ON c_ref = d_categ
GROUP BY c_ref;

/* c_ref | nbdisque 
-------+----------
     2 |       10
     4 |        1
     1 |        7
(3 lignes)
*/

11.
SELECT avg(NBCHANSONS) MoyChansonsParDisque
FROM (SELECT count(c_ref) as NBCHANSONS
FROM (DISQUE INNER JOIN INTERPRETE ON D_ref = i_disque) INNER JOIN CHANSON ON i_chanson = c_ref
GROUP BY d_ref) i;

/* moychansonspardisque 
----------------------
   4.1111111111111111
(1 ligne)
*/


12.
SELECT d_titre
FROM DISQUE INNER JOIN CATEGORIE ON c_ref = d_categ
WHERE c_libelle = 'rock';

/*       d_titre        
----------------------
 born to run
 stockholm
 greetings from asbur
 greatest hits
 the river
 chatterton
 confessions publique
 fantaisie militaire
 night
 la totale
(10 lignes)
*/

13.
SELECT CHANSON.c_titre, CHANSON.c_annee
FROM (CHANSON INNER JOIN INTERPRETE ON i_chanson = CHANSON.c_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom ='springsteen';

/*         c_titre         | c_annee 
-------------------------+---------
 blinded by the light    |    1975
 manu                    |    1981
 growin'up               |    1975
 born in the USA         |    1984
 streets of philadelphia |    1993
 manu                    |    1981
 hungry heart            |    1979
 the river               |    1979
 two hearts              |    1980
 manu                    |    1981
 independence day        |    1980
 hungry heart            |    1979
 the river               |    1979
 born to run             |    1974
 thunder road            |    1975
 night                   |    1975
 manu                    |    1981
 born to run             |    1974
 thunder road            |    1975
(19 lignes)
*/

14.
SELECT count(CHANSON.c_ref) as NBCHANSON
FROM (CHANSON INNER JOIN INTERPRETE ON i_chanson = CHANSON.c_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom ='souchon';

/* nbchanson 
-----------
         9
(1 ligne)
*/

15.
SELECT d_titre, count(CHANSON.c_ref) as NBCHANSON
FROM ((DISQUE INNER JOIN INTERPRETE ON i_disque = d_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref) INNER JOIN CHANSON ON i_chanson = CHANSON.c_ref
WHERE c_nom ='springsteen'
GROUP BY d_titre;

/*       d_titre        | nbchanson 
----------------------+-----------
 the river            |         5
 greetings from asbur |         3
 greatest hits        |         7
 born to run          |         4
(4 lignes)
*/

16.
SELECT d_titre
FROM (DISQUE INNER JOIN INTERPRETE ON i_disque = d_ref)INNER JOIN CHANSON ON i_chanson = CHANSON.c_ref
GROUP BY d_titre
HAVING count(CHANSON.c_ref) > 3;

/*       d_titre        
----------------------
 qui seme le vent rec
 born to run
 night
 la totale
 c'est deja ca
 fantaisie militaire
 sol en si
 confessions publique
 the river
 greatest hits
 fous a lier
(11 lignes)
*/

17.
SELECT DISTINCT c_nom, c_prenom
FROM (DISQUE INNER JOIN INTERPRETE ON i_disque = d_ref) INNER JOIN CHANTEUR ON i_chanteur = c_ref
WHERE d_titre = 'sol en si';

/*    c_nom     | c_prenom 
--------------+----------
 le forestier | maxime
 zazie        | 
 souchon      | alain
 cabrel       | francis
(4 lignes)
*/

18.
SELECT c_nom, c_prenom
FROM CHANTEUR INNER JOIN GROUPE ON c_ref = g_refpers
WHERE g_refgroupe = (Select c_ref FROM CHANTEUR WHERE c_nom = 'telephone');

/*   c_nom    |  c_prenom  
------------+------------
 marienneau | corinne
 aubert     | jean-louis
 bertignac  | louis
 kolinka    | richard
(4 lignes)
*/

19.
SELECT DISTINCT c_nom, c_prenom
FROM ((CHANTEUR INNER JOIN INTERPRETE ON CHANTEUR.c_ref = INTERPRETE.i_disque) INNER JOIN DISQUE ON INTERPRETE.i_disque = DISQUE.d_ref) INNER JOIN CATEGORIE ON DISQUE.d_categ = CATEGORIE.c_ref
WHERE CATEGORIE.c_libelle = 'rock';

/*     c_nom     |  c_prenom  
---------------+------------
 bashung       | alain
 marienneau    | corinne
 bertignac     | louis
 aubert        | jean-louis
 kolinka       | richard
 souchon       | alain
 springsteen   | bruce
 les innocents | 
 chamfort      | alain
 telephone     | 
(10 lignes)
*/

20.
SELECT CHANSON.c_ref, CHANSON.c_titre, CHANSON.c_annee, count (INTERPRETE.i_chanteur) AS NBINTERPRETE
FROM (CHANSON INNER JOIN INTERPRETE ON CHANSON.c_ref = INTERPRETE.i_chanson)
GROUP BY CHANSON.c_ref;

/* c_ref |            c_titre             | c_annee | nbinterprete 
-------+--------------------------------+---------+--------------
    43 | mon dernier soldat             |    1991 |            1
     8 | blinded by the light           |    1975 |            1
    11 | streets of philadelphia        |    1993 |            1
    39 | un homme extraordinaire        |    1991 |            1
    16 | madame reve                    |    1991 |            1
    47 | a temps partiel                |    1991 |            1
     3 | hungry heart                   |    1979 |            2
    14 | ma petite entreprise           |    1994 |            1
    46 | bouge de la                    |    1991 |            1
    48 | jolie louise                   |         |            3
    17 | manu                           |    1981 |           18
    28 | jamais content                 |    1977 |            1
    36 | l'ennemi dans la glace         |    1993 |            1
    15 | bijou bijou                    |    1979 |            1
    30 | c'est deja ca                  |    1993 |            3
     4 | the river                      |    1979 |            2
    33 | arlette laguiller              |    1993 |            1
    40 | qui seme le vent recolte le te |    1991 |            1
    19 | la nuit je mens                |    1998 |            1
    23 | la bombe humaine               |    1979 |            2
    31 | foule sentimentale             |    1993 |            1
    35 | personne n'aime personne       |    1990 |            1
    20 | fantaisie militaire            |    1998 |            1
    37 | la femme de ma vie             |    1990 |            1
    34 | les jours sans moi             |    1985 |            1
    25 | dure limite                    |    1980 |            2
    12 | a perte de vue                 |    1994 |            2
     1 | two hearts                     |    1980 |            1
    10 | born in the USA                |    1984 |            1
    42 | victime de la mode             |    1991 |            1
    26 | metro (c'est trop)             |    1977 |            1
    18 | malaxe                         |    1998 |            1
    13 | que n'ai-je                    |    1994 |            1
    22 | ocean                          |    1997 |            1
     9 | growin'up                      |    1975 |            1
    24 | hygiaphone                     |    1977 |            1
    45 | fous a lier                    |    1991 |            1
    27 | un autre monde                 |    1984 |            1
    38 | mens                           |    1993 |            1
     6 | thunder road                   |    1975 |            2
    29 | poulaillers'song               |    1977 |            2
     2 | independence day               |    1980 |            1
    41 | l'autre finistere              |    1991 |            1
     5 | born to run                    |    1974 |            2
     7 | night                          |    1975 |            1
(45 lignes)
*/

21.
SELECT DISTINCT CHANSON.c_titre, CHANSON.c_annee
FROM (CHANSON INNER JOIN INTERPRETE ON CHANSON.c_ref = INTERPRETE.i_chanson) INNER JOIN CHANTEUR ON CHANTEUR.c_ref = INTERPRETE.i_chanteur
WHERE CHANSON.c_annee = (SELECT c_annee FROM CHANSON WHERE c_annee > 0 ORDER BY c_annee DESC LIMIT 1);

/*       c_titre       | c_annee 
---------------------+---------
 la nuit je mens     |    1998
 fantaisie militaire |    1998
 malaxe              |    1998
(3 lignes)
*/

22.
SELECT CHANSON.c_titre, CHANSON.c_annee
FROM (CHANSON INNER JOIN INTERPRETE ON CHANSON.c_ref = INTERPRETE.i_chanson) INNER JOIN CHANTEUR ON CHANTEUR.c_ref = INTERPRETE.i_chanteur
WHERE CHANTEUR.c_nom = 'souchon'
ORDER BY CHANSON.c_annee DESC;

/*      c_titre       | c_annee 
--------------------+---------
 jolie louise       |        
 foule sentimentale |    1993
 arlette laguiller  |    1993
 c'est deja ca      |    1993
 les jours sans moi |    1985
 manu               |    1981
 poulaillers'song   |    1977
 poulaillers'song   |    1977
 jamais content     |    1977
(9 lignes)
*/

23.
(SELECT DISTINCT c_nom, c_prenom
FROM ((CHANTEUR INNER JOIN INTERPRETE ON CHANTEUR.c_ref = INTERPRETE.i_disque) INNER JOIN DISQUE ON INTERPRETE.i_disque = DISQUE.d_ref) INNER JOIN CATEGORIE ON DISQUE.d_categ = CATEGORIE.c_ref
WHERE CATEGORIE.c_libelle = 'rock')
UNION
(SELECT DISTINCT c_nom, c_prenom
FROM ((CHANTEUR INNER JOIN INTERPRETE ON CHANTEUR.c_ref = INTERPRETE.i_disque) INNER JOIN DISQUE ON INTERPRETE.i_disque = DISQUE.d_ref) INNER JOIN CATEGORIE ON DISQUE.d_categ = CATEGORIE.c_ref
WHERE CATEGORIE.c_libelle = 'rap');

24.
SELECT *
FROM CHANSON
WHERE c_titre LIKE '%la%' AND
c_annee < 1995;

/*     c_nom     |  c_prenom  
---------------+------------
 aubert        | jean-louis
 bashung       | alain
 bertignac     | louis
 chamfort      | alain
 kolinka       | richard
 les innocents | 
 marienneau    | corinne
 renaud        | 
 souchon       | alain
 springsteen   | bruce
 telephone     | 
(11 lignes)
*/

25.
SELECT c_nom
FROM CHANTEUR
WHERE c_ref NOT IN (SELECT i_chanteur FROM INTERPRETE);

/*     c_nom     
---------------
 marienneau
 fauque
 les valentins
 jonasz
 bertignac
 kolinka
(6 lignes)
*/

26.
SELECT c_nom
FROM CHANTEUR
WHERE c_ref NOT IN (SELECT i_chanteur FROM INTERPRETE);

/*     c_nom     
---------------
 marienneau
 fauque
 les valentins
 jonasz
 bertignac
 kolinka
(6 lignes)
*/

27.
SELECT DISTINCT c1.c_nom, c2.c_nom
FROM CHANTEUR c1, CHANTEUR c2
WHERE c1.c_ref < c2.c_ref;

/* telephone     | mc solar
 telephone     | renaud
 telephone     | zazie
 zazie         | cabrel
 zazie         | jonasz
 zazie         | le forestier
 zazie         | renaud
(153 lignes)
*/

28.
SELECT DISTINCT c1.c_nom, c2.c_nom
FROM CHANTEUR c1, CHANTEUR c2
WHERE c1.c_ref < c2.c_ref AND 
c1.c_ref NOT IN (SELECT DISTINCT g_refgroupe FROM GROUPE)  AND 
c2.c_ref NOT IN (SELECT DISTINCT g_refgroupe FROM GROUPE)
ORDER BY c1.c_nom;

/* springsteen   | aubert
 springsteen   | kolinka
 zazie         | jonasz
 zazie         | le forestier
 zazie         | cabrel
 zazie         | renaud
(136 lignes)
*/

29.
SELECT DISTINCT D.d_titre
FROM (DISQUE D INNER JOIN INTERPRETE I ON D.d_ref = I.i_disque) INNER JOIN CHANSON C ON I.i_chanson = C.c_ref
WHERE D.d_titre = C.c_titre;

/*       d_titre       
---------------------
 fous a lier
 born to run
 c'est deja ca
 jamais content
 the river
 fantaisie militaire
(6 lignes)
*/

30.
SELECT DISTINCT D.*
FROM (DISQUE D INNER JOIN INTERPRETE ON i_disque = D.d_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom != 'springsteen' AND D.d_annee < (SELECT D.d_annee
FROM (DISQUE D INNER JOIN INTERPRETE ON i_disque = D.d_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom ='springsteen'
ORDER BY D.d_annee ASC
LIMIT 1);

/* d_ref | d_titre | d_annee | d_categ 
-------+---------+---------+---------
(0 ligne)
*/

31.
SELECT DISTINCT D.*
FROM (DISQUE D INNER JOIN INTERPRETE ON i_disque = D.d_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom != 'springsteen' AND D.d_annee < (SELECT D.d_annee
FROM (DISQUE D INNER JOIN INTERPRETE ON i_disque = D.d_ref) INNER JOIN CHANTEUR ON i_chanteur = CHANTEUR.c_ref
WHERE c_nom ='springsteen'
ORDER BY D.d_annee DESC
LIMIT 1);


/* d_ref |       d_titre        | d_annee | d_categ 
-------+----------------------+---------+---------
     8 | night                |    1991 |       2
    11 | c'est deja ca        |    1993 |       1
    16 | trouble              |    1990 |       1
    18 | qui seme le vent rec |    1991 |       4
     5 | chatterton           |    1994 |       2
    17 | fous a lier          |    1991 |       1
     9 | la totale            |    1994 |       2
    13 | nickel               |    1990 |       1
    15 | neuf                 |    1993 |       1
    12 | jamais content       |    1977 |       1
(10 lignes)
*/





	
