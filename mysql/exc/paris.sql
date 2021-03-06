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
   'sipilna',
  '십일나',
  '91292EA1108F0945D549AB867C332EB274822AC99C8E015A31F7FC02E6959F8F',
  'tlqdlfsk0105',
  2,
 '2010-03-24',
  '1',
  '/yina/photo/photo8.png',
  'www.naver.com',
  '1',
  '1',
  '2015-08-08',
  2,
  'red',
  '2',
  '20220203131400',
  '2',
  '20220203131400',
  '2',
  '20220203131400'
);


update infrmember set childrenCd=2 where seq="8";


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

select * from infrmphone;

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

select * from infrmsleep;

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

select * from infrmsns;

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

select * from infrmcode;
select * from infrmcodegroup;

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

select * from infrmproject;

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

select * from infrmphon;
desc inf1rmphone;

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

select * from infrmhobby;

desc infrmsleep;

select * from infrmaddress;

select 
	name
	, id
	,genderCd
	,(select name from infrmcode a
left join infrmcodegroup b on b.infrcodeGroup_seq='infrMember002' and a.code=infrmember.genderCd) as '성별'
from infrmember;


select * from infrmcodegroup;
use world;

select * from infrmcode;
select * from infrmsleep;
desc infrmsleep;
select * from infrmember;
select * from infrmsns;
select * from infrmemail;
select * from infrmproject;

update infrmsleep set sleepDate="2022-01-30 00:00:00"
where seq="10";

update infrmcode set name='비활성'
where infrcodeGroup_seq='infrMember001' and code='2';

update infrmember set adminCd='1'
where seq='10';

select
	a.seq as '회원번호'
    , (select name from infrmcode e where infrcodeGroup_seq = 'infrMember019' and a.adminCd = e.code) as '등급'
	, a.name as '이름'
	, a.id as '아이디'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember002' and a.genderCd = e.code) as '성별'
	, a.birthday as '생년월일'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember006' and a.jobCd = e.code) as '직업'
	, a.NationalityCd as '국적코드'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember003' and a.NationalityCd = e.code) as '국적'
	, b.address as '주소'
	, c.fullPhoneNumber as '전화번호'
	, d.sleepCd as '활성상태코드'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember001' and d.sleepCd = e.code) as '활성상태'
	, d.awakeDate as '활성시간'
	, d.sleepDate as '비활성시간'
	, f.snstypeCd as 'sns타입코드'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember011' and f.snstypeCd = e.code) as 'sns타입'
	, f.url as 'sns주소'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember013' and a.emailMarketingCd = e.code) as '이메일마케팅동의'
	, (select name from infrmcode e where infrcodeGroup_seq = 'infrMember014' and a.mobileMarketingCd = e.code) as '이메일마케팅동의'
from infrmember a
left join infrmaddress b on a.seq = b.infrMember_seq
left join infrmphone c on a.seq = c.infrMember_seq
left join infrmsleep d on a.seq = d.infrMember_seq
left join infrmsns f on a.seq = f.infrMember_seq;

select * from infrmphone;

update infrmphone
set fullphonenumber="01011111111" where seq="1";

select
	a.name
	, a.id
	, b.sleepDate
	, (select name from infrmcode c where infrcodeGroup_seq = 'infrMember001' and b.sleepCd=c.code) as '회원상태'
from infrmember a
left join infrmsleep b on a.seq = b.infrMember_seq
;

use nct;
select * from infrauthmember;