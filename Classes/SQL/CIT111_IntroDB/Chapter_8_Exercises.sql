#1
SELECT invoice_total, FORMAT(invoice_total, 1) AS formated, 
CONVERT(invoice_total, signed) as converted, 
CAST(invoice_total AS signed) as casted 
from invoices;
#2
SELECT invoice_date, 
CAST(invoice_date as DATETIME) as invoice_date,
CAST(invoice_date as CHAR(7)) as invoice_year_month
FROM invoices