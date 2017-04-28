SELECT * FROM USETIME_TABLE;

select distinct co_avail from COMPANY_LIST;

UPDATE COMPANY_LIST SET CO_AVAIL='주차|타올|운동복|일일락커' WHERE CO_IDX=4; 

SELECT * FROM COMPANY_LIST WHERE CO_IDX=4;

select * from content_list;

select * from company_list order by co_idx asc;
select * from content_list order by content_idx asc;
select * from usetime_table ORDER BY USETIME_IDX ASC;

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
SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS FROM COMPANY_LIST CO INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) WHERE 
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

------------------------------------------------------------------------------------------
select empno, ename from emp where ename like 'ford';
SELECT co_name company FROM COMPANY_LIST WHERE CO_NAME LIKE '%스%' ;
INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '서초스파', '서울 서초구 반포동 50-12', '스파', '0507-1662-2557', '없음', '야간(21:00~05:00)이용 - 1,000원/회|찜질방 - 1,000원/회', '1_0507-1662-2557', 7, 0, 0, '주차|탈의실|일일락커|주차 3시간 무료');
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 1, 1, '사우나', '', '', '', '', '' );
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '평일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '토요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '일요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '휴무일', '연중무휴');
COMMIT;

SELECT DISTINCT CO.CO_IDX, CO.CO_NAME, CO.CO_ADDRESS, CO.CO_CLASS, CO.CO_PHONE, CO.CO_REGUL, CO.CO_EXTRA, CO.CO_VIEW, CO.CO_USECOUNT, CO.CO_LAT, CO.CO_LNG, CO.CO_AVAIL FROM COMPANY_LIST CO INNER JOIN CONTENT_LIST CT ON (CO.CO_IDX=CT.CO_IDX) WHERE CO.CO_NAME LIKE %#{keyword}% OR CO.CO_CLASS LIKE %#{keyword}% OR CO.CO_ADDRESS LIKE %#{keyword}% OR CT.CONTENT1 LIKE %#{keyword}% OR CT.CONTENT2 LIKE %#{keyword}% OR CT.CONTENT3 LIKE %#{keyword}% OR CT.CONTENT4 LIKE %#{keyword}% OR CT.CONTENT5 LIKE %#{keyword}% OR CT.CONTENT6 LIKE %#{keyword}% ORDER BY CO.CO_IDX;

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

--------------------------------------------------------------

INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, 'TEST정보', '서울 강남구 테헤란로14길 6 남도빌딩', '뷰티', '1544-9970', '기본케어 - 케어+칼라|젤네일 - 케어+젤칼라|속눈썹 - 아이존, full|※원컬러 손기준', '남성 기본케어 이용시 5,000원 추가 지불|다른 시술 이용시 추가비용 발생', '51_1544-9970', 12, 0, 0, '주차|샤워실|타올|일일락커|목욕용품'); 

INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 51, '평일', '11:00 ~ 21:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 51, '토요일', '11:00 ~ 20:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 51, '일요일', '');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 51, '휴무일', '일요일 및 명절 당일');

INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 51, 13, '4', '눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 51, 13, '4.5', '내츄럴 속눈썹', '', '', '', '' );
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 51, 13, '14', '브라질리언왁싱', '', '', '', '' );


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