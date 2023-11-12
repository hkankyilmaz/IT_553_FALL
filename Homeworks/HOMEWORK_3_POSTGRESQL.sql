
-- Homework 3
-- Postgresql


--1

select language_id "name" , count(film_id)
from film
group by language_id 

--2

select distinct  a.first_name , a.last_name 
from film f join film_actor fa 
on f.film_id = fa.film_id
join actor a on a.actor_id = fa.actor_id 
where lower(substring(a.first_name,1,1)) = lower(substring(a.last_name,1,1))   

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

select rating , avg(rental_rate) 
from film r 
where rating in ('R','G','PG','PG-13')
group by rating
having avg(rental_rate) < 3 

--7

select a.first_name ,f.title ,f.description ,f.length 
from film f join film_actor fa 
on f.film_id = fa.film_id 
join actor a on a.actor_id =fa.actor_id 
where f.length <60

--8

select c.name , count(r.rental_id)
from film f join film_category fc 
on f.film_id = fc.film_id join inventory i 
on i.film_id =f.film_id join rental r 
on r.rental_id =i.inventory_id  join category c 
on fc.category_id =c.category_id 
group by c."name" 
order by count(r.rental_id) desc
limit 10



--9

select last_name , count(last_name)
from actor a 
group by last_name 

--10

select f.title "name" , count(f.title)
from film f join inventory i  on i.film_id = f.film_id 
join rental r on i.inventory_id = i.inventory_id 
group by f.film_id 
order by count(f.title) desc
limit 10

--11

select a.first_name ,a.last_name 
from film f join film_actor fa 
on f.film_id = fa.film_id 
join actor a on a.actor_id =fa.actor_id 
where f.title = 'Alter Victory'

--12


select f.film_id , sum(f.rental_duration)
from film f join  film_category fc on f.film_id  = fc.film_id 
join inventory i on i.film_id = f.film_id 
join rental r on r.inventory_id = r.inventory_id
join category c on fc.category_id = c.category_id 
where c.name ='Family'
group by f.film_id
order by  sum(f.rental_duration) desc
limit 1


























