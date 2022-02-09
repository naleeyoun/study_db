

select
    a.ifcgseq
	, a.ifcgName
    , b.ifcdSeq
    , b.ifcdName
    , b.ifcdOrder
    , b.ifcdUseNy
    , b.ifcdDelNy
from infrcodegroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
	and a.ifcgUseNy = 1
	and b.ifcdDelNy = 0
	and b.ifcdUseNy = 1 
    -- and a.ifcgSeq = 3
order by 
    a.ifcgseq asc
	, a.ifcgName asc
    , b.ifcdSeq desc
    , b.ifcdName desc
    , b.ifcdOrder desc
    , b.ifcdUseNy desc
    , b.ifcdDelNy desc
;

select * from infrCode;

