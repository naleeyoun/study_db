CREATE TABLE IF NOT EXISTS `infrMember` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL DEFAULT 'yina',
  `name` VARCHAR(45) NULL DEFAULT '윤이나',
  `password` VARCHAR(100) NULL DEFAULT '비밀번호입니다',
  `recommender` VARCHAR(45) NULL DEFAULT 'cncjsdls123',
  `genderCd` INT NULL DEFAULT '2',
  `birthday` DATE NULL DEFAULT '19910111',
  `NationalityCd` INT NULL DEFAULT '1',
  `photo` VARCHAR(100) NULL DEFAULT '/yina/photo/photo1.png',
  `homepage` VARCHAR(100) NULL DEFAULT 'www.naver.com',
  `jobCd` INT NULL DEFAULT '1',
  `marriageCd` INT NULL DEFAULT '1',
  `weddingAniversary` DATE NULL DEFAULT '20220101',
  `childrenCd` INT NULL DEFAULT '1',
  `color` VARCHAR(45) NULL DEFAULT 'orange',
  `privacyCd` INT NULL DEFAULT '2',
  `privacyDate` DATETIME NULL DEFAULT '20220128152900',
  `mobileMarketingCd` INT NULL DEFAULT '1',
  `mobileMarketingDate` DATETIME NULL DEFAULT '20220128152900',
  `emailMarketingCd` INT NULL DEFAULT '2',
  `emailMarketingDate` DATETIME NULL DEFAULT '20220128152900',
  `regIp` VARCHAR(45) NULL DEFAULT '자기소개',
  `regSeq` INT NULL,
  `regDevice` VARCHAR(45) NULL,
  `regClientDatetime` DATETIME NULL,
  `regSvrDatetime` DATETIME NULL,
  PRIMARY KEY (`seq`, `id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '회원정보';

select * from infrMember;
desc infrMember;

insert into infrMember (
  id
  ,name
  ,password
  ,recommender
  ,genderCd
  ,birthday
  ,NationalityCd
  ,photo
  ,homepage
  ,jobCd
  ,marriageCd
  ,weddingAniversary
  ,childrenCd
  ,color
  ,privacyCd
  ,privacyDate
  ,mobileMarketingCd
  ,mobileMarketingDate
  ,emailMarketingCd
  ,emailMarketingDate
) values (
   'samna',
  '윤삼나',
  '비밀번호입니다',
  'yina',
 2,
 '1111-01-11',
  '1',
  '/yina/photo/photo2.png',
  'www.daum.com',
  '2',
  '2',
  '',
  '1',
  'yellow',
  '2',
  '20220128152900',
  '1',
  '20220128152900',
  '2',
  '20220128152900'
);

CREATE TABLE IF NOT EXISTS `address` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `defaultNy` INT NULL,
  `addressCd` INT NULL,
  `zipcode` INT NULL,
  `address` VARCHAR(100) NULL,
  `address2` VARCHAR(100) NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_address_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '주소';

select * from address;

CREATE TABLE IF NOT EXISTS `project` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `role` VARCHAR(45) NULL,
  `company` VARCHAR(45) NULL ,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_project_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_project_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '프로젝트 정보';

select * from project;

CREATE TABLE IF NOT EXISTS `email` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `emailCd` INT NOT NULL ,
  `emailAccount` VARCHAR(45) NOT NULL ,
  `emailDomainCd` INT NOT NULL ,
  `fullemail` VARCHAR(100) NOT NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_email_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_email_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '이메일주소';

select * from email;

CREATE TABLE IF NOT EXISTS `phone` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `defaultNy` INT NOT NULL,
  `codeCd` INT NOT NULL,
  `first` INT NOT NULL ,
  `company` INT NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_phone_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '모바일, 전화번호, 팩스번호';

select * from phone;

CREATE TABLE IF NOT EXISTS `hobby` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `hobbyCd` INT NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_hobby_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_hobby_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '취미';

select * from hobby;

CREATE TABLE IF NOT EXISTS `password` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `pwQuestionCd` INT NOT NULL ,
  `pwAnswer` VARCHAR(100) NOT NULL ,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_password_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_password_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '비밀번호, 비밀번호 질문, 답';

select * from password;

CREATE TABLE IF NOT EXISTS `sleep` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `sleepCd` INT NOT NULL ,
  `sleepDate` DATE NULL,
  `awakeDate` DATE NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_sleep_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_sleep_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '회원휴면정보';

select * from sleep;

CREATE TABLE IF NOT EXISTS `sns` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `defaultNy` INT NULL,
  `snstypeCd` INT NULL,
  `url` VARCHAR(100) NULL,
  `infrMember_defaultNy` INT UNSIGNED NOT NULL,
  `infrMember_seq` INT UNSIGNED NOT NULL,
  `infrMember_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_sns_infrMember1_idx` (`infrMember_seq` ASC, `infrMember_id` ASC) VISIBLE,
  CONSTRAINT `fk_sns_infrMember1`
    FOREIGN KEY (`infrMember_seq` , `infrMember_id`)
    REFERENCES `infrMember` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'sns, 홈페이지';

select * from sns;

CREATE TABLE IF NOT EXISTS `infrcodeGroup` (
  `seq` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '코드그룹';

CREATE TABLE IF NOT EXISTS `infrcode` (
  `code` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `infrcodeGroup_seq` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code`, `infrcodeGroup_seq`),
  INDEX `fk_infrcode_infrcodeGroup1_idx` (`infrcodeGroup_seq` ASC) VISIBLE,
  CONSTRAINT `fk_infrcode_infrcodeGroup1`
    FOREIGN KEY (`infrcodeGroup_seq`)
    REFERENCES `infrcodeGroup` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from infrcode;
select * from infrcodegroup;

insert into infrcodegroup (
	seq
	, name
)values(
	'infrMember018'
    , '이메일도메인'
);

insert into infrcode (
	code
	, name
    , infrcodeGroup_seq
)values(
	'3'
    , '@google.com'
    , 'infrMember018'
);

select * from project;

insert into project (
	name
	,startDate
	,endDate
	,role
	,company
	,infrMember_seq
	,infrMember_id
) values (
	'윤이나'
    , '2021-01-01'
    , '2021-12-31'
    , '이체 시스템 구축'
    , 'KB국민은행'
    , '1'
    , 'yina'
);

select * from phone;

insert into phone (sleepsleep
defaultNy
,codeCd
 , firstNumberCd
 , companyCd
 , infrMember_seq
 , infrMember_id
) values (
1,
1
,1
,1
,1
,'yina'

);

select * from slhobbyhobbyeep;

desc sleep;

select * from ;

select 
name
, id
genderCd
,(select name from code where codeGroup_seq='infra002' and code=genderCd) as company
from infrmember;