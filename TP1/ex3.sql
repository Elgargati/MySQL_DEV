create database GestionCommande ;
CREATE TABLE Clients (
    idclt INT,
    Nomclt VARCHAR(30),
    Prenomclt VARCHAR(30),
    Adresseclt VARCHAR(30),
    villeclt VARCHAR(30),
    CONSTRAINT PKclt PRIMARY KEY (idclt)
);
alter table Clients modify column villeclt varchar(30) not null ;
alter table Clients alter Nomclt set default "Sans nom" ;
alter table Clients alter Prenomclt set default "Sans prenom" ;
CREATE TABLE Produits ( 
    Ref INT PRIMARY KEY AUTO_INCREMENT,
    Désignation VARCHAR(30),
    Quantite INT,
    Prix FLOAT
);
select * from Clients ;
CREATE TABLE Commande (
    NoCmd VARCHAR(30),
    idclt INT,
    Ref INT,
    datecmd DATE,
    dateliv DATE,
    CONSTRAINT FK1 FOREIGN KEY (idclt)
        REFERENCES Clients (idclt),
    CONSTRAINT FK2 FOREIGN KEY (Ref)
        REFERENCES Produits (Ref)
);
alter table Commande add primary key (NoCmd) ;
alter table Commande add constraint fk_ref foreign key (Ref) references Produits (Ref) on delete cascade ;
alter table Commande add constraint ck_date2 check (dateliv > datecmd );
alter table Commande add column Calculee int generated always as (datediff(dateliv,datecmd)) ;
show tables ;
use GestionCommande ;
select * from Commande ;
drop table Commande 
