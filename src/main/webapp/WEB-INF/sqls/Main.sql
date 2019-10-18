DROP TABLE DEP;

CREATE TABLE DEP(
	DEP_NO NUMBER(2) PRIMARY KEY,
	DEP_NAME VARCHAR2(20) NOT NULL CONSTRAINT EMPCHECK UNIQUE
)

INSERT INTO DEP VALUES('00','사장');
INSERT INTO DEP VALUES('01','영업');
INSERT INTO DEP VALUES('02','디자인');
INSERT INTO DEP VALUES('03','개발');

DROP TABLE EMP;

CREATE TABLE EMP(
	EMP_NO NUMBER(6) PRIMARY KEY,
	EMP_NAME VARCHAR2(30) NOT NULL
);
INSERT INTO EMP VALUES('000000', '조영찬');
INSERT INTO EMP VALUES('010100', '이태식');
INSERT INTO EMP VALUES('010200', '이두영');
INSERT INTO EMP VALUES('010300', '김현호');
INSERT INTO EMP VALUES('020101', '홍준화');
INSERT INTO EMP VALUES('020201', '이이일');
INSERT INTO EMP VALUES('020202', '이이이');
INSERT INTO EMP VALUES('020301', '이삼일');
INSERT INTO EMP VALUES('020302', '이삼이');
INSERT INTO EMP VALUES('020303', '이삼삼');
INSERT INTO EMP VALUES('020304', '이삼사');
INSERT INTO EMP VALUES('020305', '이삼오');

SELECT * FROM EMP;

DROP TABLE MAIN;
DROP SEQUENCE MAINSEQ;

CREATE SEQUENCE MAINSEQ;

CREATE TABLE MAIN(

	MAIN_SEQ NUMBER PRIMARY KEY,

	MAIN_AUTHORITY VARCHAR2(100) NOT NULL,

	MAIN_NAME VARCHAR2(30) NOT NULL,

	MAIN_ID VARCHAR2(30) NOT NULL CONSTRAINT IDCHECK UNIQUE,

	MAIN_PASSWORD VARCHAR2(3000) NOT NULL,

	MAIN_SEX CHAR(1) NOT NULL CONSTRAINT SEXCHECK CHECK (MAIN_SEX IN ('M','F','X')),

	MAIN_PHONENUMBER VARCHAR2(20) NOT NULL,

	MAIN_EMAIL VARCHAR2(30) NOT NULL,

	MAIN_BIRTH NUMBER(6) NOT NULL,
	
	MAIN_EMP NUMBER(6) NOT NULL CONSTRAINT MAINEMPCHECK UNIQUE,
	
	CONSTRAINT EMP_FK FOREIGN KEY(MAIN_EMP) REFERENCES EMP(EMP_NO)
	
);

ADMIN == zongyeng pw==1q2w3e4r!
user test '이태식' pw==1q2w3e4r!
INSERT INTO MAIN VALUES (MAINSEQ.NEXTVAL,'ROLE_ADMIN','조영찬','zongyeng','{bcrypt}$2a$10$HQ.AJavpJ4awZecuOOFvnuTz6k5NhqOF.IIC6iynVvT.Q7PYjaZFy','M','010-3495-0424','zongyeng1@naver.com','930424','000000');
INSERT INTO MAIN VALUES (MAINSEQ.NEXTVAL,'ROLE_USER','이태식','user','{bcrypt}$2a$10$YzO3Qz2u3DDvw0E1alQ39.bWSp688rXGiajU/e3McDRIAORGrqoKe','M','010-3495-0423','zongyeng1@naver.com','930423','010100');
SELECT MAIN_SEQ, MAIN_SECURITY, MAIN_NAME, MAIN_ID, MAIN_PASSWORD, MAIN_SEX, MAIN_PHONENUMBER, MAIN_EMAIL, MAIN_BIRTH, MAIN_EMP FROM MAIN WHERE MAIN_ID = 'zongyeng' AND  MAIN_PASSWORD = '1234';
SELECT * FROM MAIN;

DELETE FROM MAIN WHERE MAIN_ID='user1';

DROP TABLE DOCSETTLE;
DROP SEQUENCE DOCSEQ;

CREATE SEQUENCE DOCSEQ;

CREATE TABLE DOCSETTLE(
	DOC_SEQ NUMBER PRIMARY KEY,
	MAIN_ID VARCHAR2(100) NOT NULL,
	DRAFT_DATE DATE NOT NULL CONSTRAINT DEFAULT SYSDATE,
	FSETTLE_DATE DATE NOT NULL,
	COLLABORATOR VARCHAR2(100),
	SETTLEMENT VARCHAR2(100) NOT NULL,
	DOC_LOCATION VARCHAR2(1000) NOT NULL,
	CONSTRAINT FK_MAIN_ID FOREIGN KEY(MAIN_ID) REFERENCES MAIN(MAIN_ID);
);
