select * from user_tables where HAS_IDENTITY='YES'; 

select *from products;
insert into products(prod_name)values('watch1');
insert into products(prod_name)values('watch1');

select prod_name,rank() over (order by prod_name desc) as rank from products; //rank

select prod_name,dense_rank() over (order by prod_name desc) as rank from products;  //dense_rank

select distinct(prod_name),dense_rank() over (order by prod_name desc) as rank from products; //distinct

select * from products order by prod_name desc;

select * from products where rownum<=2; 

select prod_name,dense_rank() over (order by prod_name desc) as rank from products where rownum<=2;

select count(prod_name),prod_name from products group by prod_name;

select count(prod_name) as count,prod_name from products group by prod_name order by count desc;

select count(prod_name) from products group by prod_name having prod_name='watch1'; //having

select * from products where prod_name in ('watch','airpodes'); //in

select * from products where prod_name in ('watch','airpodes') and prod_id between 1 and 3; //between

create or replace view v_prod as select * from products where prod_name in ('watch','airpodes');
create or replace view v_prod as select prod_name from products where prod_name in ('watch','airpodes');
select * from v_prod;


create table licence(
prod_name varchar(30)
);
insert into licence(prod_name) select prod_name from products; //insert multi values from another table
select * from licence;

insert into licence(prod_name) select prod_name from products where prod_name='watch1';
drop table licence;

select (20+4) from dual;
SELECT (3*4),(1+9) FROM dual;

select ceil(24.6) from dual; //ceil
select floor(24.78) from dual; //floor

select round(25.4567,3) from dual; //round

select trunc(25.4567,2) from dual; //trunc

select nvl(null,null) from dual;
select coalesce (null,null,'car',null,null) from dual;