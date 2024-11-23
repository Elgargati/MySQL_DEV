create database tp3 ;
use tp3 ;
CREATE TABLE Stagiaire (
    NumS INT PRIMARY KEY,
    NomS VARCHAR(30),
    PrenomS VARCHAR(30),
    Tele VARCHAR(30),
    AdrS VARCHAR(30)
);
CREATE TABLE Examen (
    NumE INT PRIMARY KEY,
    SalleE VARCHAR(30),
    DateE DATE,
    TypeE VARCHAR(30)
);

insert into Stagiaire values 
(1,'nom1','prenom1','0610000000','adresse1'),
(2,'nom2','prenom2','0620000000','adresse2'),
(3,'nom3','prenom3','0630000000','adresse3'),
(4,'nom4','prenom4','0640000000','adresse4'),
(5,'nom5','prenom5','0617545678','adresse5'),
(6,'nom6','prenom6','0612345878','adresse6');

insert into Examen values 
(1,'B1','2023-01-01','pratique'),
(2,'A2','2023-03-02','cc'),
(3,'A3','2023-03-03','efm'),
(4,'A4','2023-04-04','pratique'),
(5,'B5','2023-05-12','efm'),
(6,'A3','2023-06-06','regional');

select * from Examen ;

-- 1
select * from Stagiaire;

-- 2
select NumS from Stagiaire ;

-- 3
select NumE,DateE from Examen ;

-- 4
select * from Stagiaire order by NomS desc ;

-- 5
select * from Examen where TypeE='pratique' ;

-- 6
select * from Examen where SalleE in ('A2','A3') ;

-- 7
select * from Examen where SalleE in ('A2','A3') order by DateE ;

-- 8
select * from Examen order by salleE , DateE desc; 

-- 9
select * from Stagiaire where NomS like '%u%' ;

-- 10
select PrenomS from Stagiaire where PrenomS like '%m' ;

-- 11
select PrenomS from Stagiaire where PrenomS like '%m' or '%d' ;

-- 12
select NomS , PrenomS from Stagiaire where NomS like '%i' and PrenomS like '%m' ; 

-- 13
select NomS from Stagiaire where NomS like '_a%' ;

-- 14
select NomS from Stagiaire where NomS not like '_a%' ;

-- 15
select * from Examen where SalleE like 'a%' ; 

-- 16
select SalleE from Examen  ; 

-- 17
select distinct SalleE from Examen  ;   
 