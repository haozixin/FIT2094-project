select * from custbalance;
update custbalance
set cust_bal = 100
where cust_id=2;
commit;
rollback;
--task6

update custbalance
set cust_bal = 400
where cust_id=2;
select * from custbalance;

update custbalance
set cust_bal = 450
where cust_id=1;
select * from custbalance;
