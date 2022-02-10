alter table infrMemberNationality add ifmnDefaultNy tinyint after ifmnSeq;

select * from infrMemberNatiinfrmemberjoinqnainfrmembernationalityinfrmemberphoneinfrmenuonality;

select * from infrmember;
select * from infrmemberaddressonline;
select * from infrmemberaddress;
select * from infrcode where ifcgSeq=11;
select * from infrcodegroup;

insert into infrcode
(ifcdName
, ifcdUseNy
, ifcdOrder
, ifcgSeq
, ifcdDelNy) 
values (
"기타"
, 1
, 5
, 11
, 0

);


select * from infrmemberemail;
select * from infrmembernationality;
select * from infrnationality;
select * from infrcode;
select * from infrmember;

select
    a.ifmmAdminNy
    , a.ifmmDormancyNy
    , a.ifmmName
    , a.ifmmId
    , a.ifmmgenderCd
    , (select ifcdName from infrCode where ifcdSeq = a.ifmmgenderCd) as ifmmgenderName
    , a.ifmmDob
    , b.ifmaTypeCd
    , (select ifcdName from infrCode where ifcdSeq  = b.ifmaTypeCd) as ifmaTypeName
from infrMember a
	left join infrMemberAddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy =1 and b.ifmmseq=a.ifmmseq;


select
    a.ifmmAdminNy
    , a.ifmmDormancyNy
    , a.ifmmName
    , a.ifmmId
    , a.ifmmgenderCd
    , (select ifcdName from infrCode where ifcdSeq = a.ifmmgenderCd) as ifmmgenderName
    , a.ifmmDob
    , b.ifmaTypeCd
    , (select ifcdName from infrCode where ifcdSeq  = b.ifmaTypeCd) as ifmaTypeName
    , b.ifmaTitle
    , b.ifmaAddress1
    , b.ifmaAddress2
    , b.ifmaZipCode
    , c.ifaoTypeCd
    , (select ifcdName from infrCode where ifcdSeq = c.ifaoTypeCd) as ifaoTypeName
    , c.ifaoTitle
    , c.ifaoUrl
  , d.ifmeTypeCd
 , (select ifcdName from infrCode where ifcdSeq = d.ifmeTypeCd) as ifmeTypeName
 , d.ifmeEmailFull
 , e.ifjqQuestionCd
, (select ifcdName from infrCode where ifcdSeq = e.ifjqQuestionCd) as ifjqQuestionName
 , e.ifjqAnswer
 , f.ifnaSeq
 , g.ifnaName
, h.ifmpTypeCd
, (select ifcdName from infrCode where ifcdSeq  = h.ifmptypeCd) as ifmptypeName
, h.ifmpDiveceCd
, (select ifcdName from infrCode where ifcdSeq  = h.ifmptypeCd) as ifmptypeName
, h.ifmpTelecomCd
  , (select ifcdName from infrCode where ifcdSeq  = h.ifmptypeCd) as ifmptypeName
 , h.ifmpNumber
 , concat(substring(h.ifmpNumber,1,3),"-",substring(h.ifmpNumber,4,4),"-",substring(h.ifmpNumber,7,4)) as ifmpTelecomNameWithDash
from infrMember a
	left join infrMemberAddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy =1 and b.ifmmseq=a.ifmmseq
    left join infrMemberAddressOnline c on c.ifaoDelNy=0 and c.ifaoDefaultNy=1 and c.ifmmSeq = a.ifmmSeq
    left join infrMemberEmail d on d.ifmeDelNy=0 and d.ifmeDefaultNy=1 and d.ifmmSeq = a.ifmmSeq
    left join infrMemberJoinQna e on e.ifjqDelNy=0 and  e.ifmmSeq = a.ifmmSeq
    left join infrmembernationality f on f.ifmnDefaultNy=1 and f.ifmmSeq = a.ifmmSeq
    left join infrnationality g on g.ifnaSeq = f.ifnaSeq
    left join infrmemberphone h on h.ifmpDefaultNy=1 and h.ifmmSeq = a.ifmmSeq
where 1=1
	and a.ifmmDelNy = 0
	-- and a.ifmmId like '%xd%'
	-- and b.ifmaTypeCd = 46
	-- and c.ifaoSnsTypeCd = 37
	-- and b.ifcdUseNy = 1 
    -- and a.ifcgSeq = 3
-- order by 
   -- a.ifcgseq asc
	-- , a.ifcgName asc
   -- , b.ifcdSeq desc
   -- , b.ifcdName desc
   -- , b.ifcdOrder asc
   -- , b.ifcdUseNy desc
   -- , b.ifcdDelNy desc
;

use nct;
select * from infrmemberphone;

