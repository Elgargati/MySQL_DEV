create database tp2;
use Tp2;
CREATE TABLE Departement (
    Num_Dep INT,
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
        REFERENCES Departement (Num_Dep) on delete cascade
);

select * from EMP;
select * from Departement ;

insert into Departement value 
(30,"info","Casa"),
(20,"compta","Casa");

insert into EMP value
(1,"Ali","prenom1","fct1","2000-1-1","2022-1-1",4000,20),
(2,"Ahmed","prenom2","fct2","2000-2-2","2022-2-2",6000,20);

-- Q2
insert into EMP value (110,"nom110","prenom110","fct110","2000-1-1","2022-1-1",11000,30);
update EMP set num_dep = 20 where num_emp = 110 ;


insert into EMP value (30,"nom30","prenom30","fct30","2000-3-3","2023-3-3",3000,30);

-- Q3
update EMP set Salaire_EMP=Salaire_EMP+(Salaire_EMP*10/100) where Num_Dep=20 and Num_Dep=30 ;

-- Q4
update EMP set salaire_emp = 10000 where salaire_emp > 10000 and num_dep=20 ; 

-- Q5
delete from Departement where Num_Dep = 20 ;

-- Q6
delete from EMP ;