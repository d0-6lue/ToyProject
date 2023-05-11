-- Toy Project 03

/*
-- ��������
CREATE USER C##TOY IDENTIFIED BY "1234";
-- ���Ѻο�
GRANT CONNECT, RESOURCE TO C##TOY;
ALTER USER C##TOY DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS; -- INSERT�� ���� ����
*/

SET AUTOCOMMIT OFF;

-- 모든 테이블 삭제
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
-- 모든 오브젝트 삭제
SELECT 'DROP ' || OBJECT_TYPE || ' ' || OBJECT_NAME || DECODE(OBJECT_TYPE,'TABLE',' CASCADE CONSTRAINTS;',';')
FROM USER_OBJECTS;

-------------------------------------------------------------------------------------------------------------------

DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER (
    MEMBER_NO           NUMBER          PRIMARY KEY,
    MEMBER_ID           VARCHAR2(21)    UNIQUE NOT NULL,
    MEMBER_PW           VARCHAR2(26)    NOT NULL,
    MEMBER_NICK         VARCHAR2(33)    UNIQUE NOT NULL,
    MEMBER_PROFILE      VARCHAR2(100),
    
    MEMBER_STATUS       CHAR(1)         DEFAULT '1',
    
    MEMBER_ENROLL_DATE   TIMESTAMP      DEFAULT SYSDATE,
    MEMBER_MODIFY_DATE   TIMESTAMP      DEFAULT NULL
);
DROP SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

INSERT INTO MEMBER 
(MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NICK, MEMBER_PROFILE, MEMBER_STATUS, MEMBER_ENROLL_DATE, MEMBER_MODIFY_DATE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'USER01', '1234', 'FIRSTMAN', NULL, DEFAULT, DEFAULT, DEFAULT);

