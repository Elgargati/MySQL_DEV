create database Tp2 ;
use Tp2 ;
CREATE TABLE Clients (
    codecli INT PRIMARY KEY,
    prenomcli VARCHAR(30),
    nomcli VARCHAR(30),
    ruecli VARCHAR(30),
    cpcli VARCHAR(30),
    villecli VARCHAR(30)
);
CREATE TABLE Films (
    codefilm INT PRIMARY KEY,
    nomfilm VARCHAR(30)
);
CREATE TABLE Locations (
    codecli INT,
    codefilm INT,
    datedebut DATE,
    duree FLOAT,
    PRIMARY KEY (codecli , codefilm)
);
alter table Locations add constraint fk1 foreign key (codecli) references Clients(codecli) on delete cascade ;
alter table Locations add constraint fk2 foreign key (codefilm) references Films(codefilm)  on delete cascade;

select * from Films ;
select * from Locations;

insert into Films value
(12,"The Raid"),
(13,"Le loup de Wall Street");

insert into Clients (codecli, prenomcli, nomcli) value (124,"Mohammed","Ali");
insert into Films (codefilm)  value (9) ;
insert into Clients (codecli, prenomcli, nomcli) value (7,"client","prenoclt");

insert into Locations value (7,9,"2013-1-3",4);
delete from Locations where codefilm=1 ;

delete from Films where codefilm=12;
delete from Films where codefilm=13;
delete from Films where codefilm=9;

select * from Films ;

insert into Films value (8,"Matrix 1");
update films set nomfilm="Matrix 2" where codefilm=8;

insert into Locations (codecli, codefilm, duree) values (7,9,3);
update Locations set duree=duree+3 where codefilm=9 and codecli=7 ;
