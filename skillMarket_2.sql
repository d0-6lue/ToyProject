DROP TABLE CHAT_LOG CASCADE CONSTRAINTS;
CREATE TABLE CHAT_LOG (
    CHAT_NO             NUMBER          PRIMARY KEY,
    QUOTATION_NO        NUMBER          NOT NULL,
    CHAT_SENDER         NUMBER          NOT NULL,
    CHAT_CONTENT        VARCHAR2(2000),
    REQUEST_NO          NUMBER,
    CHAT_ATTACHMENT     CHAR(1)         DEFAULT 'X'  CONSTRAINT CHAT_ATTACHMENT CHECK (CHAT_READ IN ('O', 'X')),
    CHAT_READ           CHAR(1)         DEFAULT 'X'  CONSTRAINT CHAT_READ_CHECK CHECK (CHAT_READ IN ('O', 'X')),
    CHAT_STATUS         CHAR(1)         DEFAULT 'O'  CONSTRAINT CHAT_STATUS CHECK (CHAT_READ IN ('O', 'X'))
)
;

DROP TABLE CHAT_ATTACHMENT CASCADE CONSTRAINTS;
CREATE TABLE CHAT_ATTACHMENT (
    CHAT_ATTACHMENT_NO      NUMBER          PRIMARY KEY, 
    CHAT_NO                 NUMBER          NOT NULL,
    ORIGIN_NAME             VARCHAR2(1000)  NOT NULL,
    CHANGE_NAME             VARCHAR2(1000)  NOT NULL,
    ENROLL_DATE             TIMESTAMP       DEFAULT SYSDATE,
    STATUS                  CHAR(1)         DEFAULT 'O' CHECK ( STATUS IN ('O' , 'X') )
)
;

DROP TABLE CHAT_REQUEST CASCADE CONSTRAINTS;
CREATE TABLE CHAT_REQUEST (
    REQUEST_NO  NUMBER  PRIMARY KEY

)
;