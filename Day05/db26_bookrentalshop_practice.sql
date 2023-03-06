/* BookRentalShop 연습 */
SELECT *
  FROM membertbl;
  
-- 서브쿼리 : 성능이 안좋음
SELECT B.Author AS '저자'
	 -- , B.Division AS '장르'
     , (SELECT Names 
          FROM divtbl 
		 WHERE Division = B.Division) AS '장르'
     , B.Names AS '책제목'
     , B.ISBN 
     , B.Price AS '금액'	
  FROM bookstbl AS B
 ORDER BY B.Names ASC; -- 책제목, 3 => B.Names 대신 사용
 
-- 조인 :: 서브쿼리를 조인으로 변경하여 사용하는게 좋음
SELECT B.Author AS '저자'
	 , B.Division
     , D.Names	AS '장르'
     , B.Names	AS '책제목'
     , B.ISBN
     , B.Price	AS '금액'
  FROM bookstbl AS B
 INNER JOIN divtbl AS D
	ON B.Division = D.Division
 ORDER BY B.Names;
 
-- 서브쿼리 :: 장르로 그룹핑
SELECT (SELECT Names 
		  FROM divtbl 
		 WHERE Division = BB.Division) AS '장르'
	 , BB.총합
  FROM (
		SELECT B.Division
			 , SUM(B.Price) AS '총합'
		  FROM bookstbl AS B
		 GROUP BY B.Division
       ) AS BB;
  
-- 내부조인 :: 여러 테이블
SELECT M.Names	AS '이름'
	 , M.Addr	AS '주소'
     , M.Mobile	AS '연락처'
     , R.rentalDate	AS '대여일자'
     , R.returnDate	AS '반납일자'     , B.Names	AS '책제목'
     , D.Names	AS '장르'
     , B.price	AS '금액'
  FROM membertbl AS M
 INNER JOIN rentaltbl AS R
	ON M.memberIdx = R.memberIdx
 INNER JOIN bookstbl AS B
	ON R.bookIdx = B.bookIdx
 INNER JOIN divtbl AS D
	ON B.Division = D.Division;
    
-- 외부조인
SELECT M.Names	AS '이름'
	 , M.Addr	AS '주소'
     , M.Mobile	AS '연락처'
     , R.rentalIdx
     , R.rentalDate	AS '대여일자'
     , IFNULL(R.returnDate, '미반납')	AS '반납일자'
     , B.Names	AS '책제목'
     , D.Names	AS '장르'
     , B.price	AS '금액'
  FROM membertbl AS M
  LEFT OUTER JOIN rentaltbl AS R
	ON M.memberIdx = R.memberIdx
  LEFT OUTER JOIN bookstbl AS B
	ON R.bookIdx = B.bookIdx
  LEFT OUTER JOIN divtbl AS D
	ON B.Division = D.Division
 WHERE R.rentalIdx IS NULL;
 
-- 책을 두권이상 출판한 사람
SELECT BB.Author
	 , BB.Division
	 , D.Names AS '장르'
     , BB.출판권수
     , BB.합계금액
  FROM (
		SELECT B.Author
			 , B.Division
			 , COUNT(B.Author) AS '출판권수'
			 , SUM(B.Price)	   AS '합계금액'
		  FROM bookstbl AS B
		 GROUP BY B.Author, B.Division
		HAVING COUNT(B.Author) >= 2
       ) AS BB
 INNER JOIN divtbl AS D
	ON BB.Division = D.Division
 ORDER BY BB.출판권수 DESC