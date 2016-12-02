
CREATE TABLE Member(
memEmail varchar2(255) PRIMARY KEY,  -- P_MEMBER 공연자회원 기본키
memName varchar2(255),
memPw varchar2(255),
memNick varchar2(255),
memPhone varchar2(255),
memTeamtype varchar2(255),
memTeamphoto varchar2(255), 
memTeamname varchar2(255),
memLeader varchar2(255),
memVideo varchar2(255),
memDetail varchar2(2000),
memStatus varchar2(255),
memType varchar2(255)
);


CREATE TABLE show(
shNo number PRIMARY KEY, -- show 공연 기본키
memEmail varchar2(255),
shTeamname varchar2(255),
shVideo varchar2(255),
shName varchar2(255),
shMapLati varchar2(255),
shMapLongi varchar2(255),
shMapCoords varchar2(255),
shMapAddr varchar2(255),
shMapDetail varchar2(255),
shDate varchar2(255),
shTime varchar2(255),
shType varchar2(255),
shDetail varchar2(255),
CONSTRAINT FK_show_MemEmail FOREIGN KEY (memEmail) references Member (memEmail)  -- show 공연,공연자회원 외래키
);

CREATE TABLE video(
videoNo number PRIMARY KEY, -- video 기본키
memEmail varchar2(255),
videoUrl varchar2(255),
videoName varchar2(255),
videoDetail varchar2(255),
videoCount varchar2(255),
videoLike varchar2(255),
CONSTRAINT FK_vidoe_memEmail FOREIGN KEY (memEmail) references Member (memEmail) -- video 영상 ,공연자회원 외래키
);

CREATE TABLE VideoReply(
reNo number PRIMARY KEY, --VideoReply 영상 댓글 기본키
videoNo number,
memEmail varchar2(255),
reContent varchar2(2000),
CONSTRAINT FK_VideoReply_videoNo FOREIGN KEY (videoNo) references video (videoNo), -- 비디오영상번호 외래키
CONSTRAINT FK_VideoReply_memEmail FOREIGN KEY (memEmail) references member (memEmail) --  전체회원 외래키
);




CREATE TABLE sponser(
spNo number PRIMARY KEY, --스폰서 기본키
memEmail varchar2(255), 
spName varchar2(255),
spPhoto varchar2(255),
spContent varchar2(255),
spCond varchar2(255),
spTel varchar2(255),
CONSTRAINT FK_sponser_memEmail FOREIGN KEY (memEmail) references Member (memEmail)  --전체회원 외래키
);

CREATE TABLE backed(
backNo number PRIMARY KEY, --후원받는사람 기본키
memEmail varchar2(255),
backName varchar2(255),
backVideo varchar2(255),
backContent varchar2(255),
backNeeds varchar2(255),
backTel varchar2(255),
CONSTRAINT FK_backed_memEmail FOREIGN KEY (memEmail) references Member (memEmail) -- 전체회원 외래키
);



--테이블 별 시퀀스 생성 --
CREATE SEQUENCE seq_backed;
CREATE SEQUENCE seq_show;
CREATE SEQUENCE seq_sms;
CREATE SEQUENCE seq_sponser;
CREATE SEQUENCE seq_video;
CREATE SEQUENCE seq_together;
CREATE SEQUENCE seq_videoreply;