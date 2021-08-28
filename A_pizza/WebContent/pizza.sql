drop table tbl_pizza_01;
drop table tbl_shop_01;
drop table tbl_salelist_01;

select * from tbl_pizza_01;
select * from tbl_shop_01;
select * from tbl_salelist_01;

create table tbl_pizza_01 (
	pcode char(4) not null primary key,
	pname varchar2(30),
	cost number(7)
);

create table tbl_shop_01 (
	scode char(4) not null primary key,
	sname varchar2(20)
);

create table tbl_salelist_01 (
	saleno number(7) not null primary key,
	scode char(4) not null references tbl_shop_01(scode),
	saledate date,
	pcode char(4) not null references tbl_pizza_01(pcode),
	amount number(5)
);





insert into tbl_pizza_01 values ('AA01', '고르곤졸라피자', 6000);
insert into tbl_pizza_01 values ('AA02', '치즈피자', 6500);
insert into tbl_pizza_01 values ('AA03', '페퍼로니피자', 7000);
insert into tbl_pizza_01 values ('AA04', '콤비네이션피자', 7500);
insert into tbl_pizza_01 values ('AA05', '고구마피자', 6000);
insert into tbl_pizza_01 values ('AA06', '포테이토피자', 7000);
insert into tbl_pizza_01 values ('AA07', '불고기피자', 8000);
insert into tbl_pizza_01 values ('AA08', '나폴리피자', 8000);

insert into tbl_shop_01 values ('S001', '강남점');
insert into tbl_shop_01 values ('S002', '강서점');
insert into tbl_shop_01 values ('S003', '강동점');
insert into tbl_shop_01 values ('S004', '영동점');
insert into tbl_shop_01 values ('S005', '시청점');
insert into tbl_shop_01 values ('S006', '인천점');

insert into tbl_salelist_01 values ('10001', 'S001', '2018-12-02', 'AA01', 50);
insert into tbl_salelist_01 values ('10002', 'S001', '2018-12-02', 'AA02', 30);
insert into tbl_salelist_01 values ('10003', 'S001', '2018-12-02', 'AA03', 20);
insert into tbl_salelist_01 values ('10004', 'S001', '2018-12-02', 'AA04', 50);
insert into tbl_salelist_01 values ('10005', 'S003', '2018-12-03', 'AA01', 40);
insert into tbl_salelist_01 values ('10006', 'S003', '2018-12-03', 'AA02', 60);
insert into tbl_salelist_01 values ('10007', 'S003', '2018-12-03', 'AA04', 60);
insert into tbl_salelist_01 values ('10008', 'S003', '2018-12-04', 'AA05', 70);
insert into tbl_salelist_01 values ('10009', 'S005', '2018-12-02', 'AA01', 80);
insert into tbl_salelist_01 values ('10010', 'S005', '2018-12-02', 'AA03', 30);
insert into tbl_salelist_01 values ('10011', 'S005', '2018-12-02', 'AA04', 40);
insert into tbl_salelist_01 values ('10012', 'S005', '2018-12-02', 'AA05', 50);
insert into tbl_salelist_01 values ('10013', 'S004', '2018-12-04', 'AA01', 30);
insert into tbl_salelist_01 values ('10014', 'S004', '2018-12-04', 'AA02', 20);
insert into tbl_salelist_01 values ('10015', 'S004', '2018-12-04', 'AA06', 50);

select pcode from tbl_pizza_01 where pname='고구마피자';

insert into tbl_salelist_01 values ('20001', 'S001', '2021-08-27', 'AA02', 40);
insert into tbl_salelist_01 values ('20001', 'A001', '2021-08-27', (select pcode from tbl_pizza_01 where pname='고구마피자'), 40);


select a.saleno, a.scode, to_char(a.saledate, 'yyyy-mm-dd'), b.pcode, b.pname, a.amount, to_char(a.amount * b.cost, '000,000') from tbl_salelist_01 a, tbl_pizza_01 b where a.pcode = b.pcode;