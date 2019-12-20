drop table chambreReservee;
Drop table chambre;
Drop table hotel;
drop table reservation;
drop table client;


Create table hotel (
  numH integer unique primary key,
  nomH char(30),
  adresse char(30),
  ville char(20),
  categorie integer);

insert into hotel values (1, 'Majestic', '10 La Croisette', 'Cannes', 5);
insert into hotel values (2, 'Brueghel', '3 parvis St Maurice', 'Lille', 2);
insert into hotel values (3, 'Martinez', '73 La Croisette', 'Cannes', 5);
insert into hotel values (4, 'Faidherbe', '42 Place De La Gare', 'Lille', 1);
insert into hotel values (5, 'du levant', '18 rue de la Harpe', 'Paris', 3);
insert into hotel values (6, 'Le clos Medicis', '56, rue Monsieur Le Prince', 'Paris', 3);
insert into hotel values (7, 'Hilton', '70 quai Charles de Gaulle ', 'Lyon', 4);
insert into hotel values (8, 'Vaubecour', '28 rue Vaubecour', 'Lyon', 0);
insert into hotel values (9, 'Cour des Loges', '6 rue du Boeuf', 'Lyon', 5);
insert into hotel values (10, 'Majestic', '2 rue de Condé', 'Bordeaux', 3);

Create table chambre (
  numH integer,
  numCh integer,
  typeSdb char(5),
  pdj Boolean,
  primary key (numH, numCH) ,
  foreign key (numH) references hotel);

insert into chambre values (1, 1, 'sdb', 'f');
insert into chambre values (1, 2, 'sdb', 'f');
insert into chambre values (2, 101, 'sdb', 't');
insert into chambre values (2, 203, 'sde', 't');
insert into chambre values (2, 402, 'sde', 't');
insert into chambre values (3, 1, 'sdb', 'f');
insert into chambre values (3, 2, 'sdb', 'f');
insert into chambre values (3, 3, 'sde', 'f');
insert into chambre values (3, 4, 'sdb', 'f');
insert into chambre values (4, 1, 'sdb', 'f');
insert into chambre values (4, 2, 'part', 'f');
insert into chambre values (4, 101, 'part', 'f');
insert into chambre values (4, 203, 'sdb', 'f');
insert into chambre values (5, 1, 'sdb', 'f');
insert into chambre values (5, 2, 'sde', 'f');
insert into chambre values (6, 1, 'sdb', 't');
insert into chambre values (6, 2, 'sdb', 't');
insert into chambre values (7, 102, 'sdb', 'f');
insert into chambre values (7, 204, 'sdb', 'f');
insert into chambre values (7, 402, 'sdb', 'f');
insert into chambre values (8, 1, 'part', 'f');
insert into chambre values (8, 2, 'part', 'f');
insert into chambre values (8, 3, 'sdb', 'f');
insert into chambre values (9, 2, 'sdb', 'f');
insert into chambre values (10, 3, 'sdb', 'f');

create table client (
  ncli integer primary key,
  nomcli char (25),
  prenomcli char(25),
  villecli char (25));

insert into client values (1, 'Dupont', 'Pierre', 'Lille');
insert into client values (2, 'Cohen', 'Sarah', 'Bordeaux');
insert into client values (3, 'Blanc', 'Marie', 'Lille');
insert into client values (4, 'Cohen', 'David', 'Marcq');
insert into client values (5, 'Pasquale', 'Jean', 'Limoges');
insert into client values (6, 'Nguyen', 'Theo', 'Arras');
insert into client values (7, 'BenMati', 'Yazid', 'Marseille');
insert into client values (8, 'Delalune', 'Jean', 'Lyon');
insert into client values (9, 'BenMati', 'Ines', 'Marseille');

create table reservation (
   nresa integer primary key,
   dateArr Date,
   dateDep Date,
   ncli integer references client);

insert into reservation values (1, '11/18/2011', '11/21/2011', 1);
insert into reservation values (2, '10/18/2011', '10/21/2011', 2);
insert into reservation values (3, '11/18/2010', '11/21/2010', 3);
insert into reservation values (4, '1/1/2011', '1/2/2011', 4);
insert into reservation values (5, '1/18/2011', '1/21/2011', 1);
insert into reservation values (6, '4/18/2011', '4/21/2011', 1);
insert into reservation values (7, '5/18/2011', '5/21/2011', 3);
insert into reservation values (8, '6/18/2011', '6/21/2011', 5);
insert into reservation values (9, '7/18/2011', '7/21/2011', 6);
insert into reservation values (10, '8/18/2011', '8/21/2011', 7);
insert into reservation values (11, '9/18/2011', '9/21/2011', 8);
insert into reservation values (12, '10/11/2011', '10/12/2011', 9);
insert into reservation values (13, '11/11/2011', '11/13/2011', 6);
insert into reservation values (14, '10/12/2011', '10/14/2011', 5);
insert into reservation values (15, '11/12/2011', '11/13/2011', 4);
insert into reservation values (16, '10/14/2011', '10/17/2011', 2);
insert into reservation values (17, '11/17/2011', '11/21/2011', 4);
insert into reservation values (18, '10/18/2011', '10/21/2011', 7);
insert into reservation values (19, '11/18/2011', '11/21/2011', 8);
insert into reservation values (20, '10/5/2011', '10/7/2011', 1);
insert into reservation values (21, '3/18/2011', '3/21/2011', 1);
insert into reservation values (22, '3/18/2011', '3/21/2011', 2);
insert into reservation values (23, '2/18/2011', '2/21/2011', 3);
insert into reservation values (24, '4/18/2011', '4/21/2011', 5);
insert into reservation values (25, '5/18/2011', '5/21/2011', 6);
insert into reservation values (26, '10/18/2011', '10/21/2011', 7);
insert into reservation values (27, '6/3/2012', '6/5/2012', 1);
insert into reservation values (28, '6/3/2012', '6/5/2012', 2);

create table chambreReservee (
   nresa integer ,
   numH integer,
   numCh integer, 
   primary key (nresa, numH, numCh) ,
   foreign key (numH, numCh) references chambre (numH, numCh),
   foreign key (nresa) references reservation);

insert into chambreReservee values (1, 1, 2);
insert into chambreReservee values (1, 1, 1);
insert into chambreReservee values (2, 3, 3);
insert into chambreReservee values (2, 3, 2);
insert into chambreReservee values (3, 1, 2);
insert into chambreReservee values (4, 2, 101);
insert into chambreReservee values (5, 2, 203);
insert into chambreReservee values (6, 4, 2);
insert into chambreReservee values (6, 4, 1);
insert into chambreReservee values (7, 5, 1);
insert into chambreReservee values (8, 5, 2);
insert into chambreReservee values (9, 1, 1);
insert into chambreReservee values (10, 1, 2);
insert into chambreReservee values (11, 3, 1);
insert into chambreReservee values (12, 3, 4);
insert into chambreReservee values (12, 3, 2);
insert into chambreReservee values (13, 5, 2);
insert into chambreReservee values (14, 5, 1);
insert into chambreReservee values (15, 1, 2);
insert into chambreReservee values (16, 1, 1);
insert into chambreReservee values (17, 2, 101);
insert into chambreReservee values (18, 2, 402);
insert into chambreReservee values (19, 3, 2);
insert into chambreReservee values (20, 3, 1);
insert into chambreReservee values (21, 7, 102);
insert into chambreReservee values (21, 7, 204);
insert into chambreReservee values (21, 7, 402);
insert into chambreReservee values (22, 1, 2);
insert into chambreReservee values (23, 2, 101);
insert into chambreReservee values (24, 3, 4);
insert into chambreReservee values (25, 4, 1);
insert into chambreReservee values (25, 5, 2);
insert into chambreReservee values (26, 5, 1);
insert into chambreReservee values (27, 6, 1);
insert into chambreReservee values (28, 1, 2);
insert into chambreReservee values (28, 1, 1);
