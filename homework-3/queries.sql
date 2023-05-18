-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT customers.company_name, CONCAT(employees.first_name, ' ', employees.last_name) AS FIO
FROM orders 
INNER JOIN customers USING (customer_id)
INNER JOIN employees USING (employee_id)
INNER JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE customers.city LIKE 'London' and employees.city LIKE 'London'
GROUP BY customers.company_name, FIO, shippers.company_name
HAVING shippers.company_name LIKE 'United Package'
ORDER BY customers.company_name DESC

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.


-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT customers.company_name
FROM customers 
LEFT JOIN orders USING (customer_id)
GROUP BY customers.company_name
HAVING COUNT(order_id)=0

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
