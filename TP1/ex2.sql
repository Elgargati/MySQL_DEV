use mydata ;
CREATE TABLE etudians (
    id_etudiant INT PRIMARY KEY,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    date_naissance DATE,
    sexe VARCHAR(30),
    note_moyenne FLOAT,
    statu VARCHAR(30)
);
SELECT * FROM etudians;
alter table etudians add column adresse varchar (30) ;
alter table etudians modify note_moyenne float not null ;
alter table etudians add check ( statu='actif' or statu='diplomé' or statu='suspendu' ) ;
alter table etudians add  constraint DATEN check ( date_naissance > '1990/01/01');
alter table etudians add check (note_moyenne > 0);
alter table etudians add constraint SEX check (sexe='M' or sexe='m' or sexe='F' or sexe='f');
alter table etudians drop column adresse ;
alter table etudians drop check DATEN ;
alter table etudians drop check SEX ;
alter table etudians add column année_inscription  date ;
alter table etudians add check ( statu='actif' or statu='diplomé' or statu='suspendu' or statu='en cours' ) ;
alter table etudians add check (note_moyenne > 0 and note_moyenne <=20 );
alter table etudians add  constraint DATEI check ( année_inscription > '2000/01/01');

alter table etudians drop column année_inscription ;
alter table etudians drop column note_moyenne ;
alter table etudians drop column statu ;


