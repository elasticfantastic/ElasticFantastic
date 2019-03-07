select
	c.ssn AS customer_ssn, c.name AS customer_name, c.street AS customer_street, 
	c.city AS customer_city, c.zip AS customer_zip, o.orderNbr AS order_nbr, 
	p.productNbr AS product_nbr, ol.quantity AS orderline_quantity, o.time AS order_time, 
	p.productName AS product_name, p.price AS product_price, SUM(p.price * ol.quantity) AS order_totalprice
from OrderLine ol 
join Orderr o on ol.orderNbr = o.orderNbr 
join Product p on ol.productNbr = p.productNbr 
join Customer c on c.ssn = o.customerSSN 
where time > :sql_last_value 
group by
	c.ssn, o.time, c.name, c.street, c.city, c.zip, o.orderNbr, p.productNbr, 
	ol.quantity, p.productName, p.price