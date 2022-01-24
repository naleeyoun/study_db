-- 도서 테이블 만들기

create table book (
	seq int,
    title varchar(100),
    publisher varchar(100),
    author varchar(100),
    price int
);


-- 카페 테이블 만둘기

create table cafe (
	seq int,
    name varchar(100),
    tableN int,
    chair int,
    address varchar(100),
    location varchar(100),
    ceo varchar(100)
);

-- 데이터 입력

insert into cafe (
	seq
	,name
	,tableN
	,chair
	,address
	,location
	,ceo
) values (
	1
    ,'별다방'
    ,1
    ,2
    ,'서울시 어디쯤'
    ,'서울'
    ,'장동건'    
);

-- varchar 은 ' 또는 " 로 감싼다.
-- int 는 사용하지 않아도 된다.
-- 컴마는 앞쪽을 선호 : 이건 호불호가 갈린다.

-- 데이터 조회
select * from cafe;
