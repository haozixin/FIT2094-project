--connection 1

drop table custbalance;
create table custbalance
(cust_id number(2) not null,
cust_bal number(3) not null);

alter table custbalance 
add constraint pk_cust_bal primary key (cust_id);

insert into custbalance values(1,100);
insert into custbalance values(2,200);

commit;
select * from custbalance;

--task3 
--Connection 1 update the balance of customer 1 from 100 to 110 (without issuing a commit).

update custbalance
set cust_bal = 110
where cust_id=1;

select * from custbalance;
commit;

--task4
update custbalance
set cust_bal = 150
where cust_id=2;

select * from custbalance;

rollback;

--task5
update custbalance
set cust_bal = 125
where cust_id=1;
select * from custbalance;

--task6 
update custbalance
set cust_bal = 300
where cust_id=1;
select * from custbalance;

update custbalance
set cust_bal = 500
where cust_id=2;
select * from custbalance;
commit;



