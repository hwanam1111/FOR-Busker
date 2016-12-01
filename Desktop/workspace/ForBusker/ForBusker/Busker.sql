CREATE TABLE T_MEMBER(
t_email VARCHAR2(255) PRIMARY KEY,  -- T_MEMBER 전체회원 기본키
t_pw VARCHAR2(255),
t_type VARCHAR2(255)
);

CREATE TABLE N_Member(
n_email varchar2(255) PRIMARY KEY, -- N_MEMBER 일반회원 기본키
n_pw  varchar2(255),
n_nickname varchar2(255),
n_status varchar2(255),
n_type varchar2(255)
);

CREATE TABLE P_Member(
p_email varchar2(255) PRIMARY KEY,  -- P_MEMBER 공연자회원 기본키
p_name varchar2(255),
p_pw varchar2(255),
p_phone varchar2(255),
p_teamtype varchar2(255),
p_teamphoto varchar2(255), 
p_teamname varchar2(255),
p_leader varchar2(255),
p_video varchar2(255),
p_detail varchar2(2000),
p_status varchar2(255),
p_type varchar2(255)
);

CREATE TABLE show(
sh_no number PRIMARY KEY, -- show 공연 기본키
p_email varchar2(255),
sh_teamname varchar2(255),
sh_video varchar2(255),
sh_name varchar2(255),
sh_map_lati varchar2(255),
sh_map_longi varchar2(255),
sh_map_coords varchar2(255),
sh_map_addr varchar2(255),
sh_map_detail varchar2(255),
sh_date varchar2(255),
sh_time varchar2(255),
sh_type varchar2(255),
sh_detail varchar2(255),
CONSTRAINT FK_show_p_email FOREIGN KEY (p_email) references P_Member (p_email)  -- show 공연,공연자회원 외래키
);

CREATE TABLE video(
v_no number PRIMARY KEY, -- video 기본키
p_email varchar2(255),
v_url varchar2(255),
v_name varchar2(255),
v_detail varchar2(255),
v_count varchar2(255),
v_like varchar2(255),
CONSTRAINT FK_vidoe_p_email FOREIGN KEY (p_email) references P_Member (p_email) -- video 영상 ,공연자회원 외래키
);

CREATE TABLE VideoReply(
re_no number PRIMARY KEY, --VideoReply 영상 댓글 기본키
v_no number,
t_email varchar2(255),
re_content varchar2(2000),
CONSTRAINT FK_VideoReply_v_no FOREIGN KEY (v_no) references video (v_no), -- 비디오영상번호 외래키
CONSTRAINT FK_VideoReply_t_email FOREIGN KEY (t_email) references T_Member (t_email) --  전체회원 외래키
);


CREATE TABLE SMS(
sms_no number PRIMARY KEY, --쪽지 기본키
sms_send_email varchar2(255),
sms_content varchar2(2000),
sms_receive_email varchar2(255),
sms_send_thime varchar2(255),
sms_status varchar2(255)
);


CREATE TABLE sponser(
sp_no number PRIMARY KEY, --스폰서 기본키
t_email varchar2(255), 
sp_anme varchar2(255),
sp_photo varchar2(255),
sp_content varchar2(255),
sp_cond varchar2(255),
sp_tel varchar2(255),
CONSTRAINT FK_sponser_t_email FOREIGN KEY (t_email) references T_Member (t_email)  --전체회원 외래키
);

CREATE TABLE backed(
back_no number PRIMARY KEY, --후원받는사람 기본키
t_email varchar2(255),
back_name varchar2(255),
back_video varchar2(255),
back_content varchar2(255),
back_needs varchar2(255),
back_tel varchar2(255),
CONSTRAINT FK_backed_t_email FOREIGN KEY (t_email) references T_Member (t_email) -- 전체회원 외래키
);

CREATE TABLE together(
to_no number PRIMARY KEY,
to_name varchar2(255),
to_video varchar2(255),
to_team_type varchar2(255),
to_detail varchar2(2000),
to_start_date varchar2(255),
to_end_date varchar2(255),
to_tel varchar2(255),
to_teamleader varchar2(255)
);

--테이블 별 시퀀스 생성 --
CREATE SEQUENCE seq_backed;
CREATE SEQUENCE seq_show;
CREATE SEQUENCE seq_sms;
CREATE SEQUENCE seq_sponser;
CREATE SEQUENCE seq_video;
CREATE SEQUENCE seq_together;
CREATE SEQUENCE seq_videoreply;