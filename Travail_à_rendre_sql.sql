-----------------------------------------------TP1-SQL---------------------------------------

--question 1
CREATE TABLE CANDIDAT(
CIN_candidat int CONSTRAINT PK_candidat PRIMARY KEY,
NomCandidat varchar(15),
prenomCandidat varchar(15),
DateN date,
Niveau varchar(15),
Nationnalite varchar(20));

CREATE TABLE FORMATIONS(
NomFormation varchar(50) CONSTRAINT PK_Formation PRIMARY KEY,
Description varchar(50),
Duree int ,
Prix float );

CREATE TABLE SESSIONS(
IdSession varchar (30) CONSTRAINT PK_Session PRIMARY KEY,
DateDebutSession date,
NomFormateur varchar (30),
NomFormation varchar(50) CONSTRAINT FK_Formation REFERENCES FORMATIONS(NomFormation));	
 
CREATE TABLE PARTICIPATIONS(
idCandidat int CONSTRAINT FK_Candidat REFERENCES CANDIDAT(CIN_candidat),
IdSession varchar (30) CONSTRAINT FK_Session REFERENCES SESSIONS(idSession));
--question 2
ALTER TABLE SESSIONS ADD Lieu varchar(15) DEFAULT 'ORADIST' NOT NULL;
--question 3
--A)
ALTER TABLE FORMATIONS MODIFY( Duree  NOT NULL);
ALTER TABLE FORMATIONS MODIFY (Prix  NOT NULL);
--B) 
ALTER TABLE FORMATIONS ADD Constraint  unique_descrip UNIQUE(Description);
--C)
ALTER TABLE CANDIDAT ADD Constraint check_niveau CHECK(Niveau IN  ('BAC+2','BAC+3','BAC+4','BAC+5')); 
--D)
ALTER TABLE FORMATIONS ADD Constraint check_duree CHECK(Duree between 2 AND 90) ;

--question 4
DROP TABLE CANDIDAT cascade constraints;
DROP TABLE FORMATIONS cascade constraints;
DROP TABLE SESSIONS cascade constraints;
DROP TABLE PARTICIPATIONS cascade constraints;