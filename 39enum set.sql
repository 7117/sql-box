CREATE TABLE tab_st(
  s1 enum('a','b','c','d')
);
select * from tab_st;
insert into tab_st values('a');
insert into tab_st values('t');
insert into tab_st values('a,b');

CREATE TABLE tab_set(
s1 SET('a','b','c','d')
);
select * from tab_set;
INSERT INTO tab_set VALUES('a');
INSERT INTO tab_set VALUES('A,B');
INSERT INTO tab_set VALUES('a,c,d');
INSERT INTO tab_set VALUES('a,c,d,e');