SELECT * FROM USETIME_TABLE;

select distinct co_avail from COMPANY_LIST;

UPDATE COMPANY_LIST SET CO_AVAIL='주차|타올|운동복|일일락커' WHERE CO_IDX=4; 

SELECT * FROM COMPANY_LIST WHERE CO_IDX=4;

select * from company_list order by co_idx asc;
select * from content_list order by content_idx asc;
select * from usetime_table ORDER BY USETIME_IDX ASC;

select * from CONTENT_LIST;

DELETE FROM COMPANY_LIST WHERE CO_IDX=2;
DELETE FROM CONTENT_LIST WHERE CONTENT_IDX=2;
DELETE FROM USETIME_TABLE WHERE USETIME_IDX=2;

COMMIT;