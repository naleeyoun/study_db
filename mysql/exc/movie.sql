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
where 
	mvcdSeq = b.mvsAreaCd 
    and b.mvsOrder = 1;

-- 예매 화면 (극장 선택)
select 
	mvcdName as '극장'
from 
	mvcode
    , mvscreen b 
where 
	mvcdSeq = b.mvsTheaterCd 
    and b.mvsOrder = 1
    and mvsTheaterCd = 91;

-- 예매 화면 (시간 선택)
select 
	mvtDate as '상영일'
   , (select mvcdName from mvcode where mvcdSeq = b.mvsTheaterCd) as '극장'
 	, (select mvcdName from mvcode where mvcdSeq = b.mvsScreenCd) as '상영관'
    , mvtStartTime as '시작시간'
    , mvtEndTime as '종료시간'
    , concat_ws('', c.mvstRow, c.mvstCol) as '좌석 행/열'
    , d.mvtcSeatReservedNy as '예매현황'
from mvtime a
left join mvscreen b on a.mvsSeq = b.mvsSeq
left join mvseat c on a.mvsSeq = c.mvsSeq
left join mvticketing d on c.mvsSeq = d.mvsSeq and c.mvstSeq = d.mvstSeq and a.mvtSeq = d.mvtSeq
where 
	b.mvsSeq = 2 
	and a.mvsSeq = 2
;
    
-- 예매 화면 (좌석 선택)
select 
	b.mvtStartTime as '영화시간'
	, a.mvstSeq
     , concat_ws('', a.mvstRow, a.mvstCol) as '좌석 행/열'
     , c.mvtcSeatReservedNy as '예매현황'
	  
    

from mvseat a
left join mvtime b on a.mvsSeq = b.mvsSeq
left join mvticketing c on a.mvsSeq = c.mvsSeq and b.mvtSeq = c.mvtSeq and a.mvstSeq = c.mvstSeq
where b.mvsSeq = 2 and a.mvsSeq = 2
;
  
  
select count(mvstRow) from mvseat where mvsSeq = 2
    
    
	
    


