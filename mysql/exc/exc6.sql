CREATE TABLE IF NOT EXISTS `world`.`codeGroup` (
  `seq` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;

select * from code;
select * from codegroup;


CREATE TABLE IF NOT EXISTS `world`.`code` (
  `code` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  `codeGroup_seq` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codeGroup_seq`),
  CONSTRAINT `fk_code_codeGroup1`
    FOREIGN KEY (`codeGroup_seq`)
    REFERENCES `world`.`codeGroup` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into codeGroup (
	seq
	, name
) values (
	'infra002'
	, '통신사'
);

insert into code (
	code
	, name
	, codeGroup_seq
) values (
	'3'
	, 'LGU'
	, 'infra002'
);

desc code;

select * from code ;
select * from codegroup;

desc codegroup;

select
    b.seq
    , b.name
    , a.code
    , a.name
from code a
left join codeGroup b on a.codeGroup_seq=b.seq;
	