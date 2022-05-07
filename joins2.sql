--Dominique Tepper & Patrick McKee
--CIS261 - SQL
--May 04, 2022
--Chapter 4 Murach Assignment


-------------------------------------------------------------------------------------------------------------
--Create SQL SELECT statements using the specified tables
--#1 - Implicit INNER JOIN using two tables (Vendors, Invoices)

SELECT
VendorName, Vendors.VendorID, SUM(PaymentTotal) as PaymentTotal
FROM
Vendors,
Invoices
WHERE
Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName, Vendors.VendorID;

------------------------------------------------------------------------------------------------------------

--Create SQL SELECT statements using the specified tables
--#2 - Explicit INNER JOIN using three tables (Invoices, InvoiceLineItems, GLAccounts)

SELECT
Invoices.VendorID,
Invoices.InvoiceNumber,
Invoices.InvoiceDate,
InvoiceLineItems.InvoiceLineItemDescription
FROM Invoices
JOIN InvoiceLineItems
ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
JOIN GLAccounts
ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
ORDER BY VendorID, InvoiceNumber;

------------------------------------------------------------------------------------------------------------

-- Create SQL SELECT statements using the specified tables

--#3 - LEFT JOIN using two tables (Invoices, InvoiceLineItems)

SELECT Invoices.VendorID, InvoiceLineItems.InvoiceID, Invoices.InvoiceDueDate
FROM Invoices
LEFT JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
ORDER BY Invoices.VendorID;

------------------------------------------------------------------------------------------------------------

-- Create SQL SELECT statements using the specified tables
--#4 - SELF JOIN using the same table (Vendors)

SELECT A.VendorName AS VendorName1, B.VendorName AS VendorName2, A.VendorCity
FROM Vendors A, Vendors B
WHERE A.VendorID <> B.VendorID
AND A.VendorCity = B.VendorCity
ORDER BY A.VendorCity;
