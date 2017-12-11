

drop table file;
drop table board;
drop table category;

drop table member;
drop table folder;

create table member(
	id varchar(30) not null,
	password varchar(30) not null,
	name varchar(30) not null,
	phone varchar(30) not null,
	profile_path varchar(30),
	primary key(id)

)DEFAULT CHARSET=utf8


create table category(
	category_no int auto_increment primary key,
	category_name varchar(30) not null,
	photo_path varchar(30) not null
);

insert into category values(null, 'C', 'c.png');
insert into category values(null, 'HTML', 'html5logo-new.jpg');
insert into category values(null, 'JAVA', 'java.png');
insert into category values(null, 'JavaScript', 'javascript.png');
insert into category values(null, 'PHP', 'php.jpg');
insert into category values(null, 'Python', 'python.png');
insert into category values(null, 'Ruby', 'ruby.png');
insert into category values(null, 'R', 'rstudio.png');

create table folder(
	folder_no int auto_increment primary key,
	folder_name varchar(30) not null
)DEFAULT CHARSET=utf8;

create table board(
	board_no int auto_increment,
	title varchar(30) not null,
	content_back varchar(500) not null,
	content_detail varchar(500) not null,
	hits int default 0,
	likes int default 0,
	timePosted date not null,
	id varchar(30) not null,
	category_no int not null,
	folder_no int not null,
	primary key(board_no),
	foreign key(id) references member(id),
	foreign key(category_no) references category(category_no),
	foreign key(folder_no) references folder(folder_no)
)DEFAULT CHARSET=utf8;

create table file(
	file_no int auto_increment not null,
	board_no int not null ,
	file_path varchar(30) not null,
	primary key(file_no, board_no),
	foreign key (board_no) references board(board_no)
)DEFAULT CHARSET=utf8

insert into member values('ajou', '1234', '임소영 ', '01023991943','ruby.png');
insert into folder values(null, 'Ajou 2017-2');
select * from file;

select category_no,category_name from category;

select * from board;
select * from file;
select * from member;
show variables like 'c%';




select*from member;
select * board;
select * from comment;


create table opensource_comment(
   comment_no int auto_increment not null,
   board_no int not null,
   id varchar(30) not null ,
   contents varchar(50) not null,
   timePosted date not null,
   primary key(comment_no,board_no, id),
   constraint fk_cbno foreign key(board_no) references board(board_no),
   constraint fo_cid foreign key(id) references member(id)
)ENGINE = InnoDB;



SET FOREIGN_KEY_CHECKS=0;  
delete from file;
delete from board;

select * from board;
select * from file;
