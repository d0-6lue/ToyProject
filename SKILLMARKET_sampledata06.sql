DROP TABLE PAYMENT_METHOD CASCADE CONSTRAINTS;
DROP TABLE CASH_CHARGE_LOG CASCADE CONSTRAINTS;
DROP TABLE POINT_LOG CASCADE CONSTRAINTS;
DROP TABLE MEMBER_HOLDING_CASH CASCADE CONSTRAINTS;

DROP TABLE SALES_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE SALES_LOG CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CASH_CHARGE_NO;
DROP SEQUENCE SEQ_POINT_LOG_NO;



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

CREATE TABLE MEMBER_HOLDING_CASH (
    MEMBER_NO           NUMBER                  NOT NULL,
    HOLDING_CASH        NUMBER      DEFAULT 0   NOT NULL,
    HOLODING_POINT      NUMBER      DEFAULT 0   NOT NULL
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

CREATE SEQUENCE SEQ_CASH_CHARGE_NO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_POINT_LOG_NO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_SALES_LOG_NO NOCACHE NOCYCLE;


INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 1, '신용카드' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 2, '계좌이체' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 3, '휴대폰 결제' );
INSERT INTO PAYMENT_METHOD (NO, PAYMENT_METHOD_NAME) VALUES ( 4, '캐시 결제' );

INSERT INTO SALES_CATEGORY (NO, CATEGORY_NAME, COMMITION) VALUES (1, '구매 수수료', 3);
INSERT INTO SALES_CATEGORY (NO, CATEGORY_NAME, COMMITION) VALUES (1, '판매 수수료', 15);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO CASH_CHARGE_LOG (NO, MEMBER_NO, PAYMENT_METHOD_NO, CHARGE_AMOUNT, CHARGE_DATE)
VALUES (SEQ_CASH_CHARGE_NO.NEXTVAL, ?, ?, ?, DEFAULT)
;

INSERT INTO POINT_LOG (NO, CHSH_CHARGE_LOG_NO, POINT_AMOUNT)
VALUES (SEQ_POINT_LOG_NO.NEXTVAL, ?, ?)
;
