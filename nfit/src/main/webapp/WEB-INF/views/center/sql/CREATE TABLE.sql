/*업체테이블*/
CREATE TABLE COMPANY_LIST(co_idx NUMBER NOT NULL PRIMARY KEY, co_name VARCHAR2(100) NOT NULL, co_address VARCHAR2(200) NOT NULL, co_class VARCHAR2(50) NOT NULL, co_phone VARCHAR2(30) NULL, co_regul VARCHAR2(500) NULL, co_extra VARCHAR2(500) NULL, co_view VARCHAR2(30) NULL, co_usecount NUMBER NULL, co_lat NUMBER NULL, co_lng NUMBER NULL, co_avail VARCHAR(100) NULL);
CREATE SEQUENCE co_idx minvalue 0 start with 1;

/*이용시간테이블*/
CREATE TABLE USETIME_TABLE(usetime_idx NUMBER NOT NULL PRIMARY KEY, co_idx NUMBER NOT NULL, usetime_day VARCHAR2(20) NULL, usetime_time VARCHAR2(100) NULL);
CREATE SEQUENCE usetime_idx minvalue 0 start with 1;

/*이용상품테이블*/
CREATE TABLE CONTENT_LIST(content_idx NUMBER NOT NULL PRIMARY KEY, co_idx NUMBER NOT NULL, content_coin NUMBER NOT NULL, content1 VARCHAR2(50) NULL, content2 VARCHAR2(50) NULL, content3 VARCHAR2(50) NULL, content4 VARCHAR2(50) NULL, content5 VARCHAR2(50) NULL, content6 VARCHAR2(50) NULL);
CREATE SEQUENCE content_idx minvalue 0 start with 1;

/*후기테이블*/
CREATE TABLE FEEDBACK_TABLE(feedback_index NUMBER NOT NULL PRIMARY KEY, co_idx NUMBER , member_id VARCHAR2(50) , feedback_date DATE , feedback_score NUMBER , feedback_content VARCHAR2(500) );	
CREATE SEQUENCE feedback_idx minvalue 0 start with 1;

commit;