CREATE TABLE IF NOT EXISTS `world`.`room` (
  `seq` INT NOT NULL,
  `image` VARCHAR(100),
  `explan` VARCHAR(100),
  `type` VARCHAR(45),
  `time` VARCHAR(45),
  `capacity` VARCHAR(45),
  `chari` INT,
  `mirror` INT,
  `restroom` INT,
  `smoking` INT,
  `lounge` INT,
  `shower` INT,
  `internet` INT,
  PRIMARY KEY (`seq`));
  
  select * from room;
  
  insert into room (
	seq
    , image
    , explan
    , type
    , time
    , capacity
    , chair
    , mirror
    , restroom
    , smoking
    , lounge
    , shower
    , internet
  ) values (
  1
  , '/source/web/image/image.jpg'
  , '레슨, 성악, 보컬, 피아노, 악기 연습 등 원하는 음악을 마음껏 할 수 있는 지상 연습실 (단, 금관악기는 제외)'
  , '보컬연습실 악기연습실'
  , '최소 1시간 부터'
  , '최소 1명 ~ 최대 4명'
  , 1
  , 1
  , 1
  , 1
  , 1
  , 1
  , 1  
  );
  