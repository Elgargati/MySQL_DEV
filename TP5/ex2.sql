use tp5 ;
create table client (
    codeclt INT PRIMARY KEY,
    nomclt VARCHAR(30),
    prenomclt VARCHAR(30),
    adresseclt VARCHAR(30),
    cpclt VARCHAR(30),
    villecclt VARCHAR(30)
);

CREATE TABLE representant (
    coderep INT PRIMARY KEY,
    nomrep VARCHAR(30),
    prenomrep VARCHAR(30)
);


CREATE TABLE appartement (
    ref INT PRIMARY KEY,
    superficier VARCHAR(30),
    pxvente FLOAT,
    secteur VARCHAR(30),
    coderep INT,
    codeclt INT,
    constraint fk1 foreign key (coderep) references representant(coderep),
    constraint forkey foreign key (codeclt) references client(codeclt)
);

select * from client;

select * from appartement;

-- 1
select secteur,round(avg(pxvente),2) as prix
from appartement
group by secteur;

-- 2
select count(ref) as 'nombre d apparetements par secteur' 
from appartement 
group by secteur 
having count(ref)>10;

-- 3
select secteur , count(ref) as 'nombre d apparetements'
from appartement
where superficier > 80
group by secteur ;

-- 4
select secteur ,max(pxvente)  as "le prix max"
from appartement 
group by secteur 
having count(ref)>10 ;

-- 5
select * 
from client c
inner join appartement a
-- on c.codeclt=a.codeclt
using(codeclt);

-- 6
select *
from appartement a
inner join representant r 
-- on a.coderep=r.coderep 
using(coderep)
where a.secteur="Hivernage" and concat(r.nomrep," ",r.prenomrep)="fouad alami";

-- 7
select count(a.codeclt) as 'nombre de clients' ,a.secteur
from appartement a
inner join client c
on a.codeclt=c.codeclt
where c.villecclt="fes" 
group by a.secteur ;