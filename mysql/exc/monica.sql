INSERT INTO `nct`.`infrcodegroup`
(
	`ifcgName`,
	`ifcgUseNy`,
	`ifcgOrder`,
	`ifcgDelNy`,
	`regDateTime`,
	`regDateTimeSvr`,
	`modDateTime`,
	`modDateTimeSvr`
) VALUES (
	'회원.보안질문'
    , 1
    , 14
    , 0
    , now()
    , now()
    , now()
    , now()
);

select * from infrcodegroup;
select * from infrcode;

update infrCodeGroup
set ifcgDelNy=1
where ifcgSeq>10;


INSERT INTO `nct`.`infrcode`
(
	`ifcdName`,
	`ifcdUseNy`,
	`ifcdOrder`,
	`ifcgDelNy`,
	`regDateTime`,
	`regDateTimeSvr`,
	`modDateTime`,
	`modDateTimeSvr`,
	`ifcgSeq`
) VALUES (
	"가장 좋아하는 장소는?" -- ifcdName
    , 1 -- ifcdUseNy
    , 3 -- ifcdOrder
    , 0 -- ifcgDelNy
    , now() -- regDateTime
    , now() -- regDateTimeSvr
    , now() -- modDateTime
    , now() -- modDateTimeSvr
    , 14 -- ifcgSeq
);

select
    a.ifcgseq
	, a.ifcgName
    , b.ifcdSeq
    , b.infrmemberifcdName
    , b.ifcdOrder
from infrcodegroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
order by a.ifcgSeq, b.ifcdOrder;




use nct;
select * from infrnationality;

INSERT INTO `infrnationality`
(
`ifnaName`,
`ifnaCode2Char`,
`ifnaCode3char`,
`ifnaUseNy`,
`ifnaOrder`,
`ifnaDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`ModDateTime`,
`ModDateTimeSvr`)
VALUES
(
	"한국"
	,"KR"
	,"KOR"
	,1
	,1
	,0
	,now()
	,now()
	,now()
	,now()
);


select * from infrmember;

INSERT INTO `nct`.`infrmember`
(
`ifmmDelNy`,
`ifmmAdminNy`,
`ifmmDormancyNy`,
`ifmmName`,
`ifmmId`,
`ifmmPassword`,
`ifmmPwdModDate`,
`ifmmGenderCd`,
`ifmmDob`,
`ifmmSavedCd`,
`ifmmMarriageCd`,
`ifmmMarriageDate`,
`ifmmChildrenNum`,
`ifmmFavoriteColor`,
`ifmmRecommenderSeq`,
`ifmmEmailConsentNy`,
`ifmmSmsConsentNy`,
`ifmmPushConsentNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`
) VALUES (
	0,
	0,
	0,
	"윤이나",
	"yina12345",
	"4FA210A06F9FAA90AADCA1A977D784D5D4E95ED4C993A60B2D6C5F0BF5956633",
	now(),
	2,
	"1999-12-31",
	1,
	2,
	"2020-01-02",
	"1",
	"yellow",
	1,
	0,
	1,
	1,
	now(),
	now(),
	now(),
	now()
);

select * from infrmember;

INSERT INTO `nct`.`infrmemberaddressonline`
(
`ifaoTypeCd`,
`ifaoDefaultNy`,
`ifaoSnsTypeCd`,
`ifaoUrl`,
`ifaoDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES(
	2 -- `ifaoTypeCd`,
	, 0 -- `ifaoDefaultNy`,
	, 4 -- `ifaoSnsTypeCd`,
	, "yina12345" -- `ifaoUrl`,
	, 0 -- `ifaoDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`
);

INSERT INTO `nct`.`infrmemberemail`
(
`ifmeDefaultNy`,
`ifmeTypeCd`,
`ifmeEmailFull`,
`ifmeEmailAccount`,
`ifmeEmailDomain`,
`ifmeEmailDomailCd`,
`ifmeDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`
) VALUES (
	0 -- `ifmeDefaultNy`,
	, 2 -- `ifmeTypeCd`,
	, "yinayina@naver.com" -- `ifmeEmailFull`,
	, "yinayina" -- `ifmeEmailAccount`,
	, null -- `ifmeEmailDomain`,
	, 1 -- `ifmeEmailDomailCd`,
	, 0 -- `ifmeDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`
);

INSERT INTO `nct`.`infrmemberaddress`
(
`ifmaDefaultNy`,
`ifmaTypeCd`,
`ifmaTitle`,
`ifmaAddress1`,
`ifmaAddress2`,
`ifmaZipcode`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`
)
VALUES(
	0 -- `ifmaDefaultNy`,
	, 2 -- `ifmaTypeCd`,
	, "회사" -- `ifmaTitle`,
	, "서울특별시 서초구 서초3길 52" -- `ifmaAddress1`,
	, "서초빌딩 A동 506호" -- `ifmaAddress2`,
	, "99999" -- `ifmaZipcode`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`
);

INSERT INTO `nct`.`infrmemberhobby`
(
`ifmhHobbyCd`,
`ifmhOrder`,
`ifmhUseNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`
)
VALUES
(
	4 -- `ifmhHobbyCd`,
	, 3 -- `ifmhOrder`,
	, 1 -- `ifmhUseNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`
);


INSERT INTO `nct`.`infrmemberjoinqna`
(
`ifjqQuestionCd`,
`ifjqAnswer`,
`ifjqDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`
)
VALUES
(

, "어머니"
, 0
, now()
, now()
, now()
, now()
, 2
);

INSERT INTO `nct`.`infrmembernationality`
(
`ifnaDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`,
`ifnaSeq`
)
VALUES
(
	0 -- `ifnaDelNy`.
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`,
	, 2 -- `ifnaSeq`
);



use nct;
desc infrmember;
select * from infrmembernationality;
select * from infrmembernationality;

select * from  infrauthmenu;

INSERT INTO `nct`.`infrmemberphone`
(
`ifmpDefaultNy`,
`ifmpTypeCd`,
`ifmpDiveceCd`,
`ifmpTelecomCd`,
`ifmpNumber`,
`ifmpDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`
)
VALUES
(
	0 -- `ifmpDefaultNy`,
	, 2 -- `ifmpTypeCd`,
	, 1 -- `ifmpDiveceCd`,
	, 2 -- `ifmpTelecomCd`,
	, "07052143514" -- `ifmpNumber`,
	, 0 -- `ifmpDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 2 -- `ifmmSeq`
);

