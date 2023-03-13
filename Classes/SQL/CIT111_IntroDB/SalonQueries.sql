SELECT product_name, product_type, product_price, (customer_first + ' ' + customer_last) as customer_name FROM tran_detail as td 
join product as pr on td.product_id = pr.product_id
join customer as cu on tr.customer_id = cu.customer_id 
join tran as tr on td.transaction_id = tr.transaction_id 
order by customer_name asc ;

SELECT (customer_first + ' ' + customer_last) as customer_name,(price * quantity) as total_spent from tran_detail
join product as pr on td.product_id = pr.product_id
join customer as cu on tr.customer_id = cu.customer_id 
join tran as tr on td.transaction_id = tr.transaction_id 
order by total_spent desc;

SELECT (employee_first + ' ' + employee_last) as employee_name,(price * quantity) as revenue from tran_detail
join product as pr on td.product_id = pr.product_id
join employee as em on tr.employee_id = em.emloyee_id 
join tran as tr on td.transaction_id = tr.transaction_id 
order by revenue desc;

Select (employee_first + ' ' + employee_last) as
 employee_name, employee_title, date_hired, manager_id, employee_title 
 from employee;