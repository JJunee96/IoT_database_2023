-- 뷰
USE sqldb;

CREATE VIEW uv_potentialUser
AS
	SELECT U.*
		 , B.num, B.prodName, B.price, B.amount
      FROM usertbl AS U
      LEFT OUTER JOIN buytbl AS B
        ON U.userID = B.userID
	 WHERE B.userID IS NULL;
     
SELECT * FROM uv_potentialUser;