/*
Modificare, eliminare i dati
È necessario implementare uno schema che consenta di gestire le anagrafiche degli store di un’ipotetica azienda.
Uno store è collocato in una precisa area geografica. In un’area geografica possono essere collocati store diversi.
Cosa devi fare:
Crea una tabella Store per la gestione degli store (ID, nome, data apertura, ecc.)
Crea una tabella Region per la gestione delle aree geografiche (ID, città, regione, area geografica, …)
Popola le tabelle con pochi record esemplificativi
Esegui operazioni di aggiornamento, modifica ed eliminazione record
TIP
Lo scopo del laboratorio è duplice:
Ripassare i concetti di modellazione (chiavi e relazioni)
Eseguire operazioni di INSERT, UPDATE, DELETE
Lo schema deve prevedere poche tabelle (due cioè quelle indicate o al massimo tre se volete gestire eventuali categorizzazioni).
È sufficiente popolare le tabelle con pochi record (è importante testare le istruzioni indicate e quanto visto a lezione).
*/

-- CREATE DATABASE WEEK8_ES3;
-- USE WEEK8_ES3;
-- SELECT * FROM REGION;
-- SELECT * FROM STORE;

CREATE TABLE REGION
(
		IDCITTA SMALLINT PRIMARY KEY NOT NULL,
        NOME_CITTA VARCHAR(50),
        COD_POSTALE CHAR(5),
        REGIONE VARCHAR(50),
        AREA_GEOGRAFICA CHAR(6)
);

CREATE TABLE STORE
(
		IDSTORE SMALLINT PRIMARY KEY NOT NULL,
        NOME_STORE VARCHAR(50),
        DATA_APERTURA DATE,
        NOME_CITTA VARCHAR(50),
        INDIRIZZO_STORE VARCHAR(100),
		IDCITTA SMALLINT,
        FOREIGN KEY (IDCITTA) REFERENCES REGION(IDCITTA) 
);

INSERT INTO REGION VALUES 
				(1, 'ROMA', '00042', 'LAZIO', 'CENTRO'),
                (2, 'MILANO', '20019', 'LOMBARDIA', 'NORD'),
                (3, 'BOLOGNA', '40100', 'EMILIA-ROMAGNA', 'NORD'),
                (4, 'PARMA', '43121', 'EMILIA-ROMAGNA', 'NORD'),
                (5, 'VENEZIA', '30100', 'VENETO', 'NORD'),
                (6, 'BARI', '70100', 'PUGLIA', 'SUD'),
                (7, 'COSENZA', '87100', 'CALABRIA', 'SUD'),
                (8, 'BOLOGNA', '40100', 'VENETO', 'NORD'),
                (9, 'TORINO', '10024', 'PIEMOTE', 'NORD'),
                (10, 'FIRENZE', '50100', 'TOSCANA', 'NORD');
                
INSERT INTO STORE VALUES
				(1, 'STORE_N1', '2008-05-01', 'MILANO', 'LARGO GARIBALDI N°8', 2),
                (2, 'STORE_N2', '2009-02-08', 'MILANO', 'VIA CAVOUR SNC', 2),
                (3, 'STORE_N3', '2009-11-30', 'ROMA', 'VIA NAPOLEONE N°4', 1),
                (4, 'STORE_N4', '2010-10-05', 'BOLOGNA', 'VIA EINAUDI N°86', 3),
                (5, 'STORE_N2', '2012-02-18', 'BOLOGNA', 'VIA SNC', 3),
                (6, 'STORE_N6', '2012-02-18', 'BARI', 'VIA ROMA SNC', 6),
                (7, 'STORE_N7', '2012-09-01', 'TORINO', 'LARGO MARIO ROSSI', 9),
                (8, 'STORE_N8', '2021-12-16', 'FIRENZE', 'VIA GIOTTO N°94', 10),
                (9, 'STORE_N9', '2013-06-03', 'COSENZA', 'VIALE EUROPA N°108', 7),
                (10, 'STORE_N10', '2015-01-04', 'PARMA', 'VIA MATTEI N°7', 4),
                (11, 'STORE_N11', '2015-02-26', 'ROMA', 'VIA LEONARDO DA VINCI N°244', 1),
                (12, 'STORE_N12', '2015-10-01', 'ROMA', 'VIA PREGNANA N°2', 1),
                (13, 'STORE_N13', '2016-04-04', 'MILANO', 'VIA BELVEDERE SNC', 2),
                (14, 'STORE_N14', '2018-01-20', 'VENEZIA', 'VIA GORIZIA N°18', 5),
                (15, 'STORE_N15', '2019-01-30', 'TORINO', 'VIA DE GASPERI N°°°56', 9),
                (16, 'STORE_N16', '2020-04-05', 'FIRENZE', 'VIA DEI MONTI N°4', 10);


-- DELETE
DELETE FROM STORE
WHERE IDSTORE = 16;

-- UPDATE
UPDATE STORE 
SET NOME_STORE = 'STORE_N5'
WHERE IDSTORE = 5;     

UPDATE STORE 
SET DATA_APERTURA = '2011-05-01'
WHERE IDSTORE = 5;           

UPDATE STORE 
SET INDIRIZZO_STORE = 'VIA GENOVA N°8'
WHERE IDSTORE = 5;    

UPDATE STORE 
SET DATA_APERTURA = '2012-12-16'
WHERE IDSTORE = 8;  

UPDATE STORE 
SET INDIRIZZO_STORE = 'VIA DE GASPERI N°56'
WHERE IDSTORE = 15;  
