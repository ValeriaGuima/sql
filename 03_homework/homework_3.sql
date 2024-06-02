-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */

SELECT vendor_id
,COUNT(booth_number)

FROM vendor_booth_assignments
GROUP by vendor_id


/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

SELECT customer_last_name, customer_first_name
,SUM(quantity * cost_to_customer_per_qty) AS total_spent
	FROM customer as c
		INNER JOIN customer_purchases as cp
			ON c.customer_id = cp.customer_id

GROUP by cp.customer_id
	HAVING total_spent > 1999
		ORDER by customer_last_name ASC



--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/


-- if a table named "new_vendor_inventory" exists, delete it, other do nothing
DROP TABLE IF EXISTS temp.new_vendor;

--make a new table called "new_vendor_inventory"
CREATE TEMP TABLE new_vendor_inventory AS

--definition of new_vendory_invetory
SELECT *, original_price * 5 as inflation
FROM vendor_inventory;

-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */
SELECT customer_id, cost_to_customer_per_qty,

STRFTIME('%m', market_date) AS month,
STRFTIME('%Y', market_date) AS year
FROM customer_purchases

/* 2. Using the previous query as a base, determine how much money each customer spent in April 2019. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

SELECT customer_id,

SUM(quantity * cost_to_customer_per_qty) AS total_spent,
STRFTIME('%m', market_date) AS month,
STRFTIME('%Y', market_date) AS year
FROM customer_purchases
GROUP BY customer_id, month, year
HAVING month='04' AND year='2019';


