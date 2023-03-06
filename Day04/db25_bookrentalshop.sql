/* 책대여점 데이터베이스 실습 */
-- 1. divtbl
SELECT *
  FROM divtbl;
  
-- 2. bookstbl
SELECT *
  FROM bookstbl;

-- 3. membertbl
SELECT *
  FROM membertbl;
  
-- 4. rentaltbl
SELECT *
  FROM rentaltbl;
  
-- 책을 봅시다
SELECT REPLACE(A.Author, ',', '/') AS '저자명'
     , A.division AS '장르코드'
     , A.names AS '책제목'
     , DATE_FORMAT(A.ReleaseDate, '%Y년%m월%d일') AS '출판일'
     , FORMAT(A.Price, '0,000') AS '금액'
  FROM bookstbl AS A;
  
-- DateFormat예제
SELECT DATE_FORMAT('2023-03-03 17:15:10', '%Y년%m월%d일 %H시%i분%s초') AS '일시';

-- 회원을 봅시다
SELECT M.Names AS '회원명'
     , M.Levels AS '등급'
     , M.Addr AS '주소'
     , M.Mobile AS '연락처'
     , CONCAT(UPPER(SUBSTRING_INDEX(M.Email, '@', 1)), 
     '@'
     , LOWER(SUBSTRING_INDEX(M.Email, '@', -1))) AS '이메일'
  FROM membertbl AS M
 ORDER BY M.Names ASC;
  