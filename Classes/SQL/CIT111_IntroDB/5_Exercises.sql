#1
insert terms (terms_id, terms_description, terms_due_days) values (6 ,'Net due 120 days', 120);
#2
Update terms set terms_descripton = 'Net due days 125 days', terms_due_day=125 where terms_id = 6;
#3
DELETE FROM terms where terms_id = 6;
#4
Insert into invoices values (default, 32, 'AX-014-027', '2014-014-01', 434.58, 0, 0, 2, '2014-8-31', NULL);
#5
insert into invoice_line_items (invoice_sequence, account_number, line_item_number, line_item_description) values
 (1, 160, 180.23, 'Hard drive'),
 (2, 527, 254.35, 'Exchange Server update'); 
#6
#update ;
#7
#update;
#8
#update;
#9
#delete