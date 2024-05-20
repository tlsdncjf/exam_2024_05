DROP DATABASE IF EXISTS `24_05_tests`;
CREATE DATABASE `24_05_tests`;
USE `24_05_tests`;

# themePlace 테이블 생성
CREATE TABLE themePlace(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` TEXT COMMENT '명칭',
    region TEXT COMMENT '지역',
    roadLocation TEXT COMMENT '소재지도로',
    latitude DOUBLE COMMENT '위도',
    longitude DOUBLE COMMENT '경도',
    phoneNumber TEXT COMMENT '전화번호',
    `body` TEXT COMMENT '내용',    
    price TEXT COMMENT '비용',
    imgAdr TEXT COMMENT '이미지주소',
    `type` TEXT COMMENT '타입'
);

# FAQ 테이블 생성
CREATE TABLE FAQ (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    answer TEXT NOT NULL
);

INSERT INTO FAQ (question, answer) VALUES
('오늘 대전 날씨 어때?', '오늘의 날씨는 맑습니다.'),
('대전 추천 관광명소 추천해줘', '대전 시립미술관을 추천합니다.'),
('대전 맛집 추천해줘', '한밭수목원 내에 있는 "오씨칼국수"를 추천합니다.');

###############################################

SELECT * FROM themePlace;
SELECT * FROM FAQ


