--회원 테이블
drop table member cascade constraints;
CREATE TABLE member
(
	mno    NUMBER CONSTRAINT member_mno_PK PRIMARY KEY NOT NULL,
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
--북마크 테이블
CREATE TABLE bookmark
(
    bm_no    NUMBER CONSTRAINT bookmark_bm_no_PK PRIMARY KEY NOT NULL,
    mno    NUMBER constraint bookmark_mno_fk references member NOT NULL,
    fno    NUMBER constraint bookmark_dno_fk references display NOT NULL
);
--예매 테이블
CREATE TABLE reservation
(
    rs_no    NUMBER CONSTRAINT reservation_rs_no_PK PRIMARY KEY NOT NULL,
    cnt    NUMBER(4) default 0,
    refund char(1) default 'n' not null,
    mno    NUMBER constraint reservation_mno_fk references member NOT NULL,
    fno    NUMBER constraint reservation_dno_fk references display NOT NULL
);
--게시판 테이블
CREATE TABLE board
(
    bno    NUMBER CONSTRAINT board_bno_PK PRIMARY KEY NOT NULL,   
    mno    NUMBER constraint board_mno_fk references member NOT NULL,
    title    VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    likes    NUMBER default 0,
    read_cnt    NUMBER default 0 NOT NULL,
    reg_date    DATE NOT NULL,
    del    CHAR(1) default 'n' NOT NULL,
     thumbnail VARCHAR2(100)
);