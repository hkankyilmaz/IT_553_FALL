
-- Homework 3
-- Postgresql


--1

select count(film_id) 
from film
group by language_id 

--2

select distinct  a.first_name , a.last_name 
from film f join film_actor fa 
on f.film_id = fa.film_id
join actor a on a.actor_id = fa.actor_id 
where lower(substring(a.first_name,1,1))  = lower(substring(a.last_name,1,1))   

--3

select c.customer_id  , count(c.customer_id) 
from film f join inventory i 
on f.film_id = i.film_id 
join rental r on r.inventory_id  = i.inventory_id 
join customer c on c.customer_id = r.customer_id
group by c.customer_id 
limit 1

--4

select a.actor_id, count(a.actor_id)
from film f join film_actor fa 
on f.film_id = fa.film_id 
join actor a on a.actor_id =fa.actor_id 
group by a.actor_id
order by count(a.actor_id) desc 
limit 10

--5

select S.first_name ,S.last_name ,COUNT(S.first_name)
from staff s join rental r 
on s.staff_id = r.staff_id
where date_part('MONTH', r.rental_date) = 5
group by S.staff_id
order by COUNT(S.first_name) desc
LIMIT 1

--6