-- INNER JOIN
SELECT A.num
	 , A.userID
     , A.prodName
     , B.name
     , B.addr
     , B.birthYear
  FROM buytbl AS A
  JOIN usertbl AS B ON A.userID = B.userID
 ORDER BY A.num DESC;
 -- WHERE B.userID = 'JYP';