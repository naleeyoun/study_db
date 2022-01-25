use world;

show tables;

-- 주석

-- 테이블 생성
create table member (
	seq int,
    name varchar(100),
    id varchar(100),
    regdate datetime
);

create table member2 (
	seq int,
    name varchar(100),
    id varchar(100),
    regdate datetime
);

 -- 테이블 삭제
 
 drop table member2;
 drop table member;
 
 
-- varchar 은 ' 또는 " 로 감싼다.
-- int 는 사용하지 않아도 된다.
-- 컴마는 앞쪽을 선호 : 이건 호불호가 갈린다.

-- 데이터 조회
select * from cafe;
select * from cafe where name like '%커피';

-- pk : primary key : 중복되는 데이터는 불허
-- nn : not null : null 값을 허용하지 않는다. 데이터가 무조건 들어와야된다.
-- uq : 유니크 : 중복되는 데이터는 불허
-- b : 바이너리 파일 저장
-- un : undefined? : 양수만
-- zf : zerofill : 507(5,2) -> 00005.7
-- ai : auto increment : 자동적으로 숫자가 올라감
-- g : auto increment의 다른 형태

-- 테이블 수정
-- 컬럼 추가
alter table test add tel varchar(50);
-- 컬럼 삭제
alter table test drop tel;
-- 컬럼 이름 변경
alter table test change tel tele int;
-- 컬럼 타입 변경
alter table test modify tel int;
alter table test modify tel varchar(20);
desc test;

-- 데이터 수정
update test set
	name = 'Andrew'
where
	seq = 3;

-- 데이터 삭제
delete from test
where
	seq = 3;
    
select * from test;

-- 전체 데이터 삭제
truncate test;

