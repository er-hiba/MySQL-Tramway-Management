mysql> create database Tramway;
Query OK, 1 row affected (0.02 sec)

mysql> use Tramway;
Database changed
mysql> create table Arrondissement (
    -> NumARD smallint primary key,
    -> superficie double,
    -> nbrHabitants int);
Query OK, 0 rows affected (0.04 sec)

mysql> show create table Arrondissement;
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table          | Create Table                                                                                                                                                                                                                     |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Arrondissement | CREATE TABLE `arrondissement` (
  `NumARD` smallint NOT NULL,
  `superficie` double DEFAULT NULL,
  `nbrHabitants` int DEFAULT NULL,
  PRIMARY KEY (`NumARD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into Arrondissement
    -> values(1, 5000, 100.196);
Query OK, 1 row affected (0.01 sec)

mysql> select * from Arrondissement;
+--------+------------+--------------+
| NumARD | superficie | nbrHabitants |
+--------+------------+--------------+
|      1 |       5000 |          100 |
+--------+------------+--------------+
1 row in set (0.00 sec)

mysql> update Arrondissement
    -> set nbrHabitants = 17924 where numARD = 1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Arrondissement;
+--------+------------+--------------+
| NumARD | superficie | nbrHabitants |
+--------+------------+--------------+
|      1 |       5000 |        17924 |
+--------+------------+--------------+
1 row in set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_tramway |
+-------------------+
| arrondissement    |
+-------------------+
1 row in set (0.00 sec)

mysql> create table Station(
    -> numStation smallint primary key,
    -> nomStation varchar(30),
    -> NumARD smallint,
    -> foreign key (NumARD) references Arrondissement(NumARD));
Query OK, 0 rows affected (0.08 sec)

mysql> show create table Station;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                                                                                                                                                                                  |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Station | CREATE TABLE `station` (
  `numStation` smallint NOT NULL,
  `nomStation` varchar(30) DEFAULT NULL,
  `NumARD` smallint DEFAULT NULL,
  PRIMARY KEY (`numStation`),
  KEY `NumARD` (`NumARD`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`NumARD`) REFERENCES `arrondissement` (`NumARD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> desc station;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| numStation | smallint    | NO   | PRI | NULL    |       |
| nomStation | varchar(30) | YES  |     | NULL    |       |
| NumARD     | smallint    | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into station
    -> values(1, 'Palais Royal-Musee de Louvre', 1);
Query OK, 1 row affected (0.01 sec)

mysql> show tables;
+-------------------+
| Tables_in_tramway |
+-------------------+
| arrondissement    |
| station           |
+-------------------+
2 rows in set (0.00 sec)

mysql> select * from station;
+------------+------------------------------+--------+
| numStation | nomStation                   | NumARD |
+------------+------------------------------+--------+
|          1 | Palais Royal-Musee de Louvre |      1 |
+------------+------------------------------+--------+
1 row in set (0.00 sec)

mysql> create table ligne(
    -> ID_Ligne smallint primary key,
    -> longueur double,
    -> date_MiseEnService date,
    -> nbrPassagers int,
    -> stationDepart smallint,
    -> stationArrivee smallint,
    -> foreign key (stationDepart) references station(numStation),
    -> foreign key (stationArrivee) references station(numStation));
Query OK, 0 rows affected (0.08 sec)

mysql> desc ligne;
+--------------------+----------+------+-----+---------+-------+
| Field              | Type     | Null | Key | Default | Extra |
+--------------------+----------+------+-----+---------+-------+
| ID_Ligne           | smallint | NO   | PRI | NULL    |       |
| longueur           | double   | YES  |     | NULL    |       |
| date_MiseEnService | date     | YES  |     | NULL    |       |
| nbrPassagers       | int      | YES  |     | NULL    |       |
| stationDepart      | smallint | YES  | MUL | NULL    |       |
| stationArrivee     | smallint | YES  | MUL | NULL    |       |
+--------------------+----------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> show create table ligne;
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ligne | CREATE TABLE `ligne` (
  `ID_Ligne` smallint NOT NULL,
  `longueur` double DEFAULT NULL,
  `date_MiseEnService` date DEFAULT NULL,
  `nbrPassagers` int DEFAULT NULL,
  `stationDepart` smallint DEFAULT NULL,
  `stationArrivee` smallint DEFAULT NULL,
  PRIMARY KEY (`ID_Ligne`),
  KEY `stationDepart` (`stationDepart`),
  KEY `stationArrivee` (`stationArrivee`),
  CONSTRAINT `ligne_ibfk_1` FOREIGN KEY (`stationDepart`) REFERENCES `station` (`numStation`),
  CONSTRAINT `ligne_ibfk_2` FOREIGN KEY (`stationArrivee`) REFERENCES `station` (`numStation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into ligne
    -> values(1, 16.5, '1900-07-19', 725000, 1, 1);
Query OK, 1 row affected (0.01 sec)

mysql> show tables;
+-------------------+
| Tables_in_tramway |
+-------------------+
| arrondissement    |
| ligne             |
| station           |
+-------------------+
3 rows in set (0.00 sec)

mysql> select * from ligne;
+----------+----------+--------------------+--------------+---------------+----------------+
| ID_Ligne | longueur | date_MiseEnService | nbrPassagers | stationDepart | stationArrivee |
+----------+----------+--------------------+--------------+---------------+----------------+
|        1 |     16.5 | 1900-07-19         |       725000 |             1 |              1 |
+----------+----------+--------------------+--------------+---------------+----------------+
1 row in set (0.00 sec)

mysql> create table Travaux(
    -> ID_Travail smallint primary key,
    -> lieu varchar(60),
    -> dateDebut date,
    -> duree double);
Query OK, 0 rows affected (0.04 sec)

mysql> show create table Travaux;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                                                                                  |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Travaux | CREATE TABLE `travaux` (
  `ID_Travail` smallint NOT NULL,
  `lieu` varchar(60) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  PRIMARY KEY (`ID_Travail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into travaux
    -> values(1, 'Louvre', '2023-12-1', 3);
Query OK, 1 row affected (0.01 sec)

mysql> select * from travaux;
+------------+--------+------------+-------+
| ID_Travail | lieu   | dateDebut  | duree |
+------------+--------+------------+-------+
|          1 | Louvre | 2023-12-01 |     3 |
+------------+--------+------------+-------+
1 row in set (0.00 sec)

mysql> create table Ligne_St_Trav(
    -> numStation smallint,
    -> ID_Ligne smallint,
    -> ID_Travail smallint,
    -> foreign key (numStation) references station(numStation),
    -> foreign key (ID_Ligne) references ligne(ID_ligne),
    -> foreign key (ID_Travail) references travaux(ID_Travail),
    -> primary key (numStation, ID_Ligne, ID_Travail));
Query OK, 0 rows affected (0.07 sec)

mysql> show create table Ligne_St_Trav;
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table         | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ligne_St_Trav | CREATE TABLE `ligne_st_trav` (
  `numStation` smallint NOT NULL,
  `ID_Ligne` smallint NOT NULL,
  `ID_Travail` smallint NOT NULL,
  PRIMARY KEY (`numStation`,`ID_Ligne`,`ID_Travail`),
  KEY `ID_Ligne` (`ID_Ligne`),
  KEY `ID_Travail` (`ID_Travail`),
  CONSTRAINT `ligne_st_trav_ibfk_1` FOREIGN KEY (`numStation`) REFERENCES `station` (`numStation`),
  CONSTRAINT `ligne_st_trav_ibfk_2` FOREIGN KEY (`ID_Ligne`) REFERENCES `ligne` (`ID_Ligne`),
  CONSTRAINT `ligne_st_trav_ibfk_3` FOREIGN KEY (`ID_Travail`) REFERENCES `travaux` (`ID_Travail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> desc Ligne_St_Trav;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| numStation | smallint | NO   | PRI | NULL    |       |
| ID_Ligne   | smallint | NO   | PRI | NULL    |       |
| ID_Travail | smallint | NO   | PRI | NULL    |       |
+------------+----------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into Ligne_St_Trav
    -> values(1, 1, 1);
Query OK, 1 row affected (0.01 sec)

mysql> select * from Ligne_St_Trav;
+------------+----------+------------+
| numStation | ID_Ligne | ID_Travail |
+------------+----------+------------+
|          1 |        1 |          1 |
+------------+----------+------------+
1 row in set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_tramway |
+-------------------+
| arrondissement    |
| ligne             |
| ligne_st_trav     |
| station           |
| travaux           |
+-------------------+
5 rows in set (0.00 sec)

mysql>
