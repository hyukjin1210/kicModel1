create table board(
num int primary key,
writer varchar(30),
pass varchar(20),
subject varchar(100),
content varchar(4000),
file1 varchar(100),
boardid varchar(1),
regdate date,
ip varchar(20),
readcnt number(10),
ref int,
reflevel number(3),
refstep number(5));

create sequence boardseq;