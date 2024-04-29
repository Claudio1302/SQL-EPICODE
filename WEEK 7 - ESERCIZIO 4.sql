-- 1.Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia?
SELECT 	count(*) AS NUMERO_RIGHE
FROM 	dimproduct;

SELECT 	COUNT(DISTINCT ProductKey) AS NUMERO_PRODUCTKEY
FROM 	dimproduct;

-- 2.Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
SELECT 
		CONCAT(SalesOrderNumber, '-', salesorderlinenumber), 
		COUNT(*) AS CONTA_COMBINAZIONI
FROM factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber;

-- 3.Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT 
		OrderDate AS DATA,
        count(*) AS NUMERO_ORDINI_DAL_2020
FROM factresellersales
WHERE OrderDate > '2020-01-01'
GROUP BY OrderDate;


/*4.Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice) 
per prodotto (DimProduct) a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. 
I campi in output devono essere parlanti!
*/
SELECT
        dp.EnglishProductName AS NOME_PRODOTTO,
        SUM(SalesAmount) AS FATTURATO_TOTALE,
        SUM(OrderQuantity) AS QUANTITA_TOTALE,
        AVG(UnitPrice) AS PREZZO_MEDIO
FROM dimproduct AS dp
INNER JOIN factresellersales as frs
on dp.ProductKey = frs.ProductKey
WHERE frs.OrderDate > '2020-01-01'
GROUP BY dp.EnglishProductName
ORDER BY dp.EnglishProductName;


/*
5.Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) per Categoria prodotto (DimProductCategory). 
Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!
*/
SELECT 
        dpc.EnglishProductCategoryName AS CATEGORIA_PRODOTTO,
        SUM(frs.SalesAmount) AS FATTURATO_TOTALE,
        SUM(frs.OrderQuantity) AS QUANTITA_TOTALE
FROM factresellersales AS frs
INNER JOIN dimproduct AS dp
ON frs.ProductKey = dp.ProductKey
INNER JOIN dimproductcategory AS dpc
ON dpc.ProductCategoryKey = dp.ProductSubcategoryKey
GROUP BY dpc.EnglishProductCategoryName;


-- 6.Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
SELECT 
		dg.City AS CITTA,
        SUM(frs.SalesAmount) AS FATTURATO_TOTALE
FROM factresellersales AS frs
INNER JOIN dimgeography AS dg
ON frs.SalesTerritoryKey = dg.SalesTerritoryKey
WHERE frs.OrderDate > '2020-01-01'
GROUP BY dg.City
HAVING SUM(frs.SalesAmount) > 60000
ORDER BY SUM(frs.SalesAmount) DESC;

