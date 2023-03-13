#Query 1
select vendor_id, sum(invoice_total) as invoice_total_sum from invoices group by vendor_id;
#Query 2
select vendor_name, sum(payment_total) AS payment_total_sum from vendors as v join invoices as i
on v.vendor_id = i.vendor_id
group by vendor_name
order by payment_total_sum desc;
#Query 3
select vendor_name, count(*) as invoice_count, sum(invoice_total) as invoice_total_sum from vendors as v join invoices as i
on v.vendor_id = i.vendor_id
group by vendor_name
ORDER BY COUNT(i.invoice_id) DESC;
#Query 4
select account_description, count(line_item_amount) as line_item_count, sum(line_item_amount) as line_item_amount_sum 
from general_ledger_accounts as gla join invoice_line_items as ili
on gla.account_number = ili.account_number
group by account_description
HAVING COUNT(ili.account_number) > 1
order by line_item_amount_sum desc;
#Query 5
select account_description, count(line_item_amount) as line_item_count, sum(line_item_amount) as line_item_amount_sum 
from general_ledger_accounts as gla join invoice_line_items as ili
on gla.account_number = ili.account_number
group by account_description
HAVING COUNT(ili.account_number) > 1
order by line_item_amount_sum desc;
#Query 6
select account_number, sum(line_item_amount) as line_item_amount_sum from invoice_line_items with rollup
#Query 7
select vendor_name from vendors