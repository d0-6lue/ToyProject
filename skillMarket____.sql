-- Drop
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE "QUOTATION"                  CASCADE CONSTRAINTS PURGE;
DROP TABLE "QUOTATION_STATUS"           CASCADE CONSTRAINTS PURGE;
DROP TABLE "QUOTATION_OPTION"           CASCADE CONSTRAINTS PURGE;

DROP TABLE CHAT_LOG                     CASCADE CONSTRAINTS;
DROP TABLE CHAT_REQUEST                 CASCADE CONSTRAINTS;
DROP TABLE CHAT_REQUEST_CAT             CASCADE CONSTRAINTS;
DROP TABLE REQUEST_STATUS               CASCADE CONSTRAINTS;

DROP TABLE PAYMENT_METHOD CASCADE CONSTRAINTS;
DROP TABLE CASH_CHARGE_LOG CASCADE CONSTRAINTS;
DROP TABLE POINT_LOG CASCADE CONSTRAINTS;
DROP TABLE USER_CASH CASCADE CONSTRAINTS;

DROP TABLE SALES_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE SALES_LOG CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CHAT_LOG_NO;
DROP SEQUENCE SEQ_CHAT_REQUEST_NO;
DROP SEQUENCE SEQ_QUOTATION_OPTION_NO;

DROP SEQUENCE SEQ_CASH_CHARGE_NO;
DROP SEQUENCE SEQ_POINT_LOG_NO;

-- Create
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table
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

CREATE TABLE "QUOTATION_OPTION" (
    QUOTATION_OPTION_NO         NUMBER  NOT NULL,
    QUOTATION_NO                NUMBER  NOT NULL,
    ESTIMATE_OPTION_NO          NUMBER  NOT NULL,
    QUOTATION_OPTION_QUANTITY   NUMBER
);


CREATE TABLE CHAT_LOG (
    CHAT_NO             NUMBER          PRIMARY KEY,
    QUOTATION_NO        NUMBER          NOT NULL,
    CHAT_SENDER         NUMBER          NOT NULL,
    CHAT_CONTENT        VARCHAR2(2000),
    CHAT_REQUEST        CHAR(1)         DEFAULT 'X'  CONSTRAINT CHAT_REQUEST_CHECK CHECK (CHAT_REQUEST IN ('O', 'X')),
    CHAT_ATTACHMENT     CHAR(1)         DEFAULT 'X'  CONSTRAINT CHAT_ATTACHMENT_CHECK CHECK (CHAT_ATTACHMENT IN ('O', 'X')),
    CHAT_READ           CHAR(1)         DEFAULT 'X'  CONSTRAINT CHAT_READ_CHECK CHECK (CHAT_READ IN ('O', 'X')),
    CHAT_STATUS         CHAR(1)         DEFAULT 'O'  CONSTRAINT CHAT_STATUS_CHECK CHECK (CHAT_STATUS IN ('O', 'X')),
    CHAT_ENROLL_DATE    TIMESTAMP       DEFAULT SYSDATE
);

CREATE TABLE CHAT_ATTACHMENT (
    CHAT_ATTACHMENT_NO      NUMBER          PRIMARY KEY, 
    CHAT_NO                 NUMBER          NOT NULL,
    ORIGIN_NAME             VARCHAR2(1000)  NOT NULL,
    CHANGE_NAME             VARCHAR2(1000)  NOT NULL,
    ENROLL_DATE             TIMESTAMP       ,
    STATUS                  CHAR(1)         DEFAULT 'O' CHECK ( STATUS IN ('O' , 'X') )
);


CREATE TABLE CHAT_REQUEST_CAT (
    CHAT_REQUEST_CAT_NO     NUMBER      PRIMARY KEY,
    CHAT_REQUEST_CAT_NAME   VARCHAR2(60)
);

CREATE TABLE CHAT_REQUEST (
    REQUEST_NO              NUMBER          PRIMARY KEY,
    CHAT_LOG_NO             NUMBER          NOT NULL,
    REQUEST_CAT_NO          NUMBER          NOT NULL,
    REQUEST_CONTENT         VARCHAR2(3000),
    REQUEST_ENROLL_DATE     TIMESTAMP       DEFAULT SYSDATE,
    REQUEST_STATUS_NO       NUMBER          DEFAULT '1',
    OPTION_NO               NUMBER,
    INPUT_NO                NUMBER
);

CREATE TABLE REQUEST_STATUS (
    REQUEST_STATUS_NO       NUMBER          PRIMARY KEY,
    REQUEST_STATUS_NAME     VARCHAR2(30)    NOT NULL
);

CREATE TABLE PAYMENT_METHOD (
    NO                      NUMBER          PRIMARY KEY,
    PAYMENT_METHOD_NAME     VARCHAR(30)     NOT NULL
);

CREATE TABLE CASH_CHARGE_LOG (
    NO                      NUMBER          PRIMARY KEY,
    MEMBER_NO               NUMBER          NOT NULL,
    PAYMENT_METHOD_NO       NUMBER          NOT NULL,
    CHARGE_AMOUNT           NUMBER          NOT NULL,
    CHARGE_DATE             TIMESTAMP       DEFAULT SYSDATE
);

CREATE TABLE POINT_LOG (
    NO                      NUMBER          PRIMARY KEY,
    CASH_CHARGE_LOG_NO      NUMBER          NOT NULL,
    POINT_AMOUNT            NUMBER          NOT NULL
);

CREATE TABLE USER_CASH (
    MEMBER_NO           NUMBER                  NOT NULL,
    CASH_MONEY          NUMBER      DEFAULT 0   NOT NULL,
    CASH_POINT          NUMBER      DEFAULT 0   NOT NULL
);

CREATE TABLE SALES_CATEGORY (
    NO                  NUMBER          PRIMARY KEY,
    CATEGORY_NAME      VARCHAR2(30)    NOT NULL,
    COMMITION           NUMBER          NOT NULL
);

CREATE TABLE SALES_LOG (
    NO                  NUMBER      PRIMARY KEY,
    CATEGORY_NO         NUMBER      NOT NULL,
    SALES               NUMBER      NOT NULL,
    ENROLL_DATE         TIMESTAMP   DEFAULT SYSDATE,
    QUOTATION_NO        NUMBER
);

-- Sequence
CREATE SEQUENCE SEQ_CHAT_LOG_NO             NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_CHAT_REQUEST_NO         NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_QUOTATION_OPTION_NO     NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_CASH_CHARGE_NO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_POINT_LOG_NO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_SALES_LOG_NO NOCACHE NOCYCLE;

-- Sample Data
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
commit;
rollback;

-- 회원
INSERT INTO MEMBER
( MEMBER_NO, STATUS_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NICK, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_INTERST, 
MEMBER_SIGN_DATE, MEMBER_MODIFI_DATE, MEMBER_BANK, MEMBER_ACCOUNT, MEMBER_CASH, MEMBER_PROFILE_PHOTO,MEMBER_NICK_STATUS, MEMBER_ADDRESS )
VALUES (501, 1, 'user501', '1234', 'dlwlrma', '이지금', '01011111111', 'user501@gmail.com', 'programming',
SYSDATE, NULL, '카카오뱅크', '3111223333333', 2500000, '기본프로필.svg', DEFAULT, '역삼동');

INSERT INTO USER_CASH (MEMBER_NO, CASH_MONEY, CASH_POINT)
VALUES (501, 2500000, 7860)
;

-- 프리랜서 회원 1
INSERT INTO MEMBER
( MEMBER_NO, STATUS_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NICK, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_INTERST, 
MEMBER_SIGN_DATE, MEMBER_MODIFI_DATE, MEMBER_BANK, MEMBER_ACCOUNT, MEMBER_CASH, MEMBER_PROFILE_PHOTO,MEMBER_NICK_STATUS, MEMBER_ADDRESS)
VALUES (502, 1, 'user502', '1234', 'karina', '카리나', '01022222222', 'user502@gmail.com', 'programming',
SYSDATE, NULL, '신한은행', '444555666666', 1500000, '기본프로필.svg', DEFAULT, '역삼동');

INSERT INTO USER_CASH (MEMBER_NO, CASH_MONEY, CASH_POINT)
VALUES (502, 1500000, 5240)
;
-- ( 프리랜서 번호,  회원번호, 클래서번호, ... )
INSERT INTO FREELANCER
( FREELANCER_NO, MEMBER_NO, FREELANCER_CLASS_NO, FREELANCER_INRODUCTION, FIELD_OF_EXPERTISE, FREELANCER_CONTACT_TIME, FREELANCER_STATUS )
VALUES ( 601, 502, 1, '성실히 맡은 업무를 다하는 개발자 ㅇㅇㅇ입니다.', '웹 프로그래밍', '10:00~22:00', 'Y');




-- 견적서 카테고리 ( 카테고리번호, 상위카테고리번호, 카테고리이름, 카테고리범위(1:대, 2:중, 3:소 )
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE, ESTIMATE_CAT_FILE )
VALUES ( 1, 0, 'IT_프로그래밍', '1', null);
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE, ESTIMATE_CAT_FILE )
VALUES ( 101, 1, '웹', '2', null);
INSERT INTO ESTIMATE_CAT
( ESTIMATE_CAT_NO, ABOVE_CAT_NO, ESTIMATE_CAT_NAME, ESTIMATE_CAT_SCOPE, ESTIMATE_CAT_FILE )
VALUES ( 10101, 101, '홈페이지', '3', null);

-- 견적서 ( 견적서번호, 프리랜서번호, 견적서카테고리번호, ...)
INSERT INTO ESTIMATE
( ESTIMATE_NO, FREELANCER_NO, ESTIMATE_CAT_NO, ESTIMATE_TITLE, ESTIMATE_THUMBNAIL, ESTIMATE_LINE_INTRODUCTION,
ESTIMATE_PRICE, ESTIMATE_PERIOD, ESTIMATE_DETAIL, ESTIMATE_DETAIL_FILE, ESTIMATE_PORTFOLIO, BUSINESS_REGISTRATION_NUMBER,
ESTIMATE_ENROLL_DATE, ESTIMATE_MODIFICATION_DATE, ESTIMATE_STATUS, ESTIMATE_VIEWS )
VALUES ( 701, 601, 10101, '저렴한 가격에 퀄리티 높은 반응형 홈페이지 제작해드립니다.', '프로젝트701썸네일.png', '최적의 홈페이지를 만들기 위해 스스로 기획하고 작업하며 고객님의 만족하는 모습을 목표로 하는 전문가들', 770000, 12, '서비스 설명 : 최적의 홈페이지를 만들기 위해 .. 추구하는 홈페이지는 .. 포트폴리오 .. 유지보수 내역 ..', '상세내용 파일(?)'
, '프로젝트701포트폴리오.png', NULL, SYSDATE, NULL, 'Y', 232);

-- 견적서 옵션 ( 옵션번호, 견적서번호, 옵션이름, 옵션가격, 옵션기간 )
INSERT INTO ESTIMATE_OPTION
( ESTIMATE_OPTION_NO, ESTIMATE_NO, ESTIMATE_OPTION_NAME, ESTIMATE_OPTION_PRICE, ESTIMATE_OPTION_PERIOD )
VALUES (801, 701, 'DELUXE 옵션', 100000, 1);
INSERT INTO ESTIMATE_OPTION
( ESTIMATE_OPTION_NO, ESTIMATE_NO, ESTIMATE_OPTION_NAME, ESTIMATE_OPTION_PRICE, ESTIMATE_OPTION_PERIOD )
VALUES (802, 701, 'PREMIUM 옵션', 590000, 5);



-- 주문서 상태
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 1, '진행중' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 2, '완료' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 3, '중지' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 4, '취소' );

-- 주문서 ( 주문서번호, 견적서번호, 수정전주문서번호, 구매자회원번호, 주문서상태번호, 주문서총금액, 주문서총기간, 주문서작성일시, 수정일시 )
INSERT INTO QUOTATION
( QUOTATION_NO, ESTIMATE_NO, QUOTATION_PREV_VER, MEMBER_NO, QUOTATION_STATUS_NO, QUOTATION_PRICE, QUOTATION_PERIOD,
QUOTATION_ENROLL_DATE, QUOTATION_MODIFICATION_DATE)
VALUES ( 901, 701, NULL, 501, 1, 1660000, 20, SYSDATE, NULL);

INSERT INTO QUOTATION
( QUOTATION_NO, ESTIMATE_NO, QUOTATION_PREV_VER, MEMBER_NO, QUOTATION_STATUS_NO, QUOTATION_PRICE, QUOTATION_PERIOD,
QUOTATION_ENROLL_DATE, QUOTATION_MODIFICATION_DATE)
VALUES ( 902, 702, NULL, 501, 1, 3000000, 191, TO_DATE('2022-12-30'), NULL);

-- 주문서 옵션 ( 주문서옵션번호, 주문서번호, 견적서옵션번호, 옵션수량 )
INSERT INTO QUOTATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 401, 901, 801, 3);
INSERT INTO QUOTATION_OPTION
( QUOTATION_OPTION_NO, QUOTATION_NO, ESTIMATE_OPTION_NO, QUOTATION_OPTION_QUANTITY )
VALUES ( 402, 901, 802, 1);


-- 주문서 상태
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 1, '진행중' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 2, '완료' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 3, '중지' );
INSERT INTO QUOTATION_STATUS
( QUOTATION_STATUS_NO, QUOTATION_STATUS_NAME )
VALUES( 4, '취소' );

-- 요청 카테고리
INSERT INTO CHAT_REQUEST_CAT VALUES ( 100, '거래 완료');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 200, '거래 취소');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 300, '옵션 추가');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 400, '옵션 취소');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 500, '마감기간 단축');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 600, '마감기간 연장');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 700, '수정 요청');
INSERT INTO CHAT_REQUEST_CAT VALUES ( 800, '선금 요청');

-- 요청 상태
INSERT INTO REQUEST_STATUS VALUES (1, '요청중');
INSERT INTO REQUEST_STATUS VALUES (2, '수락');
INSERT INTO REQUEST_STATUS VALUES (3, '거절');
INSERT INTO REQUEST_STATUS VALUES (4, '만기');

-- 결제 방법
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 1, '신용카드' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 2, '계좌이체' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 3, '휴대폰 결제' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 4, '캐시 결제' );

-- 매출원(?)
INSERT INTO SALES_CATEGORY (NO, CATEGORY_NAME, COMMITION) VALUES (1, '구매 수수료', 3);
INSERT INTO SALES_CATEGORY (NO, CATEGORY_NAME, COMMITION) VALUES (1, '판매 수수료', 15);



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
