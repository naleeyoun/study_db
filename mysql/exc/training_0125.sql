CREATE TABLE IF NOT EXISTS `World`.`test` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`)
  );
  
  insert into test (
  name
  ) value (
  'taetae'
  );
  
  select * from test;
  
  CREATE TABLE IF NOT EXISTS `test2` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `seq2` INT NOT NULL,
  `seq3` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`, `seq2`, `seq3`)
  );
  
  insert into test2 (
	  seq2
	  , seq3
	  , name
  ) values (
	  1
	  , 1
	  , 'Yina'
  );
  
  select * from test2;
  
  insert into test (
	name
	, tel
) values (
	'Yina10'
    , '01011111110'
);

select * from test;

truncate test;

