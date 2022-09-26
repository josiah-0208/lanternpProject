-- 축제 후기 게시판
CREATE TABLE review_board (
	review_no NUMBER(5) PRIMARY KEY NOT NULL,
	member_no NUMBER(15) NOT NULL,
	title VARCHAR2(20) NOT NULL,
	content VARCHAR2(2999) NOT NULL,
	likes NUMBER default 0,
	read_cnt NUMBER default 0 NOT NULL,
	reg_date DATE NOT NULL,
	del CHAR(1) default 'n' NOT NULL
);

-- 후기 게시판 댓글
CREATE TABLE board_reply (
	reply_no NUMBER(5) PRIMARY KEY NOT NULL,
	member_no NUMBER(15) NOT NULL,
	review_no NUMBER(5) references review_board NOT NULL,
	rp_content VARCHAR2(200) NOT NULL,
	rp_reg_date DATE NOT NULL,
	rp_del CHAR(1) default 'n' NOT NULL
);

-- 후기 게시판 좋아요
CREATE TABLE board_likes (
	member_no NUMBER(15) references member NOT NULL,
	review_no NUMBER(5) references review_board NOT NULL
);

select * from REVIEW_BOARD;
select * from BOARD_REPLY;
select * from BOARD_LIKES;

