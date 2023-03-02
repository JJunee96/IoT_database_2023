-- 집계함수 사용하기 위해서 / 그룹핑
-- GROUP BY에 작성된 컬럼명만 SELECT에 쓸 수 있음
SELECT userID as ID
	 , avg(amount) as CntAvg
  FROM buytbl
 GROUP BY userID;

-- HAVING은 집계함수등의 결과값을 필터링하기 위해서
SELECT userID
	 , sum(price * amount) as tot
  FROM buytbl
 GROUP BY userID
HAVING  tot > 100;

-- ROLLUP 전체합계
SELECT userID
	 , sum(price * amount) as tot
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;
  
