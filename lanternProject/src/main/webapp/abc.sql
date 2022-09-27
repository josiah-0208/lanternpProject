CREATE TABLE fest
(
	fno 	   NUMBER PRIMARY KEY,
	fname      VARCHAR2(70) NOT NULL,
	thumbnail  VARCHAR2(150) NOT NULL,
	start_date DATE NOT NULL,
	end_date   DATE NOT NULL,
	hours      VARCHAR2(50),
	intro      VARCHAR2(150),
	host       VARCHAR2(100) NOT NULL,
	loc        VARCHAR2(50),
	addr       VARCHAR2(150),
	spot       VARCHAR2(80),
	home_pg    VARCHAR2(250),
	tel        VARCHAR2(50),
	fee        NUMBER(6) default 0,
	fee_adult  NUMBER(6) default 0,
    fee_teen   NUMBER(6) default 0,
    fee_child  NUMBER(6) default 0,
    f_image    VARCHAR2(200),
    f_txt      VARCHAR2(2000),
	del        CHAR(1) default 'n'
);

drop table bookmark;
CREATE TABLE bookmark
(
    bm_no        NUMBER PRIMARY KEY,
    member_no    NUMBER NOT NULL,
    fno          NUMBER NOT NULL
);
select * from bookmark;

DROP TABLE fest;
select * from fest;
select * from fest;
select * from (select rownum rn, e.* from (
		select * from fest where del = 'n' order by fno desc) e)
		where rn between 1 and 10;
select count(*) from fest where del = 'n' and (sysdate > start_date);

select * from fest where del = 'n' and sysdate between start_date and end_date;
select * from fest where del = 'n' and start_date > sysdate;
delete from fest where fno=125;

select * from (select rownum rn, e.* from (select * from fest where del = 'n' order by fno desc) e) where rn between 3 and 3


select * from (select rownum rn, e.* from (
		select * from fest where del = 'n' and sysdate between start_date and end_date order by fno desc) e)
		where rn between 1 and 3;

select * from fest where fno = 121 and del='n';
select* from member;
select*from REVIEW_BOARD;

select * from bookmark;
