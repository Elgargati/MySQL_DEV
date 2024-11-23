use Tp2;
CREATE TABLE CLIENTS (
    codeclient VARCHAR(20),
    nom VARCHAR(30),
    cpclient VARCHAR(30),
    villeclient VARCHAR(30),
    tel VARCHAR(30),
    primary key (codeclient)
);

create table Echantillon (
    codeEchantillon VARCHAR(20) primary key ,
    dateentre date ,
    codeclient VARCHAR(20)
);

CREATE TABLE Typeanalyse (
    Reftypeanalyse VARCHAR(30),
    designation VARCHAR(30),
    TypeAnalyse VARCHAR(30),
    Prixtypeanalyse FLOAT ,
    primary key (Reftypeanalyse)
);

CREATE TABLE Realiser (
    codeEchantillon VARCHAR(30),
    reftypeanalyse VARCHAR(30),
    dateRealisation DATE ,
    primary key (codeEchantillon,reftypeanalyse)
);


alter table Typeanalyse add foreign key (Reftypeanalyse) references Realiser(reftypeanalyse); 

INSERT INTO CLIENTS (CodeClient, NomClient, NumeroTelephone) VALUES
    ('C1', 'Client1', '0600000000'),
    ('C2', 'Client2', NULL),
    ('C3', 'Client3', '0612345678');

INSERT INTO Analyses (CodeAnalyse, NomAnalyse, Prix) VALUES
    ('A1', 'Analyse1', 100),
    ('A2', 'Analyse2', 150),
    ('A3', 'Analyse3', 120);
    
UPDATE Analyses SET Prix = Prix *1.1 ;

DELETE FROM Clients WHERE CodeClient ='C1';

UPDATE Clients SET NumeroTelephone = '0611111111' WHERE CodeClient ='C2';

UPDATE VotreTable SET Date = DATE_SUB(Date, INTERVAL 1 YEAR) WHERE MONTH(Date) = 2 AND DAY(Date) = 1 AND YEAR(Date)= 2007;