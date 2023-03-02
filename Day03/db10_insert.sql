-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('CWJ', '조원준', 1996, '부산', '010', '99061847', 177, '2023-03-02');

-- 컬럼을 다 적을때 입력안할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HGS', '홍길순', 2000, '한양', NULL, NULL, NULL, NULL);

-- NULL 컬럼은 생략
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM', '손흥민', 1991, '서울');

-- 컬럼 지정을 생략가능(단, 입력할 값의 순서가 컬럼순서와 일치)
INSERT INTO usertbl
VALUES
('SJW', '손정웅', 1969, '서울', '010', '55556666','176', NULL);

-- AUTO_INCREMENT의 경우 필드값을 입력하지 않아도 됨
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('CWJ', '노트북', '전자', 500000, 1);

