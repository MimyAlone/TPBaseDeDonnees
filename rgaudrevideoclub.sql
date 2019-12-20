--1.
SELECT * 
FROM film;

/* nfilm |             titre             | anneeproduction |           realisateur            | ncat 
-------+-------------------------------+-----------------+----------------------------------+------
     1 | Good Morning England          |            2009 | Richard Curtis                   |    3
     2 | La-Haut                       |            2009 | Pete Docter                      |    1
     3 | Inglorious Basterds           |            2009 | Quentin Tarantino                |    6
     4 | The Reader                    |            2009 | Stephen Daldry                   |    5
     5 | Very Bad Trip                 |            2009 | Todd Philips                     |    3
     6 | Whatever Works                |            2009 | Woody Allen                      |    3
     7 | Gran Torino                   |            2009 | Clint Eastwood                   |    2
     8 | Il faut sauver le soldat Ryan |            1998 | Steven Spielberg                 |    6
     9 | Pulp Fiction                  |            1994 | Quentin Tarantino                |    2
    10 | Le Terminal                   |            2004 | Steven Spielberg                 |    5
    11 | Vicky Cristina Barcelona      |            2008 | Woody Allen                      |    3
    12 | Reservoir Dogs                |            1992 | Quentin Tarantino                |    2
    13 | Kill Bill Vol 1               |            2003 | Quentin Tarantino                |    2
    14 | Scoop                         |            2006 | Woody Allen                      |    3
    15 | L echange                     |            2008 | Clint Eastwood                   |    5
    16 | Kill Bill Vol 2               |            2004 | Quentin Tarantino                |    2
    17 | Taken                         |            2009 | Pierre Morel                     |    2
    18 | Charlie et la chocolaterie    |            2005 | Tim Burton                       |    3
    19 | Dark Shadows                  |            2010 | Tim Burton                       |    7
    20 | Public Enemies                |            2009 | Michael Mann                     |    2
    21 | Pirates des Caraibes 4        |            2010 | Rob Marshall                     |    3
    22 | Princesse Mononoke            |            2000 | Hayao Miyazaki                   |    1
    23 | Gladiator                     |            2000 | Ridley Scott                     |    2
    24 | La Vie des autres             |            2007 | Florian Henckel von Donnersmarch |    5
    25 | Ratatouille                   |            2007 | Brad Bird                        |    1
    26 | Va, vis et deviens            |            2003 | Radu Mihaileanu                  |    5
    27 | Slumdog Millionaire           |            2009 | Danny Boyle                      |    5
    28 | Frozen River                  |            2009 | Courtney Hunt                    |    5
    29 | Persepolis                    |            2007 | Marjane Satrapi                  |    1
    30 | Sixieme Sens                  |            2000 | M. Night Shyamalan               |    2
*/
--2.
SELECT upper(prenomab || nomab) as listeabon
FROM abonne;

/*    listeabon    
-----------------
 MARIEDUPONT
 RéBECCACOHEN
 LINGUYEN
 HOAYU
 DAMIENMARTIN
 SOPHIEDURANT
 YOUSSEFABDALLAH
 RAMZIBENATI
 STéPHANEDUPONT
 SIMONLEVY
 ZULI
 CLOEMARQUIS
(12 lignes)*/

--3.
SELECT titre 
FROM film 
WHERE anneeProduction < '2005';

/*             titre             
-------------------------------
 Il faut sauver le soldat Ryan
 Pulp Fiction
 Le Terminal
 Reservoir Dogs
 Kill Bill Vol 1
 Kill Bill Vol 2
 Princesse Mononoke
 Gladiator
 Va, vis et deviens
 Sixieme Sens
(10 lignes)
*/

--4.
SELECT titre 
FROM film 
WHERE anneeProduction > '2005' AND anneeProduction < '2010' 
ORDER BY titre asc;

/*          titre           
--------------------------
 Frozen River
 Good Morning England
 Gran Torino
 Inglorious Basterds
 L echange
 La Vie des autres
 La-Haut
 Persepolis
 Public Enemies
 Ratatouille
 Scoop
 Slumdog Millionaire
 Taken
 The Reader
 Very Bad Trip
 Vicky Cristina Barcelona
 Whatever Works
(17 lignes)*/

--5.
SELECT titre 
FROM film 
WHERE titre LIKE 'P%';
/*         titre          
------------------------
 Pulp Fiction
 Public Enemies
 Pirates des Caraibes 4
 Princesse Mononoke
 Persepolis
(5 lignes)*/

--6.
SELECT titre 
FROM film 
WHERE titre LIKE '%se%';

/* titre        
--------------------
 Reservoir Dogs
 Princesse Mononoke
 Persepolis
(3 lignes)*/

--7.
SELECT DISTINCT libelle 
FROM categorie,film 
WHERE categorie.ncat=film.ncat;

/*   libelle    
--------------
 Comedie
 Horreur
 Action
 Drame
 Historique
 Dessin Anime
(6 lignes)*/

--8.
SELECT Count(DISTINCT libelle) AS NbCategories 
FROM categorie,film 
WHERE categorie.ncat=film.ncat;

/* nbcategories 
--------------
            6
(1 ligne)*/

--9.
SELECT libelle, Count(titre) as NbFilms 
FROM categorie,film 
WHERE categorie.ncat=film.ncat 
GROUP BY libelle;

/*
   libelle    | nbfilms 
--------------+---------
 Comedie      |       7
 Horreur      |       1
 Action       |       9
 Drame        |       7
 Historique   |       2
 Dessin Anime |       4*/

--10.
SELECT round(AVG(NBemp),3) 
FROM (SELECT count(ndvd) as NBemp from abonne NATURAL JOIN emprunt group by nab) i;

/*
 round 
-------
 2.750
(1 ligne)
*/

--11.
SELECT titre 
FROM film INNER JOIN categorie ON film.ncat=categorie.ncat 
WHERE libelle='Drame';

/*        titre        
---------------------
 The Reader
 Le Terminal
 L echange
 La Vie des autres
 Va, vis et deviens
 Slumdog Millionaire
 Frozen River*/

--12.
SELECT titre,anneeProduction 
FROM film 
WHERE realisateur='Tim Burton';

/*
           titre            | anneeproduction 
----------------------------+-----------------
 Charlie et la chocolaterie |            2005
 Dark Shadows               |            2010
(2 lignes)*/

--13.
SELECT Count(titre) AS NbFilm 
FROM film 
WHERE realisateur='Clint Eastwood';

/* nbfilm 
--------
      2
(1 ligne)*/

--14.
SELECT nfilm,count(ndvd) AS nbDVD 
FROM film NATURAL JOIN DVD 
WHERE realisateur='Woody Allen'
GROUP BY nfilm;

/* nfilm | nbdvd 
-------+-------
     6 |     1
    11 |     2
    14 |     1
(3 lignes)*/


--15.
SELECT nfilm 
FROM film NATURAL JOIN DVD 
GROUP BY nfilm 
HAVING count(ndvd)>1;

/* nfilm 
-------
    27
    11
    17
     2
    15
    21
    19
    24
    29
    16
     4
     1
    22
     3
     7
(15 lignes)*/

--16.
SELECT nfilm,count(ndvd) as NbDVD 
FROM film NATURAL JOIN DVD 
GROUP BY nfilm 
HAVING count(ndvd)>1;

/* nfilm | nbdvd 
-------+-------
    27 |     3
    11 |     2
    17 |     4
     2 |     2
    15 |     2
    21 |     2
    19 |     2
    24 |     2
    29 |     2
    16 |     2
     4 |     2
     1 |     3
    22 |     2
     3 |     2
     7 |     4
(15 lignes)*/

--17.
SELECT nomab,prenomab 
FROM abonne,emprunt,dvd,film 
WHERE abonne.nab=emprunt.nab AND emprunt.ndvd=dvd.ndvd AND dvd.nfilm=film.nfilm AND film.titre='Pulp Fiction';

/* nomab  | prenomab 
--------+----------
 Cohen  | Rébecca
 Durant | Sophie
(2 lignes)*/

--18.
SELECT titre 
FROM film natural join categorie 
WHERE libelle='Drame'OR libelle='Action';

/*        titre        
---------------------
 The Reader
 Gran Torino
 Pulp Fiction
 Le Terminal
 Reservoir Dogs
 Kill Bill Vol 1
 L echange
 Kill Bill Vol 2
 Taken
 Public Enemies
 Gladiator
 La Vie des autres
 Va, vis et deviens
 Slumdog Millionaire
 Frozen River
 Sixieme Sens
(16 lignes)*/

--19.
SELECT titre
FROM film natural join DVD natural join emprunt natural join abonne 
WHERE nomab='Dupont'and prenomab='Marie';

/*        titre         
----------------------
 Good Morning England
 Persepolis
 Frozen River
 Persepolis
(4 lignes)*/


--20.
SELECT titre 
FROM film 
WHERE nfilm NOT IN (SELECT dvd.nfilm from emprunt INNER JOIN dvd ON emprunt.ndvd=dvd.ndvd);

/*             titre             
-------------------------------
 La-Haut
 The Reader
 Very Bad Trip
 Il faut sauver le soldat Ryan
 Le Terminal
 Taken
 Charlie et la chocolaterie
 Dark Shadows
 Public Enemies
 Pirates des Caraibes 4
 Princesse Mononoke
 Gladiator
 La Vie des autres
 Ratatouille
 Va, vis et deviens
 Slumdog Millionaire
 Sixieme Sens
(17 lignes)*/


--21.
SELECT titre 
FROM film,categorie 
WHERE film.ncat =categorie.ncat AND film.realisateur='Woody Allen' AND categorie.libelle='Drame';

/* titre 
-------
(0 ligne)*/

--22.
SELECT DISTINCT titre 
FROM FILM NATURAL JOIN dvd 
WHERE moisAchat=8 and anneeAchat=2009;

/*        titre        
---------------------
 Slumdog Millionaire
 Gran Torino
 La-Haut
(3 lignes)*/

--23. 
SELECT ABONNE.nomab, ABONNE.prenomab 
FROM film INNER JOIN dvd ON dvd.nfilm=film.nfilm INNER JOIN emprunt ON emprunt.ndvd=dvd.ndvd INNER JOIN ABONNE ON ABONNE.nab = emprunt.nab
WHERE realisateur='Woody Allen'
INTERSECT 
SELECT ABONNE.nomab, ABONNE.prenomab 
FROM film INNER JOIN dvd ON dvd.nfilm=film.nfilm INNER JOIN emprunt ON emprunt.ndvd=dvd.ndvd INNER JOIN ABONNE ON ABONNE.nab = emprunt.nab
WHERE realisateur='Clint Eastwood';

/*          titre           
--------------------------
 L echange
 Whatever Works
 Vicky Cristina Barcelona
 Gran Torino
 Scoop*/

--24.
SELECT F.* 
FROM FILM f
WHERE
NOT EXISTS
    (SELECT *
    FROM ABONNE A
    WHERE
    NOT EXISTS
        ( SELECT *
        FROM EMPRUNT E, DVD D
        WHERE F.nfilm = D.nfilm
        AND D.ndvd = E.ndvd
        AND A.nab = E.nab));

/*
 nfilm |        titre         | anneeproduction |  realisateur   | ncat 
-------+----------------------+-----------------+----------------+------
     1 | Good Morning England |            2009 | Richard Curtis |    3
(1 ligne)
*/

SELECT FILM.*
FROM ((FILM NATURAL JOIN DVD) NATURAL JOIN EMPRUNT) NATURAL JOIN ABONNE
GROUP BY FILM.nfilm
HAVING count(EMPRUNT.ndvd) = (SELECT count(nab) FROM ABONNE);



--25.
SELECT titre
FROM FILM 
WHERE anneeProduction < (SELECT anneeProduction 
FROM film 
WHERE realisateur='Tim Burton'
ORDER BY anneeProduction ASC
LIMIT 1);

/*
             titre             
-------------------------------
 Il faut sauver le soldat Ryan
 Pulp Fiction
 Le Terminal
 Reservoir Dogs
 Kill Bill Vol 1
 Kill Bill Vol 2
 Princesse Mononoke
 Gladiator
 Va, vis et deviens
 Sixieme Sens
(10 lignes)
*/

--26.
SELECT FILM.*
FROM FILM NATURAL JOIN DVD
GROUP BY FILM.nfilm
HAVING count(DVD.ndvd) = 0;

/*
 nfilm | titre | anneeproduction | realisateur | ncat 
-------+-------+-----------------+-------------+------
(0 ligne)
*/

--27.
SELECT A.*
FROM ABONNE A
WHERE
NOT EXISTS
    ( SELECT *
    FROM FILM F
    WHERE F.realisateur = 'Quantin Tarantino'
    AND NOT EXISTS
        ( SELECT * 
        FROM EMPRUNT E, DVD D
        WHERE A.nab = E.nab
        AND E.ndvd = D.ndvd
        AND D.nfilm = F.nfilm));
        
/*
 nab |  nomab   | prenomab 
-----+----------+----------
   1 | Dupont   | Marie
   2 | Cohen    | Rébecca
   3 | NGuyen   | Li
   4 | Yu       | Hoa
   5 | Martin   | Damien
   6 | Durant   | Sophie
   7 | Abdallah | Youssef
   8 | Benati   | Ramzi
   9 | Dupont   | Stéphane
  10 | Levy     | Simon
  11 | Li       | Zu
  12 | Marquis  | Cloe
(12 lignes)
*/

--28.
SELECT titre
FROM FILM
WHERE anneeProduction = 2008 OR anneeProduction = 2009;

/*          titre           
--------------------------
 Good Morning England
 La-Haut
 Inglorious Basterds
 The Reader
 Very Bad Trip
 Whatever Works
 Gran Torino
 Vicky Cristina Barcelona
 L echange
 Taken
 Public Enemies
 Slumdog Millionaire
 Frozen River
(13 lignes)*/

--29.
SELECT DISTINCT FILM.*
FROM FILM NATURAL JOIN DVD
WHERE anneeAchat = AnneeProduction;

/*
 nfilm |        titre         | anneeproduction |           realisateur            | ncat 
-------+----------------------+-----------------+----------------------------------+------
    17 | Taken                |            2009 | Pierre Morel                     |    2
    24 | La Vie des autres    |            2007 | Florian Henckel von Donnersmarch |    5
     7 | Gran Torino          |            2009 | Clint Eastwood                   |    2
     5 | Very Bad Trip        |            2009 | Todd Philips                     |    3
    16 | Kill Bill Vol 2      |            2004 | Quentin Tarantino                |    2
    19 | Dark Shadows         |            2010 | Tim Burton                       |    7
     1 | Good Morning England |            2009 | Richard Curtis                   |    3
     4 | The Reader           |            2009 | Stephen Daldry                   |    5
    12 | Reservoir Dogs       |            1992 | Quentin Tarantino                |    2
     6 | Whatever Works       |            2009 | Woody Allen                      |    3
     2 | La-Haut              |            2009 | Pete Docter                      |    1
    20 | Public Enemies       |            2009 | Michael Mann                     |    2
    13 | Kill Bill Vol 1      |            2003 | Quentin Tarantino                |    2
    26 | Va, vis et deviens   |            2003 | Radu Mihaileanu                  |    5
    27 | Slumdog Millionaire  |            2009 | Danny Boyle                      |    5
    28 | Frozen River         |            2009 | Courtney Hunt                    |    5
    25 | Ratatouille          |            2007 | Brad Bird                        |    1
    15 | L echange            |            2008 | Clint Eastwood                   |    5
(18 lignes)
*/

--30.
SELECT DISTINCT FILM.*
FROM FILM NATURAL JOIN DVD
WHERE AnneeProduction != 2007
AND AnneeProduction != 2008
AND AnneeProduction != 2009;

/* nfilm |             titre             | anneeproduction |    realisateur     | ncat 
-------+-------------------------------+-----------------+--------------------+------
     8 | Il faut sauver le soldat Ryan |            1998 | Steven Spielberg   |    6
    12 | Reservoir Dogs                |            1992 | Quentin Tarantino  |    2
    16 | Kill Bill Vol 2               |            2004 | Quentin Tarantino  |    2
    14 | Scoop                         |            2006 | Woody Allen        |    3
    13 | Kill Bill Vol 1               |            2003 | Quentin Tarantino  |    2
    30 | Sixieme Sens                  |            2000 | M. Night Shyamalan |    2
    22 | Princesse Mononoke            |            2000 | Hayao Miyazaki     |    1
    19 | Dark Shadows                  |            2010 | Tim Burton         |    7
    21 | Pirates des Caraibes 4        |            2010 | Rob Marshall       |    3
    18 | Charlie et la chocolaterie    |            2005 | Tim Burton         |    3
     9 | Pulp Fiction                  |            1994 | Quentin Tarantino  |    2
    26 | Va, vis et deviens            |            2003 | Radu Mihaileanu    |    5
    10 | Le Terminal                   |            2004 | Steven Spielberg   |    5
(13 lignes)
*/
