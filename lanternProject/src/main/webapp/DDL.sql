--회원 테이블
drop table member cascade constraints;
CREATE TABLE member
(
	member_no    NUMBER CONSTRAINT member_mno_PK PRIMARY KEY NOT NULL,
    id    VARCHAR2(30) NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    email	VARCHAR2(50) not null,
    phone    VARCHAR2(20) NOT NULL,
    del    CHAR(1) default 'n' NOT NULL,
    reg_date    DATE NOT NULL,
    profile VARCHAR2(100) NULL
);
select * from member;
insert into member values(0,'master','master','master','ksh98520@naver.com','010-8838-0247','n',sysdate,'no');
--축제 테이블
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
select * from fest;
select end_date from fest;
--북마크 테이블
CREATE TABLE bookmark
(
    bm_no    NUMBER CONSTRAINT bookmark_bm_no_PK PRIMARY KEY NOT NULL,
    member_no    NUMBER constraint bookmark_member_no_fk references member NOT NULL,
    fno    NUMBER constraint bookmark_dno_fk references fest NOT NULL
);
--예매 테이블
drop table reservation;
CREATE TABLE reservation
(
    rs_no    NUMBER CONSTRAINT reservation_rs_no_PK PRIMARY KEY NOT NULL,
    cnt    NUMBER(4) default 0,
    refund char(1) default 'n' not null,
    member_no    NUMBER constraint reservation_mno_fk references member NOT NULL,
    fno    NUMBER constraint reservation_dno_fk references display NOT NULL
);
-- 축제 후기 게시판
drop table review_board;
CREATE TABLE review_board (
	review_no NUMBER(5) PRIMARY KEY NOT NULL,
	member_no NUMBER(15) constraint review_board_member_no_fk references member NOT NULL,
	title VARCHAR2(20) NOT NULL,
	content VARCHAR2(2999) NOT NULL,
	filedata varchar(200),
	likes NUMBER default 0,
	read_cnt NUMBER default 0 NOT NULL,
	reg_date DATE NOT NULL,
	del CHAR(1) default 'n' NOT NULL
);

-- 후기 게시판 댓글
drop table board_reply;
CREATE TABLE board_reply (
	reply_no NUMBER(5) PRIMARY KEY NOT NULL,
	member_no NUMBER(15) constraint board_reply_member_no_fk references member  NOT NULL,
	review_no NUMBER(5) references review_board NOT NULL,
	rp_content VARCHAR2(200) NOT NULL,
	rp_reg_date DATE NOT NULL,
	rp_del CHAR(1) default 'n' NOT NULL
);
-- 후기 게시판 좋아요
CREATE TABLE board_likes (
    likes_no    NUMBER PRIMARY KEY NOT NULL,
    member_no    NUMBER references member NOT NULL,
    review_no    NUMBER references review_board NOT NULL
);

select * from fest where del = 'n' and sysdate between start_date and end_date;
select * from REVIEW_BOARD;
select * from BOARD_REPLY;
select * from bookmark;