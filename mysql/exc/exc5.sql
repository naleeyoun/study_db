CREATE TABLE IF NOT EXISTS `world`.`book6` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`book6_writer` (
  `no` INT UNSIGNED NOT NULL,
  `book6_no` INT UNSIGNED NOT NULL,
  `writer_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_book6_writer_book61_idx` (`book6_no` ASC) VISIBLE,
  INDEX `fk_book6_writer_writer1_idx` (`writer_no` ASC) VISIBLE,
  CONSTRAINT `fk_book6_writer_book61`
    FOREIGN KEY (`book6_no`)
    REFERENCES `world`.`book6` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book6_writer_writer1`
    FOREIGN KEY (`writer_no`)
    REFERENCES `world`.`writer` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`writer` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


select * from book6;

select * from book6_writer;

select * from writer;

insert into book6 (
	name
) values (
	'html'
);

insert into writer (
	name
) values (
	'dbstksk'
);

insert into book6_writer (
	book6_no
    , writer_no
) values (
	3
    , 3    
);

select
	a.no
    , a.name
    , (select name from writer c where c.no = b.writer_no) as writer_name
from book6 a
left join book6_writer b on b.book6_no = a.no
;

-- book6 a, book6_no b, writer c
select
	a.no
    , a.name
    , b.writer_no
    , c.name
from book6 a
left join book6_writer b on b.book6_no = a.no
left join writer c on b.writer_no = c.no
;
