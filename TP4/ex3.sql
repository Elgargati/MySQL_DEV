use tp4 ;
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
    constraint fk foreign key (sup_emp) references employe(num_emp)
);
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

-- 1
select avg(salaire) as "Salaire Moyenne"
from employe ;

-- 2
select avg(salaire) as "Salaire Moyenne des ouvriers"
from employe
where fonction_emp="ouvrier" ;

-- 3
select min(salaire) as "le plus bas salaire" , max(salaire) as "la plus haut salaire"
from employe;

-- 4
select count(num_emp) as "N.des employes dans le dep.10"
from employe 
where  num_dep=10;

-- 5
select count(num_emp)
from employe 
where length(nom_emp) between 5 and 7 ;

-- 6
select count(distinct fonction_emp) as "N.des fcts occp d"
from employe 
where  num_dep=10 ;

-- 7
select num_dep,avg(salaire) as "salaire moyenne"
from employe
group by num_dep ;

-- 8
select num_dep,avg(salaire*12) as "salaire annuel moyenne"
from employe
where fonction_emp not in ("President","Directeur")
group by num_dep ;

-- 9
select num_dep,fonction_emp,avg(salaire)  as "salaire moyenne" , count(num_emp) as "N.Emolyes"
from employe
group by num_dep,fonction_emp;

-- 10
select timestampdiff(year,date_naissance,curdate())as "age", count(num_dep) as "N.Employes a meme age"
from employe 
group by timestampdiff(year,date_naissance,curdate());

-- 11
select fonction_emp,avg(salaire) as "salaire moyenne"
from employe
group by fonction_emp 
having count(num_emp) > 2 ;

-- 12
select num_dep as "numero de département"
from employe
where fonction_emp = "secrétaire"
group by num_dep
having count(num_emp) >= 2;