use world;


CREATE TABLE IF NOT EXISTS `book3` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `publisher_cd` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `publisher` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

select * from book3;

select * from publisher;

insert into book3 (
	name
	)values (
	'안드로이드'
);

update publisher
set
	name = ''
where
	no = 4; 


insert into book3 (
	name
    , publisher_cd
) values (
	'4차산업혁명의미래'
    , 4
);

select
	a.no
	, a.name
	, a.publisher_cd
    , b.no
	, b.name
from book3 as a 
left join publisher as b on b.no = a.publisher_cd;

select
	a.no
	, a.name
	, a.publisher_cd
	, (select name from publisher where no = a.publisher_cd) as publisher_name
from book3 as a;

select
	a.no
	, a.name
	, a.publisher_cd
	, getPublisherName -- 함수, function
from book3 as a;

select
	a.no
	, a.name
	, a.publisher_cd
	, getPublisherName -- 함수, function
from book3 as a;

delete from publisher
where
	no = 4;