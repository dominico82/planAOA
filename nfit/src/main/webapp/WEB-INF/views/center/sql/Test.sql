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

INSERT INTO COMPANY_LIST VALUES(co_idx.nextval, '서초스파', '서울 서초구 반포동 50-12', '스파', '0507-1662-2557', '없음', '야간(21:00~05:00)이용 - 1,000원/회|찜질방 - 1,000원/회', '1_0507-1662-2557', 7, 0, 0, '주차|탈의실|일일락커|주차 3시간 무료');
INSERT INTO CONTENT_LIST VALUES(content_idx.nextval, 1, 1, '사우나', '', '', '', '', '' );
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '평일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '토요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '일요일', '00:00 ~ 24:00');
INSERT INTO USETIME_TABLE VALUES(usetime_idx.NEXTVAL, 1, '휴무일', '연중무휴');
COMMIT;
-----------------------------------------------
select empno, ename from emp where ename like 'ford';
SELECT co_name company FROM COMPANY_LIST WHERE CO_NAME LIKE '%스%' ;
