create table member(
	id varchar(30) not null,
	password varchar(30) not null,
	name varchar(30) not null,
	phone varchar(30) not null,
	profile_path varchar(30) not null,
	primary key(id)
);
alter table  member prifile_path RENAME profile_path;

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
	primary key(board_no),
	foreign key(id) references member(id),
	foreign key(category_no) references category(category_no)
);

insert into member values('ajou', '1234', '임소영', '01023991943','ruby.png');
insert into member values('ajou2', '1234', '정다혜', '01012345421','java.png');

insert into board values(null, 'pickok',
'금전 관리에 취약한 사회 초년생들과 가계부 수기 작성이 힘든 주부들을 위한 금전 관리 어플리케이션',
'금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 금전 관리 ',
50,25,'2017-05-23','ajou2','JavaScript');
insert into board values(null, 'Project_A','content_back_A','content_detail_A',
50,5,'2017-06-01','ajou',3);

select board.title
from board,category
where (category_no = board.category_no);

select board.title,board.board_no
from board
where title like '%java%';











create table file(
	file_no int auto_increment not null,
	board_no int not null,
	file_path varchar(30) not null,
	primary key(file_no, board_no),
	foreign key (board_no) references board(board_no)
);
