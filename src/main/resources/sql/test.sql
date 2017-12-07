create table member(
	id varchar(30) not null,
	password varchar(30) not null,
	name varchar(30) not null,
	phone varchar(30) not null,
	primary key(id)

);



insert into member values('ajou', '1234', '임소영','01023991943');