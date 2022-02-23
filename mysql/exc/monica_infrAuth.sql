use nct;
select * from infrauth;
select * from infrauthmenu;
select * from infrmenu;


INSERT INTO `nct`.`infrauthmenu`
(
`ifauRoleCd`,
`ifauUseNy`,
`ifauOrder`,
`ifauDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifatSeq`,
`ifmuSeq`
)
VALUES
(
	1 -- `ifauRoleCd`,
	, 1 -- `ifauUseNy`,
	, 2 -- `ifauOrder`,
	, 0 -- `ifauDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 1 -- `ifatSeq`, auth테이블
	, 13 -- `ifmuSeq`, menu테이블
);
SET foreign_key_checks =0;  
SET foreign_key_checks =1;   

select * from infrauth;
select * from infrmenu;
select * from infrAuthMenu;
select * from infrauthmember;
desc infrAuthMenu;

select 
	a.ifatSeq
    , (select ifatName from infrAuth where ifatSeq = a.ifatSeq) as ifatName
    , a.ifmuSeq
    , (select ifmuName from infrMenu where ifmuSeq = a.ifmuSeq) as ifmuName
    , a.ifauRoleCd
    , (select ifcdName from infrCode where ifcdSeq = a.ifauRoleCd) as ifauRoleName
from infrAuthMenu a
	where 1=1
		and a.ifatSeq = 1
;

use nct;
select * from infrnationality;
