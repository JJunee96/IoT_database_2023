CREATE TABLE TBL1 (
	ID INT NOT NULL PRIMARY KEY,
    bridge INT NULL,
    contents VARCHAR(5000)
);

-- sqldb DB의 usertbl 데이터 중
-- userID, name, birthYear, addr 만 가져와서
-- tabledb DB의 usertbl에 넣은것
INSERT INTO usertbl
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;
  
SELECT * FROM usertbl WHERE name = '김범수';