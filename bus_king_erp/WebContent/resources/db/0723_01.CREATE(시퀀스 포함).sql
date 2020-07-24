-- 테이블 지우기
DROP TABLE ACCOUNT;
DROP TABLE COMPLAINT;
DROP TABLE PENALTY;
DROP TABLE ACCIDENT;
DROP TABLE WONLYO2;
DROP TABLE WONLYO;
DROP TABLE FUEL;
DROP TABLE REPAIR;
DROP TABLE CALCULATE;
DROP TABLE COMMUTE;
DROP TABLE PAY;
DROP TABLE ALLOCATION;
DROP TABLE EMPLOYER;
DROP TABLE B_R_IMG;
DROP TABLE ROUTE;
DROP TABLE BUS;



-- 여기서부터 테이블 만들기
CREATE TABLE BUS(
B_NO VARCHAR2(20) PRIMARY KEY,
B_YEAR NUMBER,
B_ENERGY VARCHAR2(20),
B_START DATE,
B_TYPE VARCHAR2(20),
B_ACC NUMBER,
B_STATE VARCHAR2(20),
B_MILE NUMBER,
B_RECENT DATE
);


CREATE TABLE ROUTE(
R_NO VARCHAR2(20) PRIMARY KEY,
R_START VARCHAR2(50),
R_END VARCHAR2(50),
R_S_TIME VARCHAR2(20),
R_E_TIME VARCHAR2(20),
R_INTERVAL NUMBER,
R_MAP VARCHAR2(20),
R_PAY_ADULT NUMBER,
R_PAY_ADULT2 NUMBER,
R_PAY_TEEN NUMBER,
R_PAY_TEEN2 NUMBER,
R_PAY_KID NUMBER,
R_PAY_KID2 NUMBER
);


CREATE TABLE EMPLOYER(
E_NO VARCHAR2(20) PRIMARY KEY,
E_NAME VARCHAR2(20),
E_JUMIN VARCHAR2(20),
E_DNAME VARCHAR2(20),
E_POSITION VARCHAR2(20),
E_B_NO varchar2(20) CONSTRAINT EBNO_FK REFERENCES BUS(B_NO),
E_LICENSE VARCHAR2(20),
E_CONTRACT VARCHAR2(20),
E_CAREER NUMBER,
E_BREAK NUMBER,
E_MARRIAGE VARCHAR2(20),
E_DISABLED VARCHAR2(20),
E_HOBBY VARCHAR2(20),
E_SPECIALITY varchar2(20),
E_PHONE varchar2(20),
E_PWD varchar2(100),
E_MAIL varchar2(40),
E_ADD varchar2(40),
E_START DATE,
E_END DATE,
ENABLED NUMBER,
AUTHORITY VARCHAR2(40)
);


CREATE TABLE ALLOCATION(
A_B_NO CONSTRAINT ABNO_FK REFERENCES BUS(B_NO),
A_R_NO CONSTRAINT ARNO_FK REFERENCES ROUTE(R_NO),
A_E_NO CONSTRAINT AENO_FK REFERENCES EMPLOYER(E_NO),
A_E_NAME VARCHAR2(20),
A_TIME VARCHAR2(20),
PRIMARY KEY(A_B_NO, A_R_NO, A_E_NO)
);


CREATE TABLE PAY(
PAY_CODE VARCHAR2(20) PRIMARY KEY,
PAY_YEAR NUMBER,
PAY_MONTH NUMBER,
PAY_DAY DATE,
PAY_E_NO VARCHAR2(20) CONSTRAINT PAYENO_FK REFERENCES EMPLOYER(E_NO),
PAY_E_NAME VARCHAR2(20),
PAY_E_DNAME VARCHAR2(20),
PAY_E_POSITION VARCHAR2(20),
PAY_CHUL NUMBER,
PAY_WORK NUMBER,
PAY_WORK_T NUMBER,
PAY_P NUMBER,
PAY_P_T NUMBER,
PAY_BOB NUMBER,
PAY_CAR NUMBER,
PAY_M NUMBER,
PAY_TAX NUMBER,
PAY_TOTAL NUMBER,
PAY_NAMETAG VARCHAR2(50),
PAY_BIGO VARCHAR2(50)
);


CREATE TABLE COMMUTE(
COMM_NO NUMBER PRIMARY KEY,
COMM_YEAR VARCHAR2(20),
COMM_MONTH VARCHAR2(20),
COMM_DAY VARCHAR2(20),
COMM_TYPE_D VARCHAR2(20),
COMM_E_NO CONSTRAINT COMMENO_FK REFERENCES EMPLOYER(E_NO),
COMM_E_NAME VARCHAR2(20),
COMM_E_DNAME VARCHAR2(20),
COMM_E_POSITION VARCHAR2(20),
COMM_WORK VARCHAR2(20),
COMM_TIME NUMBER
);


CREATE TABLE CALCULATE(
CAL_CODE VARCHAR2(20) PRIMARY KEY,
CAL_DATE DATE,
CAL_B_NO CONSTRAINT CALBNO_FK REFERENCES BUS(B_NO),
CAL_HAP_C NUMBER,
CAL_HAP_M NUMBER,
CAL_TOTAL NUMBER,
CAL_NAMETAG VARCHAR2(50),
CAL_BIGO VARCHAR2(50)
);


CREATE TABLE REPAIR(
RE_CODE VARCHAR2(20) PRIMARY KEY,
RE_B_NO CONSTRAINT REBNO_FK REFERENCES BUS(B_NO),
RE_DATE DATE,
RE_DATE2 DATE,
RE_BREAKDOWN VARCHAR2(50),
RE_COST NUMBER,
RE_STATE VARCHAR2(20),
RE_BIGO VARCHAR2(50)
);


CREATE TABLE FUEL(
F_CODE VARCHAR2(20) PRIMARY KEY,
F_B_NO CONSTRAINT FBNO_FK REFERENCES BUS(B_NO),
F_B_ENERGY VARCHAR2(20),
F_DATE DATE,
F_DATE2 DATE,
F_CHARGE NUMBER,
F_COST NUMBER,
F_PAYMENT VARCHAR2(20),
F_NAMETAG VARCHAR2(50),
F_BIGO VARCHAR2(50)
);


CREATE TABLE WONLYO(
WO_CODE VARCHAR2(20) PRIMARY KEY,
WO_TYPE VARCHAR2(40),
WO_TOTAL NUMBER,
WO_COST NUMBER
);


CREATE TABLE WONLYO2(
WO2_NO NUMBER PRIMARY KEY,
WO2_IPTYPE VARCHAR2(40),
WO2_TYPE VARCHAR2(40),
WO2_NUMBER NUMBER,
WO2_DATE DATE
);


CREATE TABLE ACCIDENT(
ACC_NO NUMBER PRIMARY KEY,
ACC_B_NO CONSTRAINT ACCBNO_FK REFERENCES BUS(B_NO),
ACC_E_NO CONSTRAINT ACCENO_FK REFERENCES EMPLOYER(E_NO),
ACC_E_LICENSE VARCHAR2(20),
ACC_STATE VARCHAR2(20),
ACC_DATE DATE,
ACC_LOCATED VARCHAR2(50),
ACC_BREAKDOWN VARCHAR2(50)
);


CREATE TABLE PENALTY(
P_CODE VARCHAR2(20) PRIMARY KEY,
P_B_NO CONSTRAINT PBNO_FK REFERENCES BUS(B_NO),
P_E_NO CONSTRAINT PENO_FK REFERENCES EMPLOYER(E_NO),
P_E_LICENSE VARCHAR2(20),
P_E_NAME VARCHAR2(20),
P_COST NUMBER,
P_PAYMENT VARCHAR2(20),
P_DATE DATE,
P_LOCATED VARCHAR2(50),
P_POLICE VARCHAR2(50),
P_HISTORY VARCHAR2(50),
P_BIGO VARCHAR2(50)
);


CREATE TABLE COMPLAINT(
C_NO NUMBER PRIMARY KEY,
C_TITLE VARCHAR2(512),
C_TYPE VARCHAR2(20),
C_DATE DATE,
C_CONTENT VARCHAR2(1024),
C_B_NO CONSTRAINT CBNO_FK REFERENCES BUS(B_NO),
C_E_NO CONSTRAINT CENO_FK REFERENCES EMPLOYER(E_NO),
C_E_NAME VARCHAR2(20)
);


CREATE TABLE ACCOUNT(
AC_CODE VARCHAR2(20) PRIMARY KEY,
AC_NAME VARCHAR2(50),
AC_COST NUMBER,
AC_DATE DATE,
AC_STATE VARCHAR2(20),
AC_BIGO VARCHAR2(50)
);

--##########################################################################################

-- 시퀀스랑 함수 지우기
DROP SEQUENCE C_SEQ;
DROP FUNCTION NEXT_PEN_CODE;
DROP SEQUENCE PEN_SEQ;
DROP SEQUENCE ACC_SEQ;
DROP SEQUENCE WO2_SEQ;
DROP FUNCTION NEXT_WO_CODE; 
DROP SEQUENCE WO_SEQ;
DROP FUNCTION NEXT_F_CODE;
DROP SEQUENCE F_SEQ;
DROP FUNCTION NEXT_RE_CODE; 
DROP SEQUENCE RE_SEQ;
DROP FUNCTION NEXT_CAL_CODE; 
DROP SEQUENCE CAL_SEQ;
DROP SEQUENCE COMM_SEQ;
DROP FUNCTION NEXT_PAY_CODE;
DROP SEQUENCE PAY_SEQ;
DROP FUNCTION NEXT_E_NO;
DROP SEQUENCE E_SEQ;
DROP FUNCTION NEXT_WO2_CODE;
DROP SEQUENCE WO2_SEQ;


-- 여기서부터는 시퀀스랑 펑션
CREATE SEQUENCE E_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE PAY_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE COMM_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE CAL_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE RE_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE F_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE WO2_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;


CREATE SEQUENCE WO2_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE OR REPLACE FUNCTION NEXT_WO2_CODE RETURN VARCHAR2 AS BEGIN RETURN(LPAD(WO2_SEQ.NEXTVAL, 4, '0')); END;


CREATE SEQUENCE ACC_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE PEN_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;
CREATE SEQUENCE C_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 9999 MINVALUE 1 NOCACHE ORDER;

-- 무슨 이유인진 모르겠지만... 펑션은 한번에 하려고 하면 에러남... 한줄씩 긁어서 하면 오류 안남...
CREATE OR REPLACE FUNCTION NEXT_E_NO RETURN VARCHAR2 AS BEGIN RETURN('E' || LPAD(E_SEQ.NEXTVAL, 4, '0')); END;
CREATE OR REPLACE FUNCTION NEXT_PAY_CODE RETURN VARCHAR2 AS BEGIN RETURN('PAY' || LPAD(PAY_SEQ.NEXTVAL, 4, '0')); END;
CREATE OR REPLACE FUNCTION NEXT_CAL_CODE RETURN VARCHAR2 AS BEGIN RETURN('CAL' || LPAD(CAL_SEQ.NEXTVAL, 4, '0')); END;
CREATE OR REPLACE FUNCTION NEXT_RE_CODE RETURN VARCHAR2 AS BEGIN RETURN('RE' || LPAD(RE_SEQ.NEXTVAL, 4, '0')); END;
CREATE OR REPLACE FUNCTION NEXT_F_CODE RETURN VARCHAR2 AS BEGIN RETURN('F' || LPAD(F_SEQ.NEXTVAL, 4, '0')); END;

CREATE OR REPLACE FUNCTION NEXT_PEN_CODE RETURN VARCHAR2 AS BEGIN RETURN('PEN' || LPAD(PEN_SEQ.NEXTVAL, 4, '0')); END;




-- 시퀀스 초기화하는 건데 그냥 드랍시퀀스, 드랍펑션 해도 되긴 됨... 가끔 드랍해도 번호가 이어지는 경우가 있어서 그럴때 대비
CREATE OR REPLACE PROCEDURE COMM_SEQ_RESET(COMM_SEQ IN VARCHAR2 )
IS
    seq_val NUMBER;
BEGIN
    -- 다음시퀀스 값을 seq_val 변수에 저장
    EXECUTE IMMEDIATE 'select ' || COMM_SEQ || '.nextval from dual' INTO seq_val;

    -- 현재의 시퀀스에서 저장된 값(seq_val)을 빼준다. 그럼 0으로 초기화 됨.
    EXECUTE IMMEDIATE 'alter sequence ' || COMM_SEQ || ' increment by -' || seq_val || ' minvalue 0';

    -- 0으로 초기화 된 시퀀스 값을 확인
    EXECUTE IMMEDIATE 'select ' || COMM_SEQ || '.nextval from dual' INTO seq_val;

    -- 지금부터는 1씩 증가되도록 시퀀스를 변경함.
    EXECUTE IMMEDIATE 'alter sequence ' || COMM_SEQ || ' increment by 1 minvalue 0';
END COMM_SEQ_RESET;

-- 초기화 프로시저 실행
EXECUTE COMM_SEQ_RESET('COMM_SEQ');




