-- USE CHINOOK;

-- Importate il database presente nel file .sql usando il DBMS scelto. 
-- Esercizio 1 Cominciate facendo un’analisi esplorativa del database, ad esempio: 

-- Fate un elenco di tutte le tabelle. 
-- ALBUM; ARTIST; CUSTOMER; EMPLOYEE; GENRE; INVOICE; INVOICELINE; MEDIATYPE; PLAYLIST; PLAYLISTTRACK; TRACK;

-- Visualizzate le prime 10 righe della tabella Album. 
SELECT 
	* 
FROM 
	ALBUM
LIMIT 10;

-- Trovate il numero totale di canzoni della tabella Tracks. 
SELECT 
	COUNT(NAME) 
FROM 
	TRACK;

-- Trovate i diversi generi presenti nella tabella Genre. 
SELECT DISTINCT 
	*
FROM GENRE;

-- Effettuate tutte le query esplorative che vi servono per prendere confidenza con i dati. 
SELECT
	*
FROM
	ARTIST
LIMIT 10;

SELECT
	*
FROM
	CUSTOMER
LIMIT 10;

SELECT
	*
FROM
	EMPLOYEE
LIMIT 10;

SELECT
	*
FROM
	INVOICE
LIMIT 10;

SELECT
	*
FROM
	INVOICELINE
LIMIT 10;

SELECT
	*
FROM
	MEDIATYPE
LIMIT 10;

SELECT
	*
FROM
	PLAYLIST
LIMIT 10;

SELECT
	*
FROM
	PLAYLISTTRACK
LIMIT 10;

SELECT
	*
FROM
	TRACK
LIMIT 10;

-- Esercizio 2 Recuperate il nome di tutte le tracce e del genere associato. 
SELECT
	TR.NAME AS NOME_TRACCIA, 
    GE.GENREID,
    GE.NAME AS GENERE
FROM TRACK AS TR
LEFT JOIN GENRE AS GE
ON TR.GENREID = GE.GENREID;

-- Esercizio 3 Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?
SELECT
	AR.NAME AS ARTISTA,
    AL.TITLE AS TITOLO_ALBUM
FROM ARTIST AS AR
LEFT JOIN ALBUM AS AL
ON AR.ARTISTID = AL.ARTISTID
WHERE AL.TITLE IS NOT NULL;

-- SI ESISTONO ARTISTI SENZA ALBUM, SE ESEGUIAMO SENZA IL WHERE SI VEDONO GLI ARTISTI SENZA ALBUM - OPPURE SE SEGUIAMO IL WHERE CON IS NULL VEDIAMO GLI ARTISTI SENZA ALBUM

-- Esercizio 4 Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media? 
SELECT
	TR.NAME AS NOME_TRACCIA,
    GE.NAME AS GENERE,
    ME.NAME AS TIPOLOGIA_MEDIA
FROM TRACK AS TR
LEFT JOIN GENRE AS GE
ON TR.GENREID = GE.GENREID
INNER JOIN MEDIATYPE AS ME
ON TR.MEDIATYPEID = ME.MEDIATYPEID;


-- Esercizio 5 Elencate i nomi di tutti gli artisti e dei loro album.
SELECT
	ART.NAME AS ARTISTA,
    ALB.TITLE AS NOME_ALBUM
FROM ARTIST AS ART
LEFT JOIN ALBUM AS ALB
ON ART.ARTISTID = ALB.ARTISTID;

