--1.
SELECT BATEAU.nombat
FROM (BATEAU NATURAL JOIN RESULTAT) NATURAL JOIN COMPETITION
WHERE COMPETITION.nomcomp = 'Le Figaro'
ORDER BY RESULTAT.rang ASC
LIMIT 1;

/*
SELECT BATEAU.nombat
FROM (BATEAU NATURAL JOIN RESULTAT) NATURAL JOIN COMPETITION
WHERE COMPETITION.nomcomp = 'Le Figaro'
ORDER BY RESULTAT.rang ASC
LIMIT 1;
*/

--2.
SELECT B.nbat
FROM BATEAU B
WHERE
NOT EXISTS
    (SELECT *
    FROM COMPETITION C
    WHERE
    NOT EXISTS
        ( SELECT *
        FROM INSCRIPTION I
        WHERE C.ncomp = I.ncomp
        AND I.nbat = B.nbat));
        
SELECT BATEAU.nbat
FROM BATEAU NATURAL JOIN INSCRIPTION NATURAL JOIN COMPETITION
GROUP BY BATEAU.nbat
HAVING COUNT(INSCRIPTION.nbat) = (SELECT count(ncomp) FROM COMPETITION);

/* nbat 
------
(0 ligne)
*/

--3.

SELECT DISTINCT BATEAU.nombat
FROM BATEAU NATURAL JOIN INSCRIPTION
WHERE BATEAU.nbat NOT IN (SELECT nbat FROM RESULTAT);

/*
      nombat      
------------------
 Banque Populaire
 Groupama 3
(2 lignes)
*/

--4.
SELECT DISTINCT BATEAU.nombat
FROM BATEAU
WHERE BATEAU.nbat NOT IN (SELECT nbat FROM RESULTAT WHERE rang = 1);

/*
       nombat        
---------------------
 Sodebo
 VdP2
 Veolia
 Bretagne
 Banque Populaire
 Alinghi
 Groupama 3
 Normandy Elite Team
(8 lignes)
*/

--5.
SELECT CATEGORIE.*, count(BATEAU.nbat) as nombrebateau
FROM CATEGORIE NATURAL JOIN BATEAU
GROUP BY CATEGORIE.ncat;

/*
 ncat |    libelle    | nombrebateau 
------+---------------+--------------
    2 | Monocoque     |            4
    4 | Classe Unique |            3
    1 | Ultime        |            5
(3 lignes)
*/

--6.
SELECT DISTINCT sponsor
FROM BATEAU;

/*
          sponsor          
---------------------------
 Bel
 Credit Mutuel de Bretagne
 Groupama
 Alinghi
 Region Haute Normandie
 Ville de Paris
 Maitre Coq
 Sodebo
 Veolia
 Banque Populaire
 Bonduelle
(11 lignes)
*/

--7.
SELECT BATEAU.*
FROM BATEAU NATURAL JOIN (SELECT nbat, rang FROM RESULTAT WHERE rang = 1)i
GROUP BY BATEAU.nbat
HAVING count(rang) > 1;

/*
 nbat |   nombat   | sponsor | ncat 
------+------------+---------+------
    3 | Groupe Bel | Bel     |    2
(1 ligne)
*/
