create database Tp5;
use tp5 ;
CREATE TABLE Departement (
    Num_Dep INT primary key,
    Nom_DEP VARCHAR(30),
    Ville_DEP VARCHAR(30))
;

CREATE TABLE employe (
    num_emp INT PRIMARY KEY,
    nom_emp VARCHAR(30),
    prenom_emp VARCHAR(30),
    fonction_emp VARCHAR(30),
    date_naissance DATE,
    date_embauch DATE,
    salaire float,
    num_dep INT,
    sup_emp int ,
    constraint fk foreign key (sup_emp) references employe(num_emp),
    constraint fk2 foreign key (num_dep) references departement(num_dep)
);

insert into Departement values
(10,"Info","Casa"),
(20,"Commerce","Tanger"),
(30,"Production","Rabat");

insert into employe values 
(1,'Nom1','prenom1','President','2000-01-01','2021-01-01',2500,10,null),
(2,'nom2','prenom2','Directeur','1997-02-02','2022-02-02',20000,20,1),
(3,'nom3','prenom3','vendeur','2002-01-01','2023-03-03',7000,10,1),
(4,'nom4','prenom4','President','2001-01-01','2021-04-04',6000,20,null),
(5,'nom5','prenom5','Directeur','1994-01-01','2022-05-05',30000,30,2),
(6,'nom6','prenom6','vendeur','2002-06-06','2022-06-06',3000,20,2),
(7,'nom7','prenom7','Directeur','1995-07-07','2022-07-0',30000,10,1),
(8,'nom8','prenom7','vendeur','2000-08-08','2020-08-08',4000,30,null),
(9,'nom9','prenom9','vendeur','2001-10-10','2020-10-10',9000,20,null),
(10,'nom10','prenom10','Ouvrier','2001-10-10','2020-10-10',8500,30,8),
(11,'nom11','prenom11','Ouvrier','1998-10-10','2020-10-10',9300,20,8),
(12,'nom12','prenom12','secrétaire','2001-10-10','2020-10-10',5500,30,9),
(13,'nom13','prenom13','secrétaire','2001-10-10','2020-10-10',3000,30,9);

select * from employe;
select*from departement;

-- 1
select e.nom_emp,d.ville_dep
from employe e 
inner join Departement d
on e.num_dep=d.num_dep ;

-- 2
select d.ville_dep
from employe e 
inner join Departement d
on e.num_dep=d.num_dep
where e.num_emp=1035 ;

-- 3
select  e.nom_emp,fonction_emp,nom_dep
from employe e inner 
join Departement d
on e.num_dep=d.num_dep
where d.Num_Dep=20 or d.Num_Dep=30 ;

-- 4
select  concat(nom_emp," ",prenom_emp) as nom_complet
from employe 
where salaire = (select max(salaire) from employe);

-- 5
select concat(nom_emp," ",prenom_emp) as nom_complet
from employe 
where length(concat(nom_emp,prenom_emp)) = (select max(length(concat(nom_emp,prenom_emp))) from employe );

-- 6
select  e.num_emp,concat("L'employe : ",nom_emp," ",prenom_emp," est age de ",
     timestampdiff(year,date_naissance,curdate()),
     " ans , il travaille dans le dep ",nom_dep) 
     as "Listes des employes" 
from employe e inner 
join Departement d
on e.num_dep=d.num_dep
order by e.num_emp;

-- 7
select  nom_emp,fonction_emp,salaire
from employe 
where salaire > (select salaire from employe where num_emp=1035);

-- 8
select  nom_emp,fonction_emp,salaire
from employe 
where salaire > all (select salaire from employe where prenom_emp="Mahmoudi");

-- 9
select distinct d.nom_dep
from employe e 
inner join Departement d
on e.num_dep=d.num_dep
where salaire > 3000 ;

-- 10
select fonction_emp ,avg(salaire)
from employe
group by fonction_emp
having avg(salaire) < (select avg(salaire) from employe where fonction_emp="ingenieur");

-- 11
select  e1.Nom_Emp ,e2.Nom_Emp  as 'chef'
from Employe e1 
inner join Employe e2 
on e1.sup_Emp=e2.Num_Emp  ;


-- 12
select e1.nom_emp,e1.salaire
from employe e1 
inner join employe e2 
on e1.sup_Emp=e2.Num_Emp 
where e1.salaire > e2.salaire ;

-- 13
select  e1.Nom_Emp , e2.Nom_Emp  as 'chef'
from Employe e1
left outer join  Employe e2 
on e1.sup_Emp=e2.Num_Emp  ;