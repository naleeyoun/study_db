insert into cafe (
	seq
	,name
	,tableN
	,chair
	,address
	,location
	,ceo
) values (
	10
    ,'한강커피'
    ,20
    ,80
    ,'서울시 강서구'
    ,'서울'
    ,'윤십나'    
);


select * from cafe;

select * from cafe where seq = 3;

select * from cafe where location='서울';

select * from cafe where name='별다방' and tableN=1 and chair=2;
select * from cafe where name='동네커피' or name='시장카페';

select * from cafe where chair <80;
select * from cafe where chair >80;
select * from cafe where chair <= 80;
select * from cafe where chair >=80;

select * from cafe where name like '%커피';

