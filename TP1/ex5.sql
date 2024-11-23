create database ANALYSES ;
CREATE TABLE CLIENTS (
    codeclient VARCHAR(20),
    nom VARCHAR(30),
    cpclient VARCHAR(30),
    villeclient VARCHAR(30),
    tel VARCHAR(30)
);
use ANALYSES ;
alter table CLIENTS add primary key (codeclient);
alter table CLIENTS modify column cpclient varchar (30) not null ;
alter table CLIENTS modify column villeclient varchar (30) not null ;
alter table CLIENTS alter nom set default 'Anonyme';

CREATE TABLE Typeanalyse (
    Reftypeanalyse VARCHAR(30),
    designation VARCHAR(30),
    TypeAnalyse VARCHAR(30),
    Prixtypeanalyse FLOAT
);
alter table Typeanalyse add constraint ck_Prixtypeanalyse check (Prixtypeanalyse between 100 and 1000);

CREATE TABLE Realiser (
    codeEchantillon VARCHAR(30),
    reftypeanalyse VARCHAR(30),
    dateRealisation DATE
);
alter table Realiser add primary key (codeEchantillon,reftypeanalyse);
alter table Typeanalyse add foreign key (Reftypeanalyse) references Realiser(reftypeanalyse); 

-- alter table Realiser add constraint ck_date check (timestampdiff( day,dateRealisation , curdate() ) <= 3 );
alter table Realiser add constraint ck_DateRealisation check (dateRealisation >= sysdate() and dateRealisation <= date_add(sysdate(),interval 3 day));