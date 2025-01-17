create table customers(
cust_id int generated by default as identity,
cust_name varchar(30),
cust_addr varchar(30),
ent_dt timestamp default systimestamp,
primary key(cust_id)
);

create table products(
prod_id int generated by default as identity,
prod_name varchar(30),
ent_dt timestamp default systimestamp,
cust_id int,
primary key(prod_id),
constraint pk_custId foreign key (cust_id) references customers(cust_id)
);

insert into customers (cust_name, cust_addr) values ('Mano','Porur');
insert into customers (cust_name, cust_addr) values ('Muthu','Chennai');
insert into customers (cust_name, cust_addr) values ('kumar','Tambaram');
insert into customers (cust_name) values ('hello');
select * from customers;

insert into products (prod_name,cust_id) values ('airpodes',2);
insert into products (prod_name,cust_id) values ('sunglass',1);
insert into products (prod_name,cust_id) values ('airpodes',1);
insert into products (prod_name) values ('watch');
insert into products (prod_name) values ('hello ');
select * from products;
drop table products;
drop table customers;

select *  from products p join customers c on p.cust_id=c.cust_id;
select *  from products p join customers c ON p.cust_id=c.cust_id where c.cust_addr='Chennai';
select *  from products p join customers c ON p.cust_id=c.cust_id where not c.cust_addr='Chennai';

select * from products p right join customers c on p.cust_id=c.cust_id;
select * from products p left join customers c on p.cust_id=c.cust_id;

select * from products p join customers c on p.cust_id=c.cust_id and c.cust_id>1; //multiple conditions for checking

select p.prod_name as Productzzz, c.cust_addr as Customerzzz from products p join customers c on p.cust_id=c.cust_id;

select p.prod_name as Productzzz,nvl (c.cust_addr,'Default') as Customerzzz from products p left join customers c on p.cust_id=c.cust_id;

select case when p.prod_name= 'airpodes' then
p.prod_name else 'none' end
as productzzz, nvl (c.cust_addr,'Default') as customerzzz from products p left join customers c on p.cust_id=c.cust_id;

select * from products where prod_name like '%des';
select * from products where prod_name like 'air%';

select * from products where prod_name like 'wa__h';
select * from products where prod_name like '___podes';

select * from products p join customers c on RTRIM(c.cust_name)=RTRIM(p.prod_name);