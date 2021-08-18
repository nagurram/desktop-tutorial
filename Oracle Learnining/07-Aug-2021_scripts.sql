select 'I am Prasanti''s lover' as Narendra,'She is very lazy Lady' as Prasanti from dual;

select  first_name, hire_date from employees

select first_name,hire_date,  case  when  hire_date <  to_date('09-JUL-16','DD-MON-YY') then 'can test' else 'No test' end  as test  from employees


select first_name,   case first_name  when 'Summer' then 'can test' else 'No test' end as test  from employees

select * from products where product_id=248

select list_price,NVL(list_price,0)*0.15 as Final_price from products --where product_id=248 

select list_price, list_price*0.15 as Final_price from products where product_id=249
--update products set  list_price=null where product_id=248