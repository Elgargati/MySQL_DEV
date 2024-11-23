use mydata ;
create table Note (
                Code_Stgr int,
                    Code_Module int,
                    Note_1 float,
                    Note_2 float,
                    Note_3 float,
                 primary key auto_increment (Code_Stgr,Code_Module)  
);
create table Stagiaire (
					Code_Stgr int primary key,
                    Nom_Stgr varchar(30),
                    Prenom_Stgr varchar(30),
                    Date_Naissance date,
                    Tel_Fixe varchar(30),
                    Tel_Portable varchar(30),
                    Email varchar(30),
                    Code_groupe varchar(30)
);
create table Module(
					Code_Module int primary key,
                    Libelle_Module varchar(30)
);
create table Groupe(
					Code_groupe varchar(30) primary key,
                    Annee int ,
                    Code_Filiere int
);
create table Filiere(
					Code_Filiere int primary key,
                    Libelle_Module varchar(30)
);

-- les cles etrengees :
alter table Note add constraint F__K11  foreign key (Code_Stgr) references Stagiaire(Code_Stgr);
alter table Note add constraint F__K12 foreign key (Code_Module)references Module(Code_Module);
alter table Stagiaire add constraint f_k2 foreign key (Code_groupe) references Groupe(Code_groupe);
alter table Groupe add constraint f_k1 foreign key (Code_Filiere) references Filiere(Code_Filiere) ;

alter table Groupe add constraint Annee check (Annee in (1,2));
alter table Note modify Note_1 decimal default 0 check (Note_1 between 0 and 20);
alter table Note modify Note_2 decimal default 0 check (Note_2 between 0 and 20);
alter table Note modify Note_3 decimal default 0 check (Note_3 between 0 and 20);
alter table Note add column Moyenne float;

alter table Stagiaire add constraint Tel_Fixe check (Tel_Fixe like '05%' and length(Tel_Fixe)=10);
alter table Stagiaire add constraint Tel_Portable check (Tel_Portable like'06%' and length(Tel_Portable)=10);
alter table Stagiaire add constraint Email check (Email like '%@%.%');
alter table Groupe add constraint Code_groupe check ((Annee=1 and Code_groupe like 'G[A-H][1-8]') or (Annee=2 and Code_groupe is null));