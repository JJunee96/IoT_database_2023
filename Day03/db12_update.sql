-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고! UPDATE 구문에는 WHERE절 뺴면 안됨!!!
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '77778888'
     , addr = '부산'
 WHERE userID = 'CWJ';


COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면
DELETE FROM usertbl
 WHERE userID = 'HGS';