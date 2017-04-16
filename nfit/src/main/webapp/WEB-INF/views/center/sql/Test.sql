SELECT * FROM USETIME_TABLE;

select distinct co_avail from COMPANY_LIST;

UPDATE COMPANY_LIST SET CO_AVAIL='주차|타올|운동복|일일락커' WHERE CO_IDX=4; 

SELECT * FROM COMPANY_LIST WHERE CO_IDX=4;

select * from company_list;
select * from content_list;
select * from usetime_table;

select * from CONTENT_LIST;

DELETE FROM COMPANY_LIST WHERE CO_IDX=2;

COMMIT;