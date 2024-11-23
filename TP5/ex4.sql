use tp5;
create table patient(
     idpt int primary key ,
     nom varchar (30),
     sexe varchar (30),
     adresse varchar (30),
     ville varchar (30)
);

create table medecin (
    idmed int primary key ,
    nom varchar (30) ,
    specialite varchar (30)
);

create table consultation(
    nocos int primary key ,
    idpt int , 
    idmed int ,
    Date date ,
    prix float ,
    constraint fk_idpt foreign key consultation(idpt) references patient(idpt),
    constraint fk_idmed foreign key consultation(idmed) references medecin(idmed)
);
select*from patient ;

select * from medecin ;

select * from consultation ;
 
-- 1
select specialite,count(idmed) as "le nombre de médecins"
from medecin
group by specialite ;

-- 2
select idmed,count(distinct idpt) as "le nombre de patients"
from consultation 
group by idmed ;

-- 3
select p.idpt,p.nom,count(distinct c.idmed) as "nombre de médecins "
from consultation c
inner join patient p
on p.idpt=c.idpt
group by idpt ;

-- 4
select p.idpt,p.nom , sum(c.prix) as'somme totale'
from patient p
inner join consultation c
on p.idpt=c.idpt
where c.date between "2009-10-16" and "2010-11-22"
group by c.idpt ;

-- 5
select c.idmed,m.nom  ,sum(c.prix) as'somme total' 
from medecin m
inner join consultation c                         
on m.idmed=c.idmed
where c.date=(select max(date) from consultation where idmed=m.idmed)
group by c.idmed
;
 
 -- 6
select c.nocos, c.idpt, c.Date, c.prix
from medecin m 
inner join consultation c 
on c.idmed=m.idmed 
where m.specialite='Pediatrie';

-- 7
select  p.*
from patient p 
inner join consultation c 
using(idpt) 
group by p.idpt 
having max(c.date)<date_sub(curdate(),interval 3 year);