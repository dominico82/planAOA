
DELETE FROM COMPANY_LIST WHERE CO_IDX=7;
DELETE FROM CONTENT_LIST WHERE CO_IDX=7;
DELETE FROM USETIME_TABLE WHERE CO_IDX=7;
commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX=28;
DELETE FROM CONTENT_LIST WHERE CO_IDX=28;
DELETE FROM USETIME_TABLE WHERE CO_IDX=28;
commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX=38;
DELETE FROM CONTENT_LIST WHERE CO_IDX=38;
DELETE FROM USETIME_TABLE WHERE CO_IDX=38;
commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX=50;
DELETE FROM CONTENT_LIST WHERE CO_IDX=50;
DELETE FROM USETIME_TABLE WHERE CO_IDX=50;
commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX=3;
DELETE FROM CONTENT_LIST WHERE CO_IDX=3;
DELETE FROM USETIME_TABLE WHERE CO_IDX=3;
commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX=17;
DELETE FROM CONTENT_LIST WHERE CO_IDX=17;
DELETE FROM USETIME_TABLE WHERE CO_IDX=17;
commit;

---------------------------------------------------------------------------------1
SELECT * FROM USETIME_TABLE;

select distinct co_avail from COMPANY_LIST;

UPDATE COMPANY_LIST SET CO_AVAIL='주차|타올|운동복|일일락커' WHERE CO_IDX=4; 

SELECT * FROM COMPANY_LIST WHERE CO_IDX=4;

select * from content_list;

select * from company_list order by co_idx asc;
select * from content_list order by content_idx asc;
select * from usetime_table ORDER BY USETIME_IDX ASC;
commit;
select * from CONTENT_LIST;
-----------------------------------------------
INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '서초스파', '서울 서초구 반포동 50-12', '스파', '0507-1662-2557', '없음', '야간(21:00~05:00)이용 - 1,000원/회|찜질방 - 1,000원/회', '1_0507-1662-2557', 7, 0, 0, '주차|탈의실|일일락커|주차 3시간 무료');
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 1, 1, '사우나', '', '', '', '', '' );
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '평일', '00:00 ~ 24:00');

DELETE FROM COMPANY_LIST WHERE CO_IDX=2;
DELETE FROM CONTENT_LIST WHERE CONTENT_IDX=2;
DELETE FROM USETIME_TABLE WHERE USETIME_IDX=2;

DROP SEQUENCE CO_IDX;
DROP SEQUENCE content_idx;
DROP SEQUENCE usetime_idx;
DROP SEQUENCE feedback_idx;

CREATE SEQUENCE co_idx minvalue 0 start with 1;
CREATE SEQUENCE content_idx minvalue 0 start with 1;
CREATE SEQUENCE usetime_idx minvalue 0 start with 1;
CREATE SEQUENCE feedback_idx minvalue 0 start with 1;

COMMIT;


-----------------------------------------------------------------------------------
SELECT P.PROFESSOR_ID, NAME, POSITION, TITLE, C_NUMBER FROM PROFESSOR P INNER JOIN COURSE C ON (P.PROFESSOR_ID = C.PROFESSOR_ID) ORDER BY P.PROFESSOR_ID;
SELECT DISTINCT * FROM COMPANY_LIST CO INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) WHERE 
CO.CO_NAME LIKE '%스파%' OR
CO.CO_CLASS LIKE '%스파%' OR
CO.CO_ADDRESS LIKE '%스파%' OR
CT.CONTENT1 LIKE '%스파%' OR
CT.CONTENT2 LIKE '%스파%' OR
CT.CONTENT3 LIKE '%스파%' OR
CT.CONTENT4 LIKE '%스파%' OR
CT.CONTENT5 LIKE '%스파%' OR
CT.CONTENT6 LIKE '%스파%'
ORDER BY CO.CO_IDX;

SELECT DISTINCT * FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) 
WHERE 
CO.CO_NAME LIKE '%강남%' OR
CO.CO_CLASS LIKE '%강남%' OR
CO.CO_ADDRESS LIKE '%강남%' OR
CT.CONTENT1 LIKE '%강남%' OR
CT.CONTENT2 LIKE '%강남%' OR
CT.CONTENT3 LIKE '%강남%' OR
CT.CONTENT4 LIKE '%강남%' OR
CT.CONTENT5 LIKE '%강남%' OR
CT.CONTENT6 LIKE '%강남%'
ORDER BY CO.CO_IDX;

SELECT DISTINCT CO.CO_IDX 
FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) 
WHERE 
CO.CO_NAME LIKE '%스파%' OR
CO.CO_CLASS LIKE '%스파%' OR
CO.CO_ADDRESS LIKE '%스파%' OR
CT.CONTENT1 LIKE '%스파%' OR
CT.CONTENT2 LIKE '%스파%' OR
CT.CONTENT3 LIKE '%스파%' OR
CT.CONTENT4 LIKE '%스파%' OR
CT.CONTENT5 LIKE '%스파%' OR
CT.CONTENT6 LIKE '%스파%'
ORDER BY CO.CO_IDX;

SELECT DISTINCT * FROM COMPANY_LIST CO INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) WHERE 
CO.CO_NAME LIKE '%스파%' OR
CO.CO_CLASS LIKE '%스파%' OR
CO.CO_ADDRESS LIKE '%스파%' OR
CT.CONTENT1 LIKE '%스파%' OR
CT.CONTENT2 LIKE '%스파%' OR
CT.CONTENT3 LIKE '%스파%' OR
CT.CONTENT4 LIKE '%스파%' OR
CT.CONTENT5 LIKE '%스파%' OR
CT.CONTENT6 LIKE '%스파%' OR
CO.CO_NAME LIKE '%강남%' OR
CO.CO_CLASS LIKE '%강남%' OR
CO.CO_ADDRESS LIKE '%강남%' OR
CT.CONTENT1 LIKE '%강남%' OR
CT.CONTENT2 LIKE '%강남%' OR
CT.CONTENT3 LIKE '%강남%' OR
CT.CONTENT4 LIKE '%강남%' OR
CT.CONTENT5 LIKE '%강남%' OR
CT.CONTENT6 LIKE '%강남%'
ORDER BY CO.CO_IDX;

SELECT DISTINCT * FROM COMPANY_LIST
WHERE 
CO_NAME LIKE '%강남%' OR
CO_CLASS LIKE '%강남%' OR
CO_ADDRESS LIKE '%강남%' OR
CO_NAME LIKE '%서초%' OR
CO_CLASS LIKE '%서초%' OR
CO_ADDRESS LIKE '%서초%'
ORDER BY CO_IDX;

SELECT DISTINCT * FROM COMPANY_LIST
WHERE 
CO_NAME LIKE UPPER('%강남%') OR
CO_CLASS LIKE UPPER('%강남%') OR
CO_ADDRESS LIKE UPPER('%강남%') OR
CO_NAME LIKE UPPER('%서초%') OR
CO_CLASS LIKE UPPER('%서초%') OR
CO_ADDRESS LIKE UPPER('%서초%') OR
CO_NAME LIKE LOWER('%강남%') OR
CO_CLASS LIKE LOWER('%강남%') OR
CO_ADDRESS LIKE LOWER('%강남%') OR
CO_NAME LIKE LOWER('%서초%') OR
CO_CLASS LIKE LOWER('%서초%') OR
CO_ADDRESS LIKE LOWER('%서초%')
ORDER BY CO_IDX;

SELECT DISTINCT * FROM COMPANY_LIST
WHERE 
CO_NAME LIKE UPPER('%강남%') OR
CO_CLASS LIKE UPPER('%강남%') OR
CO_ADDRESS LIKE UPPER('%강남%') OR
CO_NAME LIKE LOWER('%강남%') OR
CO_CLASS LIKE LOWER('%강남%') OR
CO_ADDRESS LIKE LOWER('%강남%')
ORDER BY CO_IDX;

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL 
FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX)
WHERE CO.CO_NAME LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_CLASS LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_ADDRESS LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT1 LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT2 LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT3 LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT4 LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT5 LIKE '%'||upper(#{keyword})||'%'
OR CT.CONTENT6 LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_NAME LIKE '%'||lower(#{keyword})||'%'
OR CO.CO_CLASS LIKE '%'||lower(#{keyword})||'%'
OR CO.CO_ADDRESS LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT1 LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT2 LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT3 LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT4 LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT5 LIKE '%'||lower(#{keyword})||'%'
OR CT.CONTENT6 LIKE '%'||lower(#{keyword})||'%'
ORDER BY CO.CO_IDX

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL 
FROM COMPANY_LIST CO 
WHERE CO.CO_NAME LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_CLASS LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_ADDRESS LIKE '%'||upper(#{keyword})||'%'
OR CO.CO_NAME LIKE '%'||lower(#{keyword})||'%'
OR CO.CO_CLASS LIKE '%'||lower(#{keyword})||'%'
OR CO.CO_ADDRESS LIKE '%'||lower(#{keyword})||'%'
ORDER BY CO.CO_IDX

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL 
FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) WHERE 
CO.CO_NAME LIKE %#{keyword}% OR 
CO.CO_CLASS LIKE %#{keyword}% OR 
CO.CO_ADDRESS LIKE %#{keyword}% OR 
CT.CONTENT1 LIKE %#{keyword}% OR 
CT.CONTENT2 LIKE %#{keyword}% OR 
CT.CONTENT3 LIKE %#{keyword}% OR 
CT.CONTENT4 LIKE %#{keyword}% OR 
CT.CONTENT5 LIKE %#{keyword}% OR 
CT.CONTENT6 LIKE %#{keyword}% 
ORDER BY CO.CO_IDX;

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL 
FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX)
WHERE CO.CO_NAME LIKE '%'+#{keyword}+'%'
OR CO.CO_CLASS LIKE '%'+#{keyword}+'%'
OR CO.CO_ADDRESS LIKE '%'+#{keyword}+'%'
OR CT.CONTENT1 LIKE '%'+#{keyword}+'%'
OR CT.CONTENT2 LIKE '%'+#{keyword}+'%'
OR CT.CONTENT3 LIKE '%'+#{keyword}+'%'
OR CT.CONTENT4 LIKE '%'+#{keyword}+'%'
OR CT.CONTENT5 LIKE '%'+#{keyword}+'%'
OR CT.CONTENT6 LIKE '%'+#{keyword}+'%'
ORDER BY CO.CO_IDX;

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL 
FROM COMPANY_LIST CO 
INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX)
WHERE CO.CO_NAME LIKE '%?%'
ORDER BY CO.CO_IDX;
------------------------------------------------------------------------------------------S
SELECT * FROM COMPANY_LIST;
COMMIT;
select empno, ename from emp where ename like 'ford';
SELECT co_name company FROM COMPANY_LIST WHERE CO_NAME LIKE '%스%' ;
INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '서초스파', '서울 서초구 반포동 50-12', '스파', '0507-1662-2557', '없음', '야간(21:00~05:00)이용 - 1,000원/회|찜질방 - 1,000원/회', '1_0507-1662-2557', 7, 0, 0, '주차|탈의실|일일락커|주차 3시간 무료');
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 1, 1, '사우나', '', '', '', '', '' );
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '평일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '토요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '일요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '휴무일', '연중무휴');
COMMIT;



--------------------------------------------------------------


DELETE FROM COMPANY_LIST WHERE CO_IDX=61;
DELETE FROM CONTENT_LIST WHERE CONTENT_IDX=2;
DELETE FROM USETIME_TABLE WHERE USETIME_IDX=2;

select * from company_list order by co_idx asc;
select * from content_list order by content_idx asc;
select * from usetime_table ORDER BY USETIME_IDX ASC;


DROP SEQUENCE CO_IDX;
DROP SEQUENCE content_idx;
DROP SEQUENCE usetime_idx;
DROP SEQUENCE feedback_idx;

CREATE SEQUENCE co_idx minvalue 0 start with 1;
CREATE SEQUENCE content_idx minvalue 0 start with 1;
CREATE SEQUENCE usetime_idx minvalue 0 start with 1;
CREATE SEQUENCE feedback_idx minvalue 0 start with 1;

COMMIT;

select * from content_list where co_idx = 13;

insert into content_list values

(select max(co_idx) from company_list order by co_idx asc;)
-----------------------------------------------------------------------------------------------------------------
INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '123', '경기 부천시 길주로 660', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '51_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 

INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 52, '평일', '11:00 ~ 21:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 52, '토요일', '11:00 ~ 20:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 52, '일요일', '');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 52, '휴무일', '일요일 및 명절 당일');

INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 52, 13, '응', '눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 52, 13, '응응', '내츄럴 속눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 52, 13, '응응응', '브라질리언왁싱', '', '', '', '' );

commit;

INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '으으으응', '경기 김포시 김포한강11로 276', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '51_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 

INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 53, '평일', '11:00 ~ 21:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 53, '토요일', '11:00 ~ 20:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 53, '일요일', '');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 53, '휴무일', '일요일 및 명절 당일');

INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 53, 13, '응', '눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 53, 13, '응응', '내츄럴 속눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 53, 13, '응응응', '브라질리언왁싱', '', '', '', '' );

commit;

DELETE FROM COMPANY_LIST WHERE CO_IDX = 61;
DELETE FROM COMPANY_LIST WHERE CO_IDX = 62;
DELETE FROM COMPANY_LIST WHERE CO_IDX = 63;

DELETE FROM COMPANY_LIST WHERE CO_IDX = 62;
DELETE FROM COMPANY_LIST WHERE CO_IDX = 63;

DELETE FROM USETIME_TABLE WHERE CO_IDX = 62;
DELETE FROM USETIME_TABLE WHERE CO_IDX = 63;
COMMIT;

select * from company_list ORDER BY CO_IDX ASC;
select * from content_list ORDER BY CO_IDX ASC;
select * from usetime_table ORDER BY CO_IDX ASC;

INSERT INTO COMPANY_LIST VALUES(62, '123', '경기 부천시 길주로 660', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '52_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 

INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 62, '평일', '11:00 ~ 21:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 62, '토요일', '11:00 ~ 20:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 62, '일요일', '');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 62, '휴무일', '일요일 및 명절 당일');

INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 62, 13, '샘플', '눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 62, 13, '샘플샘플', '내츄럴 속눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 62, 13, '샘플샘플샘플', '브라질리언왁싱', '', '', '', '' );

commit;

INSERT INTO COMPANY_LIST VALUES(63, '으으으응', '경기 김포시 김포한강11로 276', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '53_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 

INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 63, '평일', '11:00 ~ 21:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 63, '토요일', '11:00 ~ 20:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 63, '일요일', '');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 63, '휴무일', '일요일 및 명절 당일');

INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 63, 13, '샘플1', '눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 63, 13, '샘플샘플', '내츄럴 속눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 63, 13, '샘플샘플샘플', '브라질리언왁싱', '', '', '', '' );

commit;

SELECT MAX(CO_IDX) FROM COMPANY_LIST;

INSERT INTO COMPANY_LIST VALUES
(63, '으으으응', '경기 김포시 김포한강11로 276', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '53_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 