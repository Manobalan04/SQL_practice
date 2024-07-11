--DDL--
create table employees(
id NUMBER(30),
emp_name VARCHAR(50),
emp_phone NUMBER(10),
ent_dt timestamp default systimestamp,
mod_dt timestamp,
primary key(id)
);
commit;

alter table employees modify id not null;

alter table employees add emp_addr VARCHAR(25);
alter table employees modify mod_dt default systimestamp;

drop table employees;
desc employees;

truncate table employees;

--DML--
insert into employees(id,emp_name,emp_addr) values(1,'MANO','Porur');
insert into employees(id,emp_name,emp_addr) values(2,'MANO','Porur');

select * from employees;
select emp_name from employees;
select distinct emp_name from employees;
select distinct (emp_name),id from employees;

select * from employees where id=2 OR emp_addr='tvm';

update employees set emp_phone=92334567,mod_dt=systimestamp where id=1;

delete employees where id=2;