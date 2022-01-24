CREATE TABLE IF NOT EXISTS `world`.`bookDoIt` (
  `seq` INT NOT NULL,
  `image` VARCHAR(100) NULL DEFAULT '책 이미지 경로',
  `summary` VARCHAR(100) NULL DEFAULT '이지스퍼블리싱-Do it! 시리즈',
  `category` VARCHAR(100) NULL DEFAULT '도서',
  `title` VARCHAR(100) NULL DEFAULT 'Do it! HTML+CSS+자바스크립트 웹 표준의 정석',
  `subTitle` VARCHAR(100) NULL DEFAULT '한 권으로 끝내는 웹 기본 교과서',
  `author` VARCHAR(100) NULL DEFAULT '고경희',
  `publisher` VARCHAR(100) NULL DEFAULT '이지스퍼블리싱',
  `date` DATETIME,
  `price` INT NULL DEFAULT 27000,
  `discount` INT NULL DEFAULT 10,
  `point` INT NULL DEFAULT '1500',
  `salesIndex` INT NULL DEFAULT 49899,
  `review` INT NULL DEFAULT 15,
  `score` VARCHAR(100) NULL DEFAULT 9.6,
  `arrivalDate` DATETIME NULL,
  `event` VARCHAR(100) NULL DEFAULT '[대학생x취준생] 지치지 않는 자, 점수를 잡는다! - 리유저블텀블러/한국문학 담요/슬라이드 파일 증정',
  `usedGoods` INT NULL DEFAULT 11,
  `ebook` INT NULL DEFAULT '19000',
  PRIMARY KEY (`seq`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '도서';

select * from bookDoIt;

INSERT INTO bookDoIt (
	`seq`
	, `image`
	, `summary`
	, `category`
	, `title`
	, `subTitle`
	, `author`
	, `publisher`
	, `price`
	, `discount`
	, `point`
	, `salesIndex`
	, `review`
	, `score`
	, `event`
	, `usedGoods`
	, `ebook`
) VALUES (
	1
    , '/source/web/image/image.jpg'
    , '이지스퍼블리싱-Do it! 시리즈'
    , '도서'
    , 'Do it! HTML+CSS+자바스크립트 웹 표준의 정석'
    , '한 권으로 끝내는 웹 기본 교과서'
    , '고경희'
    , '이지스퍼블리싱'
    , 27000
    , 10
    , 1500
    , 49899
    , 15
    , 9.6
    , '[대학생x취준생] 지치지 않는 자, 점수를 잡는다! - 리유저블텀블러/한국문학 담요/슬라이드 파일 증정'
    , 11
    , 1900
);

INSERT INTO bookDoIt (
	`date`
	, 'arrDate'
) VALUES (
	'2021-01-01 00:00:00'
    , '2022-01-25 00:00:00'
);
