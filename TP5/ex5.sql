use tp5;
CREATE TABLE ville (
    codePostal INT PRIMARY KEY,
    nomVille VARCHAR(30)
);


create table cinema (numCinema int primary key,
						nomCinema varchar(30),
						rueCinema varchar(30),
						codePostal int,foreign key(codePostal) references ville(codePostal));


create table salle (numSalle int primary key,
					capacite float,
					numCinema int ,foreign key (numCinema) references cinema(numCinema));

CREATE TABLE film (
    numFilm INT PRIMARY KEY,
    titre VARCHAR(30),
    duree float,
    producteur VARCHAR(30)
); 

CREATE TABLE projection (
    numP INT PRIMARY KEY,
    numFilm INT,
    FOREIGN KEY (numFilm)
        REFERENCES film (numFilm),
    numSalle INT,
    FOREIGN KEY (numSalle)
        REFERENCES salle (numSalle),
    Date DATE,
    nbrEntree INT
);

select* from ville;
select* from cinema;
select*from salle;
select * from film;
select*from projection;


-- 1
select v.nomville,count(c.numCinema) as 'nombre de cinema'
from cinema c
inner join ville v
on c.codepostal=v.codepostal
group by v.nomville;

-- 2
select c.nomcinema , sum(s.capacite) as "la capacité totale"
from cinema c
inner join salle s
on c.numCinema=s.numCinema
group by c.nomcinema ;

-- 3
select f.*
from (film f inner join projection p using(numFilm)) 
inner join salle s using (numSalle) 
where (p.nbrEntree<=0.3*s.capacite);


-- 4
select f.producteur,count(numFilm) as'nombre de film'
from film f 
inner join projection p 
using(numFilm) 
where(p.Date='2011/08/25') 
group by f.producteur;

-- 5
select f.numfilm,f.titre,count(p.nump) as "le nombre de projections"
from film f 
inner join projection p 
using(numFilm) 
where p.Date between '2011/10/20' and '2011/10/25'  
group by f.numfilm;

-- 6
select  f.titre
from film f 
inner join projection p 
using(numFilm) 
-- where (timestampdiff(year,p.date,curdate())>=3) 
group by f.numfilm
having max(p.date)< curdate() - interval 3 year;