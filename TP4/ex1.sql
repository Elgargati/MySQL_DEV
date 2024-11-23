create database tp4 ;
use tp4 ;
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
(2,'nomb2','prenom2','0620000000','adresse2'),
(3,'nom3','prenom3','0630000000','adresse3'),
(4,'noms4','prenom4','0640000000','adresse4'),
(5,'nom5','prenom5','0617545678','adresse5'),
(6,'nom6','prenom6','0612345878','adresse6');

insert into Examen values 
(1,'B1','2023-01-01','pratique'),
(2,'A2','2023-03-03','cc'),
(3,'A3','2023-03-03','efm'),
(4,'A2','2023-04-04','pratique'),
(5,'B5','2023-05-12','efm'),
(6,'A3','2023-06-06','regional'),
(7,'A3','2023-07-07','national');

select * from stagiaire ;
select * from examen ;
-- 1
select count(TypeE) as "nombre dexamens pratiques"
from Examen 
where TypeE="pratique";

-- 2
select min(DateE) as "date de 1er ctrl.eff"
from Examen;

-- 3
select count(NomS) as "N. du nom contient 'b' ou 's'"
from Stagiaire
where NomS like "%b%" or NomS like "%s%";

-- 4
select count(SalleE) as "N.examens realise dans sll B5"
from Examen
where SalleE="B5" ;

-- 5
select count(NumE) as "N.examens realise dans sll {A}"
from Examen
where SalleE like "A%" ;

-- 6
select DateE,count(numE) as "N.examens eff"
from Examen 
group by DateE ;

-- 7
select SalleE , count(numE) as "N.examens eff"
from Examen 
group by SalleE;

-- 8
select SalleE,count(numE) as "N.examens eff"
from Examen
where SalleE like "A%"
group by SalleE ;

-- 9
select sallee
from Examen
group by SalleE
having count(numE) >= 2 ;

-- 10
select sallee
from Examen
group by SalleE
having count(numE) = 3 ;

-- 11
select sallee
from Examen
where  SalleE like "A%"
group by SalleE
having count(numE) = 2 ;