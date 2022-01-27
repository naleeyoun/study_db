use world;

CREATE TABLE IF NOT EXISTS `book4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `publisher4_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_book4_publisher4_idx` (`publisher4_no` ASC) VISIBLE,
  CONSTRAINT `fk_book4_publisher4`
    FOREIGN KEY (`publisher4_no`)
    REFERENCES `mydb`.`publisher4` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `publisher4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

 drop table publisher4;
 
 CREATE TABLE IF NOT EXISTS `book4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `review4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `book4_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_review_book4_idx` (`book4_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_book4`
    FOREIGN KEY (`book4_no`)
    REFERENCES `book4` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into book4 (
	name
) values (
	'4차산업혁명의미래'
);

select * from book4;

desc review4;
desc book4;

select * from review4;
select * from book4;

alter table review4 change name comment varchar(45);

insert into review4 (
	comment
    , book4_no
) values (
	'우와 책 재미있습니다.'
    , 5
);

truncate review4;

CREATE TABLE IF NOT EXISTS `world`.`book5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`review5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `book5_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `book5_no`),
  INDEX `fk_review5_book51_idx` (`book5_no` ASC) VISIBLE,
  CONSTRAINT `fk_review5_book51`
    FOREIGN KEY (`book5_no`)
    REFERENCES `world`.`book5` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from book5;
select * from review5;

insert into review5 (
	comment
    , book5_no
)values(
	'와우 재미있어요'
    , 1
);

update review5
set book5_no = 4
where no = 7;

select
	a.name
	, (select count(*) from review5 where book5_no = a.no) as count
from book5 a
;

select
	a.name
	, b.comment
from book5 a
inner join review5 b on b.book5_no = a.no
;

select
	a.no
	,a.comment
	, b.name  
from review5 as a
left join book5 as b on b.no = a.book5_no;
