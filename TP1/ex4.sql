create database GestionLogement ;
CREATE TABLE Logement (
    n_logement INT,
    type_logement VARCHAR(30),
    id_quartier INT,
    Noo INT,
    rue VARCHAR(30),
    superficie FLOAT,
    loyer FLOAT
);
alter table Logement add primary key (n_logement) ;
CREATE TABLE Type_de_logement (
    type_logement VARCHAR(30),
    charge VARCHAR(30),
    PRIMARY KEY (type_logement)
);
CREATE TABLE Quartier (
    id_quartier INT,
    id_commande INT,
    libele_quartier VARCHAR(30),
    PRIMARY KEY (id_quartier)
);
CREATE TABLE Commun (
    id_commun INT,
    nom_commun VARCHAR(30),
    distance_age FLOAT,
    nombre_d_ha INT,
    PRIMARY KEY (id_commun)
);
CREATE TABLE Individu (
    n_identificateur INT,
    n_logement INT,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    date_de_naissance DATE,
    n_telephone VARCHAR(30),
    PRIMARY KEY (n_identificateur)
);
alter table Individu modify n_telephone varchar (30) not null ;
alter table Individu alter nom set default 'Sans nom';
alter table Quartier change column id_commande id_commun int ;

alter table  Individu  add foreign key (n_logement) references Logement (n_logement) on delete cascade on update cascade ;
alter table Logement  add foreign key (type_logement) references Type_de_logement (type_logement) on delete cascade on update cascade ;
alter table Logement  add foreign key (id_quartier) references Quartier (id_quartier) on delete cascade on update cascade;
alter table Quartier add foreign key (id_commun) references Commun (id_commun) on delete cascade on update cascade;

alter table Individu add constraint ck_datedenaissance check (date_de_naissance <= curdate() and  timestampdiff( year , date_de_naissance , curdate() ) >= 18 );

alter table Individu alter column nom drop default ;
use GestionLogement ;
show tables ;
select * from Individu
 
