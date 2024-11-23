create database mydata;
use mydata;
CREATE TABLE Departement (
    Num_Dep INT auto_increment,
    Nom_DEP VARCHAR(30),
    Ville_DEP VARCHAR(30),
    CONSTRAINT CLEPREMAIRE PRIMARY KEY (Num_Dep)
);
select * from Departement ;
CREATE TABLE EMP (
    Num_EMP INT,
    Nom_EMP VARCHAR(30),
    Pernom_EMP VARCHAR(30),
    Fonction_EMP VARCHAR(30),
    DateNaissance_EMP DATE,
    DateEmbauche_EMP DATE,
    Salaire_EMP FLOAT,
    Num_Dep INT,
    CONSTRAINT PKEMP PRIMARY KEY (Num_EMP),
    CONSTRAINT FKEMP FOREIGN KEY (Num_Dep)
        REFERENCES Departement (Num_Dep) on delete set null on update set null
);
select * from EMP ;

alter table EMP modify column Num_emp int auto_increment ;
alter table EMP modify column Nom_EMP varchar (30) not null ;
alter table EMP modify Pernom_EMP varchar (30) not null ;
alter table EMP add check (Fonction_EMP = 'ouvrier' or Fonction_EMP = 'cadre' or Fonction_EMP = 'directeur' );
alter table EMP add check (Salaire_EMP > 0 );
alter table Departement modify Nom_DEP varchar(30) unique ;
alter table EMP alter column DateEmbauche_EMP set default (curdate())  ;
alter table Departement  alter Ville_DEP set default 'Casa';