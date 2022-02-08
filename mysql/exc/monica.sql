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
    , b.ifcdName
    , b.ifcdOrder
from infrcodegroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
order by a.ifcgSeq, b.ifcdOrder;

