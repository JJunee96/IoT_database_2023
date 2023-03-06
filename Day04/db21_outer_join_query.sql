-- 쇼핑몰에 가입하고 물건을 한번도 구매하지 않은 회원까지 출력
SELECT U.*
	 , B.prodName
     , B.groupName
     , B.price
     , B.amount
  FROM usertbl AS U
  LEFT OUTER JOIN buytbl AS B
    ON U.userID = B.userID
 WHERE B.userID IS NULL;
 
-- 학생중에 동아리에 가입하지 않은 학생
SELECT S.stdName
	 , S.addr
     , J.num
     , C.clubName
     , C.roomNo
  FROM stdtbl AS S
  LEFT OUTER JOIN stdclubtbl AS J
    ON S.stdName = J.stdName
  LEFT OUTER JOIN clubtbl AS C
	ON J.clubName = C.clubName
 UNION
SELECT S.stdName
	 , S.addr
     , J.num
     , C.clubName
     , C.roomNo
  FROM stdtbl AS S
  LEFT OUTER JOIN stdclubtbl AS J
    ON S.stdName = J.stdName
 RIGHT OUTER JOIN clubtbl AS C
	ON J.clubName = C.clubName;
    
SELECT U.*
	 , B.userID
     , B.prodName
     , B.groupName
     , B.price
     , B.amount
  FROM usertbl AS U
 INNER JOIN buytbl AS B
    ON U.userID = B.userID;
    
-- IN 조건이 만족하는 것
-- NOT IN 조건이 만족하지 않는 것
SELECT name
	 , height
  FROM usertbl
 WHERE height NOT IN (SELECT height
					    FROM usertbl
					   WHERE name LIKE '김경호%');