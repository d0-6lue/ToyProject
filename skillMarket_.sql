-- Drop
------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE "MEMBER"                 CASCADE CONSTRAINTS PURGE;
DROP TABLE "MEMBER_STATUS"          CASCADE CONSTRAINTS PURGE;

DROP TABLE "FREELANCER"             CASCADE CONSTRAINTS PURGE;
DROP TABLE "FREELANCER_CLASS"       CASCADE CONSTRAINTS PURGE;
DROP TABLE "CAREER"                 CASCADE CONSTRAINTS PURGE;
DROP TABLE "EDUCATION"              CASCADE CONSTRAINTS PURGE;
DROP TABLE "EDU_SCH_STATUS"         CASCADE CONSTRAINTS PURGE;

DROP TABLE "ESTIMATE"               CASCADE CONSTRAINTS PURGE;
DROP TABLE "ESTIMATE_CAT"           CASCADE CONSTRAINTS PURGE;
DROP TABLE "ESTIMATE_OPTION"        CASCADE CONSTRAINTS PURGE;

DROP TABLE "QUOTATION"              CASCADE CONSTRAINTS PURGE;
DROP TABLE "QUOTATION_STATUS"       CASCADE CONSTRAINTS PURGE;


-- Create
------------------------------------------------------------------------------------------------------------------------------------------
-- Member
CREATE TABLE "MEMBER" (
	"MEMBER_NO"	            NUMBER		            NOT NULL,
	"STATUS_NO"	            CHAR(1)	DEFAULT 1	    NOT NULL,
	"MEMBER_ID"	            VARCHAR2(16)		    NOT NULL,
	"MEMBER_PWD"	        VARCHAR2(20)		    NOT NULL,
	"MEMBER_NICK"	        VARCHAR2(30)		    NOT NULL,
    "MEMBER_NAME"           VARCHAR2(15)            NOT NULL,
	"MEMBER_PHONE"	        CHAR(11)		                ,
	"MEMBER_EMAIL"	        VARCHAR2(100)		            ,
	"MEMBER_INTERST"	    VARCHAR2(100)		            ,
	"MEMBER_SIGN_DATE"	    TIMESTAMP	    DEFAULT SYSDATE	,
	"MEMBER_MODIFI_DATE"	TIMESTAMP	    DEFAULT SYSDATE	,
	"MEMBER_BANK"	        VARCHAR2(18)		            ,
	"MEMBER_ACCOUNT"	    VARCHAR2(100)		            ,
	"MEMBER_CASH"	        NUMBER		                    ,
	"MEMBER_PROFILE_PHOTO"	VARCHAR2(100)		            ,
	"MEMBER_NICK_STATUS"	CHAR(1)		    DEFAULT 'N'     ,
    "MEMBER_ADDRESS"        VARCHAR2(300)
);


CREATE TABLE "MEMBER_STATUS" (
	"STATUS_NO"     	        NUMBER		        NOT NULL,
	"STATUS_NAME"	            VARCHAR2(10)		
);

-- Freelancer
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE "FREELANCER" (
	"FREELANCER_NO"	            NUMBER		    NOT NULL,
	"MEMBER_NO"	                NUMBER		    NOT NULL,
	"FREELANCER_CLASS_NO"	    NUMBER		    NOT NULL,
	"FREELANCER_INRODUCTION"	VARCHAR2(500)		    ,
	"FIELD_OF_EXPERTISE"	    VARCHAR2(200)		    ,
	"FREELANCER_ADDRESS"	    VARCHAR2(200)		    ,
	"FREELANCER_CONTACT_TIME"	VARCHAR2(50)		    ,
	"FREELANCER_STATUS"	        CHAR(1)		
);


CREATE TABLE "FREELANCER_CLASS" (
	"FREELANCER_CLASS_NO"	    NUMBER		    NOT NULL,
	"FREELANCER_CLASS_NAME"	    VARCHAR2(30)		
);


CREATE TABLE "CAREER" (
	"CAREER_NO"	        NUMBER		NOT NULL,
	"FREELANCER_NO" 	NUMBER		NOT NULL,
	"CAREER_DATE"	    NUMBER		        ,
	"CAREER_COMPANY"	VARCHAR(30)		    ,
	"CAREER_DEPT"	    VARCHAR(30)		    ,
	"CAREER_RESP"	    VARCHAR(30)		    ,
	"CAREER_LOCATION"	VARCHAR(15)		    ,
	"CAREER_EMP_DATE"	NUMBER		
);


CREATE TABLE "EDUCATION" (
	"EDU_NO"	        NUMBER		NOT NULL,
	"FREELANCER_NO"	    NUMBER		NOT NULL,
	"EDU_STATUS_NO"	    NUMBER		NOT NULL,
	"EDU_SCH"	        VARCHAR(72)		    ,
	"EDU_DEP"	        VARCHAR(72)		
);


CREATE TABLE "EDU_SCH_STATUS" (
	"EDU_STATUS_NO"	    NUMBER		NOT NULL,
	"STATUS_NAME"	    CHAR(6)		
);

-- Estimate
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE "ESTIMATE" (
	"ESTIMATE_NO"	                NUMBER		    NOT NULL,
	"FREELANCER_NO"	                NUMBER		    NOT NULL,
	"ESTIMATE_CAT_NO"	            NUMBER		    NOT NULL,
	"ESTIMATE_TITLE"	            VARCHAR2(300)		    ,
	"ESTIMATE_THUMBNAIL"	        VARCHAR2(100)		    ,
	"ESTIMATE_LINE_INTRODUCTION"	VARCHAR2(1500)		    ,
	"ESTIMATE_PRICE"	            NUMBER		            ,
    ESTIMATE_PERIOD                 NUMBER                  ,
	"ESTIMATE_DETAIL"	            VARCHAR2(4000)		    ,
	"ESTIMATE_DETAIL_FILE"	        VARCHAR2(4000)		    ,
	"ESTIMATE_PORTFOLIO"	        VARCHAR2(100)		    ,
	"BUSINESS_REGISTRATION_NUMBER"	VARCHAR2(10)		    ,
	"ESTIMATE_ENROLL_DATE"	        TIMESTAMP		        ,
	"ESTIMATE_MODIFICATION_DATE"	TIMESTAMP		        ,
	"ESTIMATE_STATUS"	            CHAR(1)		            ,
	"ESTIMATE_VIEWS"	            NUMBER		
);


CREATE TABLE "ESTIMATE_CAT" (
	"ESTIMATE_CAT_NO"	                NUMBER		    NOT NULL,
	"ABOVE_CAT_NO"	                    NUMBER		    NOT NULL,
	"ESTIMATE_CAT_NAME"	                VARCHAR2(60)		    ,
	"ESTIMATE_CAT_SCOPE"	            VARCHAR2(9)
);


CREATE TABLE "ESTIMATE_OPTION" (
	"ESTIMATE_OPTION_NO"	        NUMBER		    NOT NULL,
	"ESTIMATE_NO"	                NUMBER		    NOT NULL,
	"ESTIMATE_OPTION_NAME"	        VARCHAR2(200)		    ,
	"ESTIMATE_OPTION_PRICE"	        NUMBER		            ,
	"ESTIMATE_OPTION_PERIOD"	    NUMBER		
);

-- Quotation
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE "QUOTATION" (
	"QUOTATION_NO"	                NUMBER		    NOT NULL,
	"ESTIMATE_NO"	                NUMBER		    NOT NULL,
	"QUOTATION_PREV_VER"	        NUMBER		            ,
	"MEMBER_NO"	                    NUMBER		    NOT NULL,
	"QUOTATION_STATUS_NO"	        NUMBER		    NOT NULL,
	"QUOTATION_PRICE"	            NUMBER		            ,
	"QUOTATION_PERIOD"	            VARCHAR2(100)	    	,
	"QUOTATION_ENROLL_DATE"	        TIMESTAMP		        ,
	"QUOTATION_MODIFICATION_DATE"	TIMESTAMP		
);


CREATE TABLE "QUOTATION_STATUS" (
	"QUOTATION_STATUS_NO"	    NUMBER		    NOT NULL,
	"QUOTATION_STATUS_NAME"	    VARCHAR2(100)		
);

CREATE TABLE QUOATATION_OPTION (
    QUOTATION_OPTION_NO         NUMBER  NOT NULL,
    QUOTATION_NO                NUMBER  NOT NULL,
    ESTIMATE_OPTION_NO          NUMBER  NOT NULL,
    QUOTATION_OPTION_QUANTITY   NUMBER
);




-- Sample Data
------------------------------------------------------------------------------------------------------------------------------------------
-- 회원 상태
INSERT INTO MEMBER_STATUS (STATUS_NO, STATUS_NAME) VALUES ( 1, '정상' );
INSERT INTO MEMBER_STATUS (STATUS_NO, STATUS_NAME) VALUES ( 2, '탈퇴' );


-- 일반회원 1
INSERT INTO MEMBER
( MEMBER_NO, STATUS_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NICK, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_INTERST, 
MEMBER_SIGN_DATE, MEMBER_MODIFI_DATE, MEMBER_BANK, MEMBER_ACCOUNT, MEMBER_CASH, MEMBER_PROFILE_PHOTO,MEMBER_NICK_STATUS, MEMBER_ADDRESS )
VALUES (1, 1, 'user01', '1234', 'tester01', '홍길동', '01011111111', 'user01@gmail.com', 'programming',
SYSDATE, NULL, '카카오뱅크', '1112222333333', 2500000, NULL, NULL, '역삼동');



-- 프리랜서 회원 1
INSERT INTO MEMBER
( MEMBER_NO, STATUS_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NICK, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_INTERST, 
MEMBER_SIGN_DATE, MEMBER_MODIFI_DATE, MEMBER_BANK, MEMBER_ACCOUNT, MEMBER_CASH, MEMBER_PROFILE_PHOTO,MEMBER_NICK_STATUS, MEMBER_ADDRESS)
VALUES (2, 1, 'user02', '1234', 'tester02', '최진사', '01022222222', 'user02@gmail.com', 'programming',
SYSDATE, NULL, '카카오뱅크', '4445555666666', 1500000, NULL, NULL, '역삼동');

-- ( 프리랜서 번호,  회원번호, 클래서번호, ... )
INSERT INTO FREELANCER
( FREELANCER_NO, MEMBER_NO, FREELANCER_CLASS_NO, FREELANCER_INRODUCTION, FIELD_OF_EXPERTISE,
FREELANCER_ADDRESS, FREELANCER_CONTACT_TIME, FREELANCER_STATUS )
VALUES ( 1, 2, 1, '프리랜서 자기소개', '웹 프로그래밍', '역삼동', '10:00~22:00', 1);



-- 견적서 카테고리 ( 카테고리번호, 상위카테고리번호, 카테고리이름, 카테고리범위 )
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE )
VALUES ( 1, 0, 'IT_프로그래밍', '대분류');
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE )
VALUES ( 11, 1, '웹', '중분류');
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE )
VALUES ( 111, 11, '홈페이지', '소분류');



-- 견적서 ( 견적서번호, 프리랜서번호, 견적서카테고리번호, ...)
INSERT INTO ESTIMATE
( ESTIMATE_NO, FREELANCER_NO, ESTIMATE_CAT_NO, ESTIMATE_TITLE, ESTIMATE_THUMBNAIL, ESTIMATE_LINE_INTRODUCTION,
ESTIMATE_PRICE, ESTIMATE_PERIOD, ESTIMATE_DETAIL, ESTIMATE_DETAIL_FILE, ESTIMATE_PORTFOLIO, BUSINESS_REGISTRATION_NUMBER,
ESTIMATE_ENROLL_DATE, ESTIMATE_MODIFICATION_DATE, ESTIMATE_STATUS, ESTIMATE_VIEWS )
VALUES ( 1, 1, 111, '웹 홈페이지 제작', NULL, '한줄소개입니다 ~~~', 3000000, 180, '상세내용 상세내용 상세내용 상세내용', '상세내용 파일(?)',
NULL, NULL, SYSDATE, NULL, 1, 0);



-- 견적서 옵션 ( 옵션번호, 견적서번호, 옵션이름, 옵션가격, 옵션기간 )
INSERT INTO ESTIMATE_OPTION
( ESTIMATE_OPTION_NO, ESTIMATE_NO, ESTIMATE_OPTION_NAME, ESTIMATE_OPTION_PRICE, ESTIMATE_OPTION_PERIOD )
VALUES (1, 1, '옵션1', 100000, 1);
INSERT INTO ESTIMATE_OPTION
( ESTIMATE_OPTION_NO, ESTIMATE_NO, ESTIMATE_OPTION_NAME, ESTIMATE_OPTION_PRICE, ESTIMATE_OPTION_PERIOD )
VALUES (2, 1, '옵션2', 500000, 3);



-- 주문서 상태
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 1, '진행중' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 2, '중지' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 3, '요청중' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 4, '취소' );



-- 주문서 ( 주문서번호, 견적서번호, 수정전주문서번호, 구매자회원번호, 주문서상태번호, 주문서총금액, 주문서총기간, 주문서작성일시, 수정일시 )
INSERT INTO QUOTATION
( QUOTATION_NO, ESTIMATE_NO, QUOTATION_PREV_VER, MEMBER_NO, QUOTATION_STATUS_NO, QUOTATION_PRICE, QUOTATION_PERIOD,
QUOTATION_ENROLL_DATE, QUOTATION_MODIFICATION_DATE)
VALUES ( 1, 1, NULL, 1, 1, 3700000, 185, SYSDATE, NULL);


INSERT INTO QUOTATION
( QUOTATION_NO, ESTIMATE_NO, QUOTATION_PREV_VER, MEMBER_NO, QUOTATION_STATUS_NO, QUOTATION_PRICE, QUOTATION_PERIOD,
QUOTATION_ENROLL_DATE, QUOTATION_MODIFICATION_DATE)
VALUES ( 2, 1, NULL, 1, 1, 4500000, 191, TO_DATE('2022-12-30'), NULL);


-- 주문서 옵션 ( 주문서옵션번호, 주문서번호, 견적서옵션번호, 옵션수량 )
INSERT INTO QUOATATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 1, 1, 1, 2);
INSERT INTO QUOATATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 2, 1, 2, 1);


INSERT INTO QUOATATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 3, 2, 1, 5);
INSERT INTO QUOATATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 4, 2, 2, 2);




------------------------------------------------------------------------------------------------------------------------------------------
commit;

SELECT QUOTATION_NO, QUOTATION_PREV_VER, QUOTATION_STATUS_NAME, QUOTATION_PRICE, QUOTATION_PERIOD,
TO_CHAR(QUOTATION_ENROLL_DATE, 'YYYY-MM-DD') AS QUOTATION_ENROLL_DATE, TO_CHAR(QUOTATION_MODIFICATION_DATE, 'YYYY-MM-DD') AS QUOTATION_MODIFICATION_DATE,
A.MEMBER_NO, B.MEMBER_NICK AS BUYER,
A.ESTIMATE_NO, ESTIMATE_TITLE, ESTIMATE_THUMBNAIL, ESTIMATE_LINE_INTRODUCTION, ESTIMATE_DETAIL, ESTIMATE_PRICE, ESTIMATE_PERIOD,
C.MEMBER_NICK AS SELLER
FROM QUOTATION A
    JOIN MEMBER B ON A.MEMBER_NO = B.MEMBER_NO
    JOIN 
    (SELECT *
    FROM FREELANCER A
        JOIN MEMBER B ON A.MEMBER_NO = B.MEMBER_NO
        JOIN ESTIMATE C ON A.FREELANCER_NO = C.FREELANCER_NO
    WHERE A.FREELANCER_NO =
        (SELECT ESTIMATE_NO
        FROM QUOTATION
        WHERE QUOTATION_NO = 1
    )
    ) C ON A.ESTIMATE_NO = C.ESTIMATE_NO
    JOIN QUOTATION_STATUS D ON A.QUOTATION_STATUS_NO = D.QUOTATION_STATUS_NO
WHERE A.QUOTATION_NO = 1;

SELECT QUOTATION_OPTION_NO, QUOTATION_OPTION_QUANTITY,
ESTIMATE_NO, ESTIMATE_OPTION_NAME, ESTIMATE_OPTION_PRICE, ESTIMATE_OPTION_PERIOD
FROM QUOATATION_OPTION A
    JOIN ESTIMATE_OPTION B ON A.ESTIMATE_OPTION_NO = B.ESTIMATE_OPTION_NO
WHERE QUOTATION_NO = 1;


SELECT MEMBER_NO
FROM QUOTATION A
    JOIN (SELECT ESTIMATE_NO, MEMBER_NICK
        FROM ESTIMATE A JOIN FREELANCER) B ON A.ESTIMATE_NO = B.ESTIMATE
    


