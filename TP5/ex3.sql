use Tp5 ;
create table service(
      numservice int primary key ,
      nomservice varchar (30),
      lieu varchar (30)
);
create table projet (
      codeprj int primary key ,
      nomprj varchar (30),
      datedebut date ,
      datefin date
);

CREATE TABLE salarie (
    Matricul INT PRIMARY KEY,
    nom VARCHAR(30),
    poste VARCHAR(30),
    email varchar (30),
    dateemb date ,
    salaire float ,
    numser int ,
    prime float,
    constraint fk_s foreign key salaire(numser) references service(numservice) 
);

create table participation (
    matricul int ,
    codeprj int ,
    fonction varchar (30) ,
    nbrjours int ,
    constraint primary key (matricul , codeprj),
    constraint fk_salaire foreign key participation(matricul) references salarie(matricul),
    constraint fk_service foreign key participation(codeprj) references projet(codeprj)
);

select * from service ;

select * from projet ;

select * from salarie ;

select * from participation;

-- 1 
select se.nomservice, max(sa.salaire)
from salarie sa
inner join service se
on se.numservice=sa.numser 
group by nomservice;

-- 2
 select sa.matricul , sa.nom
from salarie sa
inner join service se
on se.numservice=sa.numser 
where se.nomservice="info";

-- 3
select sa.matricul , sa.nom , count(codeprj) as "n.projets" , sum(nbrjours) as "duree_Totale"
from salarie sa 
inner join participation p
on sa.matricul=p.matricul
group by sa.matricul ;
-- 
--

-- 4
select s.nomservice , sum(sa.salaire+sa.prime) as " la masse salariale"
from service s
inner join salarie sa 
on s.numservice=sa.numser
group by s.nomservice ;

-- 5
select se.nomservice,count(sa.matricul) as 'nombre de salaries'
from salarie sa 
inner join service se
where sa.salaire > (select avg(salaire) from salarie)
group by se.nomservice ;

-- 6
select s.*
from salarie s 
left outer join participation p
on p.matricul=s.matricul
where codeprj is null ;
-- diff not insert / intresction in

-- 7
select s.*
from salarie s 
inner join participation p
on p.matricul=s.matricul
inner join projet pr
on pr.codeprj=p.codeprj
where p.nbrjours > 0.1* timestampdiff(day,datedebut,datefin)
group by s.matricul 
having count(s.matricul) > 10 ;






insert into service values
 (1,"info","casa"),
(2,"compta","tanger");
select * from projet ;
insert into projet values 
(1, 'projet1', '2023-12-23', '2024-01-10'),
(2, 'projet2', '2020-01-01', '2020-02-02'),
(3, 'projet3', '2020-03-03', '2021-03-03'),
(4, 'projet4', '2022-04-04', '2020-08-08'),
(5, 'projet5', NULL, NULL),
(6, 'projet6', NULL, NULL),
(7, 'projet7', NULL, NULL),
(8, 'projet8', NULL, NULL),
(9, 'projet9', NULL, NULL),
(10, 'projet10', NULL, NULL),
(11, 'projet11', NULL, NULL),
(12, 'projet12', NULL, NULL),
(13, 'projet13', NULL, NULL),
(14, 'projet14', NULL, NULL);


select * from salaire ;
insert into salarie values 
(1,'nom1','salarie','2001-01-01',2500,1,500),
(2,'nom2','salarie','2002-02-02',4000,2,200),
(3,'nom3','salarie','2003-03-30',5000,1,300),
(4,'nom4','salarie','2004-04-04',6000,2,400);