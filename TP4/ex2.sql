
use Tp4;
CREATE TABLE Commande (
    id_commande INT PRIMARY KEY,
    id_client INT,
    date_commande DATE,
    montant FLOAT,
    CONSTRAINT fk2 FOREIGN KEY (id_client)
        REFERENCES Commande (id_commande)
);
alter table commande drop foreign key fk2 ;

insert into commande values
(1,1,"2020-01-01",1000),
(2,1,"2020-02-02",200),
(7,1,"2020-07-02",7500),
(8,1,"2020-08-08",800),
(3,3,"2022-01-01",100),
(4,4,"2023-12-01",3000),
(5,4,"2021-04-01",100),
(6,6,"2020-06-01",600);

select * from commande ;

-- 1
select id_client, count(id_commande) as "N.totale de commandes"
from commande
group by id_client;

-- 2
select id_client, sum(montant) as "Montant total"
from commande
group by id_client;

-- 3
select id_client, min(date_commande) as "la date de la 1er commande"
from commande
group by id_client;

-- 4
select id_client
from commande
group by id_client
having count(id_commande) > 3;

-- 5
select id_client
from commande
group by id_client
having sum(montant) > 1000 ;

-- 6
select id_client,avg(montant) as "montant moyennne"
from commande
group by id_client ;

-- 7
select id_client , max(montant)
from commande
group by id_client;