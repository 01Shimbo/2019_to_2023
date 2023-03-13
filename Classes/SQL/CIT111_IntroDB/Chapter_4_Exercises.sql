# Query 1:
SELECT * FROM vendors AS v INNER JOIN invoices AS I ON v.vendor_id = i.vendor_id;
# Query 2:
SELECT v.vendor_name, i.invoice_number, i.invoice_date, i.invoice_total - (i.payment_total + i.credit_total) AS balance_due FROM vendors AS v INNER JOIN invoices AS i ON i.vendor_id = v.vendor_id HAVING balance_due <> 0;
# Query 3:
SELECT
 v.vendor_name, v.default_account_number AS default_account,
 gl.account_description AS descrption 
 FROM vendors AS v 
 INNER JOIN general_ledger_accounts AS gl 
 ON gl.account_number = v.default_account_number 
 ORDER BY gl.account_description, v.vendor_name;
# Query 4:
SELECT v.vendor_name, i.invoice_date, i.invoice_number, ili.invoice_sequence AS ili_sequence, 
ili.line_item_amount AS ili_amount 
FROM vendors AS v 
INNER JOIN invoices AS i on i.vendor_id = v.vendor_id 
INNER JOIN invoice_line_items AS ili ON ili.invoice_id = i.invoice_id;
# Query 5:
SELECT v.vendor_id, v.vendor_name,
CONCAT(v.vendor_contact_first_name, ' ', v.vendor_contact_last_name) AS contact_name
FROM vendors AS v INNER JOIN vendors as v2 
ON v2.vendor_contact_last_name = v.vendor_contact_last_name AND v2.vendor_id <> v.vendor_id 
ORDER BY v.vendor_contact_last_name;
# Query 6:
SELECT gl.account_number, gl.account_description FROM general_ledger_accounts AS gl 
LEFT JOIN invoice_line_items AS ili ON ili.account_number = gl.account_number 
WHERE ili.invoice_id IS NULL ORDER BY gl.account_number;
# Query 7:
SELECT vendor_name, 'CA' AS vendor_state FROM vendors WHERE vendor_state = 'CA' UNION
SELECT vendor_name, 'Outside CA' AS vendor_state FROM vendors WHERE vendor_state <> 'CA'
ORDER BY vendor_name