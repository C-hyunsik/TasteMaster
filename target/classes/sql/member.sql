CREATE TABLE member (
    name VARCHAR(30) NOT NULL,
    member_id INT AUTO_INCREMENT PRIMARY KEY, -- 기본키, 무결성 제약 조건, 자동 증가
    login_id VARCHAR(100) NOT NULL UNIQUE, -- 로그인할 때 아이디
    pwd VARCHAR(100) NOT NULL,
    gender VARCHAR(3) CHECK (gender IN ('M', 'F', 'O')), -- 성별 제약 조건
    email VARCHAR(20),
    tel1 VARCHAR(10),
    tel2 VARCHAR(10),
    tel3 VARCHAR(10),
    report_count INT DEFAULT 0, -- 신고 횟수, 기본값 0
    blocked CHAR(1) DEFAULT 'N' CHECK (blocked IN ('Y', 'N')), -- 차단 여부 제약 조건
    role VARCHAR(20) DEFAULT 'USER' CHECK (role IN ('USER', 'ADMIN')),
    logtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 현재 시간으로 기본값 설정
);