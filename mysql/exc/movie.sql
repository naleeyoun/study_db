INSERT INTO `movie`.`mvcodegroup`
(
	`mvcgName`,
	`mvcgNameEng`,
	`mvcgUseNy`,
	`mvcgOrder`,
	`mvcgDelNy`,
	`regDateTime`,
	`regDateTimeSvr`,
	`modDateTime`,
	`modDateTimeSvr`
)
VALUES
(
	"회원.포인트.사유" -- `mvcgName`,
	, "mvpReason" -- `mvcgNameEng`,
	, 1 -- `mvcgUseNy`,
	, 1 -- `mvcgOrder`,
	, 0 -- `mvcgDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`

);


INSERT INTO `movie`.`mvcode`
(

	`mvcdName`,
	`mvcdUseNy`,
	`mvcdOrder`,
	`mvcdDelNy`,
	`regDateTime`,
	`regDateTimeSvr`,
	`modDateTime`,
	`modDateTimeSvr`,
	`mvcgSeq`
)
VALUES
(
	"영화예매" -- `mvcdName`,
	, 1 -- `mvcdUseNy`,
	, 2 -- `mvcdOrder`,
	, 0 -- `mvcdDelNy`,
	, now() -- `regDateTime`,
	, now() -- `regDateTimeSvr`,
	, now() -- `modDateTime`,
	, now() -- `modDateTimeSvr`,
	, 23 -- `mvcgSeq`

);


use movie;
select * from mvnationality;
select * from mvmovie;
select * from mvcode;
select * from mvgenre;
select * from mvcharacter;
select * from mvscreen;
select * from mvtime;
select * from mvseat;
select * from mvmember;
select * from mvmemberpoint;
select * from mvmembercoupon;
select * from mvcodegroup;
select * from mvmovie;
select * from mvticketing;
select * from mvseatreserve;

select mvmSeq as '영화제목', mvgGenreCd as '장르코드', mvgOrder as '장르Order' from mvgenre;


-- 영화 페이지 조회
select
	a.mvmName as '영화제목' 
 	, a.mvmNameEng as '영화제목(영문)'
 	, (select mvcdName from mvcode where mvcdSeq = a.mvmRangkingCd) as '랭킹'
 	, concat_ws('', a.mvmRate, '%') as '예매율'
    , (concat_ws(',', (select mvcdName from mvcode where a.mvmSeq = b.mvmSeq and mvcdSeq = b.mvgGenreCd and b.mvgOrder = 1)
  		,(select mvcdName from mvcode, mvgenre b where a.mvmSeq = b.mvmSeq and mvcdSeq = b.mvgGenreCd and b.mvgOrder = 2)
		,(select mvcdName from mvcode, mvgenre b where  a.mvmSeq = b.mvmSeq and mvcdSeq = b.mvgGenreCd and b.mvgOrder = 3))) as '장르'
    , (select mvcdName from mvcode where mvcdSeq = a.mvmAgeCd) as '관람등급'
 	, concat_ws('', a.mvmRunningTime, '분') as '러닝타임'
    , (select mvnaName from mvnationality where mvnaSeq = a.mvnaSeq) as '국적'
 	, a.mvmReleaseDate as '개봉일'
    , a.mvmIntroTitle as '영화소개(제목)'
 	, a.mvmIntro as '영화소개(내용)'
 	, (select mvcName from mvcharacter where mvcCharacterTypeCd = 81 and mvmSeq = a.mvmSeq) as '감독'
 	, concat_ws(',',(select mvcName from mvcharacter where mvcCharacterTypeCd = 80 and mvmSeq = a.mvmSeq and mvcOrder = 1)
 		,(select mvcName from mvcharacter where mvcCharacterTypeCd = 80 and mvmSeq = a.mvmSeq and mvcOrder = 2)
 		,(select mvcName from mvcharacter where mvcCharacterTypeCd = 80 and mvmSeq = a.mvmSeq and mvcOrder = 3)
		,(select mvcName from mvcharacter where mvcCharacterTypeCd = 80 and mvmSeq = a.mvmSeq and mvcOrder = 4)) as '배우'
from mvmovie a
left join mvgenre b on a.mvmSeq = b.mvmSeq
where 1 = 1
	and b.mvgOrder = 1
order by
	a.mvmRangkingCd asc
;

select * from mvgenre;
select * from mvCode;
select * from mvmovie;

-- 예매 화면
select
	a.mvmName as '영화제목'
    , (select mvcdName from mvcode where mvcdSeq = a.mvmAgeCd) as '관람등급'
    , a.mvmRunningTime as '상영시간'
    , (select mvcdName from mvcode where mvcdSeq = b.mvsAreaCd) as '지역'
    , (select mvcdName from mvcode where mvcdSeq = b.mvsTheaterCd) as '극장'
    , (select mvcdName from mvcode where mvcdSeq = b.mvsScreenCd) as '상영관'
    
from mvmovie a
left join mvscreen b on a.mvmSeq = b.mvmSeq
;


-- 예매 화면 (영화 고르기)
select
	mvmName as '영화제목'
    , (select mvcdName from mvcode where mvcdSeq = mvmAgeCd) as '관람등급'
    , mvmRunningTime as '상영시간'
from mvmovie
;

-- 예매 화면 (지역 선택)
select 
	mvcdName as '지역'
from 
	mvcode
    , mvscreen b 
where 1 = 1  
	and mvcdSeq = b.mvsAreaCd 
    and b.mvsOrder = 1
    and b.mvmSeq = 1
    ;
    

-- 예매 화면 (극장 선택)
select 
	mvcdName as '극장'
from 
	mvcode
    , mvscreen b 
where 
	mvcdSeq = b.mvsTheaterCd 
    and b.mvsOrder = 1
    and mvsTheaterCd = 91
    and b.mvmSeq = 1
    ;

-- 예매 화면 (시간,좌석 선택)
select 
	mvtDate as '상영일'
	, (select mvcdName from mvcode where mvcdSeq = b.mvsTheaterCd) as '극장'
    , (select mvcdName from mvcode where mvcdSeq = b.mvsScreenCd) as '상영관'
    , mvtDate as '상영일'
    , mvtStartTime as '시작시간'
    , mvtEndTime as '종료시간'
	, concat_ws('', c.mvstRow, c.mvstCol) as '좌석 행/열'
from mvtime a
	left join mvscreen b on a.mvsSeq = b.mvsSeq
	left join mvseat c on a.mvsSeq = c.mvsSeq
	left join mvseatreserve d on a.mvtSeq = d.mvtSeq and c.mvstSeq = d.mvstSeq
where 1=1
	and b.mvmSeq=1
 	and b.mvsSeq = 2 
    and a.mvtSeq = 2
 	and d.mvsrSeatReservedNy is null
;
    

 select * from mvtime;
 select * from mvscreen;
 
 
 -- 예매 화면 (userTicketing)
		select
			a.mvmSeq
			, a.mvmName
		    , (select mvcdName from mvCode where mvcdSeq = a.mvmAgeCd) as 'age'
		    , a.mvmAgeCd
		 	, a.mvmRunningTime
		 	, a.mvmImage
            , (select mvcdName from mvCode where mvcdSeq = b.mvsTheaterCd) as 'theater'
            , (select mvcdName from mvCode where mvcdSeq = b.mvsTheaterCd and mvsAreaCd = 82) as 'seoul'
            , (select mvcdName from mvCode where mvcdSeq = b.mvsTheaterCd and mvsAreaCd = 83) as 'kyunggy'
            , (select mvcdName from mvCode where mvcdSeq = b.mvsTheaterCd and mvsAreaCd = 84) as 'incheon'
            , concat(substring(c.mvtDate,9,2)) as 'date'
            , concat(substring(c.mvtStartTime,1,5)) as 'startTime'
            , concat(substring(c.mvtEndTime,1,5)) as 'endTime'
		from mvMovie a
        left join mvscreen b on a.mvmSeq = b.mvmSeq 
        left join mvtime c on b.mvsSeq = c.mvsSeq
		where 1 = 1
			and a.mvmSeq = 1
;
 
 select * from mvtime;
select * from mvscreen; 
 
 -- 좌석 선택 (userSeat)
select 
	a.mvtDate as '상영일'
	, (select mvcdName from mvcode where mvcdSeq = b.mvsTheaterCd) as '극장'
    , (select mvcdName from mvcode where mvcdSeq = b.mvsScreenCd) as '상영관'
    , a.mvtDate as '상영일'
    , a.mvtStartTime as '시작시간'
    , a.mvtEndTime as '종료시간'
	, c.mvstRow as '좌석 행'
    , c.mvstCol as '좌석 열'
    , (select mvmName from mvmovie where mvmSeq = b.mvmSeq )as '영화제목'
--   , d.mvsrSeatReservedNy as '예매현황'
from mvtime a
	left join mvscreen b on a.mvsSeq = b.mvsSeq
	left join mvseat c on a.mvsSeq = c.mvsSeq
	left join mvseatreserve d on a.mvtSeq = d.mvtSeq and c.mvstSeq = d.mvstSeq
--     left join mvmovie e on a.mvmSeq = e.mvmSeq and b.mvmseq = e.mvmseq
where 1=1
	and b.mvmSeq=1
 	and b.mvsSeq = 2 
    and a.mvtSeq = 2
 	and d.mvsrSeatReservedNy is null
;

select * from mvcodegroup;

 
select count(mvstRow) from mvseat where mvsSeq = 2;


select * from mvmembercoupon;
select * from mvticketing;
select * from mvscreen;
select * from mvtime;
select * from mvmemberPoint;
select * from mvticketing;
select * from mvseatreserve;
select * from mvseat;

select mvcpName from mvmembercoupon where mvcpUsedNy = 0 and mvmmSeq = a.mvmmseq;
(select mvcName from mvcharacter where mvcCharacterTypeCd = 80 and mvmSeq = a.mvmSeq and mvcOrder = 2);

select a.mvcpName from mvmembercoupon a, mvticketing b where a.mvmmseq = b.mvmmseq;


select 
	mvtcSeq
    , mvtcNumber as 'Number'
    , mvtcSeatReservedNy as 'SeatReservedNy'
    , mvstSeq as 'SeatSeq'
    , mvtcPrice as 'Price'
from mvticketing;




 -- 결제 화면
select
  a.mvtcSeq
  	,b.mvmName as '영화제목'
 	, c.mvtDate as '날짜'
 	, concat(substring(c.mvtStartTime,1,5),"~",substring(c.mvtEndTime,1,5)) as '시간'
    , (select mvcdName from mvcode where mvcdSeq = d.mvsScreenCd) as '상영관'
    , concat_ws("", a.mvtcNumber, "명") as '인원수'
 	, concat_ws("", a.mvtcPrice, "원") as '가격'
    , concat_ws('|',(select g.mvcpName from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 1 and h.mvmmSeq = 1)
		,(select g.mvcpName from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 2 and h.mvmmSeq = 1)
		,(select g.mvcpName from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 3 and h.mvmmSeq = 1)
		,(select g.mvcpName from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 4 and h.mvmmSeq = 1)) as '쿠폰이름'
    , concat_ws('|',(select g.mvcpPrice from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 1 and h.mvmmSeq = 1)
		,(select g.mvcpPrice from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 2 and h.mvmmSeq = 1)
		,(select g.mvcpPrice from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 3 and h.mvmmSeq = 1)
		,(select g.mvcpPrice from mvcoupon g, mvmembercoupon h where g.mvcpSeq = h.mvcpSeq and  h.mvmcOrder = 4 and h.mvmmSeq = 1)) as '쿠폰가격'
 		, f.mvpTotalPoint as '사용가능포인트'
    , concat_ws('|',(select mvcdName from mvcode where mvcdSeq = 114)
 			,(select mvcdName from mvcode where mvcdSeq = 115) 			
            ,(select mvcdName from mvcode where mvcdSeq = 116) 			
            ,(select mvcdName from mvcode where mvcdSeq = 117)
           ,(select mvcdName from mvcode where mvcdSeq = 118)) as '결제방법'
from mvticketing a
 	left join mvmovie b on a.mvmSeq = b.mvmSeq
    left join mvtime c on a.mvtSeq = c.mvtSeq
     left join mvscreen d on a.mvsSeq = d.mvsSeq
     left join mvmemberPoint f on a.mvmmSeq = f.mvmmSeq and f.mvpSeq = 3

where 1=1
 	and d.mvsSeq = 2
    and c.mvtSeq=3
-- 	and e.mvtcSeq is null
    and a.mvtcSeq = 2
--    and e.mvmmSeq = 1
    and a.mvmmSeq = 1
;


select * from mvmembercoupon;
select * from mvcoupon;

select mvtDate from mvtime where mvtSeq=3;

select * from mvscreen;

use movie;

select 
	 a.mvtDate as '날짜'
from mvtime a
	left join mvticketing c on a.mvtSeq = c.mvtSeq and  a.mvsSeq = c.mvsSeq
    where a.mvtSeq=3
;
select * from mvmembercoupon;
select * from mvticketing;
select * from mvcoupon;
select * from mvmember;
select * from mvmembercoupon;
desc mvmember;
select * from mvcode;

select mvcpName from mvcoupon;

select a.mvcpName from mvcoupon a, mvticketing b, mvmembercoupon c where c.mvmmSeq = b.mvmmSeq and c.mvmcOrder = 1;

use movie;
select * from mvscreen;
        
select * from mvcodegroup;

		select
			a.mvsSeq
            ,(select mvcdName from mvCode where mvcdSeq = a.mvsTheaterCd) as 'theater'
			, (select mvcdName from mvCode where mvcdSeq = a.mvsTheaterCd ) as 'seoul'

		from mvScreen a
		left join mvMovie b on a.mvmSeq = b.mvmSeq
		where 1 = 1
			and a.mvmSeq = 1;
		
select * from mvtime;
		select
			b.mvmSeq
			, (select mvcdName from mvCode where mvcdSeq = a.mvsAreaCd) as 'theater'
			, (select mvcdName from mvCode where mvcdSeq = a.mvsTheaterCd) as 'seoul'
			, (select mvcdName from mvCode where mvcdSeq = a.mvsTheaterCd and mvsAreaCd = 83) as 'gyeonggi'
			, (select mvcdName from mvCode where mvcdSeq = a.mvsTheaterCd and mvsAreaCd = 84) as 'incheon'
		from mvScreen a
		left join mvMovie b on a.mvmSeq = b.mvmSeq
		where 1 = 1;
 
 select * from mvscreen;
 
		select
            concat(substring(a.mvtStartTime,1,5)) as 'startTime'
            , concat(substring(a.mvtEndTime,1,5)) as 'endTime'
            , a.mvtDate
            , b.mvsOrder
            , (select mvcdName from mvCode where mvcdSeq = b.mvsScreenCd) as 'screen'
     
		from mvTime a
		left join mvScreen b on a.mvsSeq = b.mvsSeq
		where 1 = 1
			and b.mvmSeq = 1
			and a.mvsSeq = 2
		 	and a.mvtDate = '2022-02-14'
           
            ;
            
select * from mvMemberEmail; 

			insert into mvMemberEmail (
				mvmeEmailAccount
				, mvmeEmailDomainCd
				, mvmeDelNy
				, mvmmSeq
                , mvmeDefaultNy
			) values (
			"bbbbb"
				, 16
				, 0
				, 16
                , 0
			);  
            
select * from mvmemberphone;
			insert into mvMemberPhone (
				mvmpDeviceCd
				, mvmpNumber
				, mvmpDelNy
				, mvmmSeq
				, mvmpDefaultNy
			) values (
				24
				, 01024562154
				, 0
				, 16
				, 0
			);
select * from mvmembernationality;
select * from mvmemberaddress;
select * from mvmemberhobby;

			insert into mvMemberHobby (
				mvmhHobbyCd		
				, mvmmSeq
			) values (
				37
				, 1
			)
;
			insert into mvMemberAddress (
				mvmaZipcode			
				, mvmaAddress1
				, mvmaAddress2		
				, mvmaDelNy
				, mvmmSeq
				, mvmaDefaultNy
			) values (
				13245
				, "인천광역시 계양구"
				, "계산동 12345"
				, 0
				, 16
				, 1
			);
            use movie;
            select * from mvmember;
            select * from mvmemberphone;
select * from mvmemberaddress;

update mvMember set
mvmmDelNy = 0
where 
mvmmDelNy = 1;



select regDateTime, mvmmSeq from mvmember
 ;
select * from mvmember;

update mvMember set mvmmDelNy = 1, modDateTime = now() where 1=1 and mvmmSeq = 26;

select mvmeEmailDomainCd from mvmemberemail;
select * from mvmemberaddressonline;
select * from mvcode;

			insert into mvMemberAddressOnline (
				mvaoTypeCd	
				, mvaoUrl
				, mvaoDelNy		
				, mvaoDefaultNy
               ,  mvmmSeq
			) values (
				33
				, "www.yina.com"
				, 0
				, 1
                , 16
			);