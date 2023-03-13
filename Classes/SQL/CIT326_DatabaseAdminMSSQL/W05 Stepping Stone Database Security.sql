--W05 Stepping Stone: Database Security | Shane Duke
use SalesOrdersExample;
go
create view office.order_retail_vs_quoted as
select	od.OrderNumber
		, p.ProductName
		, p.RetailPrice
		,od.QuotedPrice
from	office.Order_Details od 
join	dbo.Products p
on		od.ProductNumber = p.ProductNumber;