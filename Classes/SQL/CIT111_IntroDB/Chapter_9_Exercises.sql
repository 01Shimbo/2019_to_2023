#1
SELECT invoice_total, ROUND(invoice_total, 1) AS total_round_one, ROUND(invoice_total, 0) AS total_round_zero FROM invoices;
#2
SELECT start_date, 
DATE_FORMAT(start_date, '%b/%e/%y') as 'm name/d/yy',
DATE_FORMAT(start_date, '%c/%e/%y') as 'm/d/yy',
DATE_FORMAT(start_date, '%l:%i %p') AS 'h:m_am/pm',
DATE_FORMAT(start_date, '%c/%e/%y %l:%i %p') as 'date and time'
FROM  ex . date_sample;
#3
SELECT vendor_name, 
UPPER(vendor_name) AS up_vendor_name, vendor_phone,
RIGHT(vendor_phone, 4) as last_four_of_phone,
	SUBSTRING_INDEX(
		SUBSTRING(vendor_name, LOCATE(' ', vendor_name, 1), 999),
			' ',
			2) AS second_word_in_vedor_name
FROM  vendors;
#4
SELECT invoice_number, invoice_date,
DATE_ADD(invoice_date, INTERVAL 30 DAY) AS month_after_invoice,
payment_date,
DATEDIFF(payment_date, invoice_date) AS days_to_pay,
EXTRACT(MONTH FROM invoice_date) as invoice_date_month
FROM invoices
WHERE EXTRACT(MONTH FROM invoice_date) = 5