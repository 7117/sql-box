use test1;
create table dept
(
    id     int primary key auto_increment,
    deptno int         not null,
    dname  varchar(50) not null,
    loc    varchar(50) not null
) engine = innodb
  default charset = GBK;

show variables like 'log_bin_trust_function_creators';
set global log_bin_trust_function_creators = 1;

create function rand_string(n int) returns varchar(255)
begin
    declare chars_str varchar(100) default 'abcdefghigklmnopqrstuvwxyz';
    declare return_str varchar(255) default '';
    declare i int default 0;
    while i < n
        do
            set return_str = concat(return_str, substring(chars_str, floor(1 + rand() * 52), 1));
            set i = i + 1;
        end while;
    return return_str;
end;
select rand_string(5);
create function rand_num() returns int(5)
begin
    declare i int default 0;
    set i = floor(100 + rand() * 10);
    return i;
end;
select rand_num();

create procedure insert_emp(in start int(10), in max int(10))
begin
    declare i int default 0;
    set autocommit = 0;
    repeat
        set i = i + 1;
        insert into emp(id,empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values (i,(start + i), rand_string(8), 'saleman', 0001, '2020-12-12', 12, 'd', rand_num());
    until i = max
        end repeat;
    #记录一次性提交
    commit;
end;
create procedure insert_dept(in start int(10), in max int(10))
begin
    declare i int default 0;
    set autocommit = 0;
    repeat
        set i = i + 1;
        insert into dept(deptno,dname,loc)
        values ((start + i), rand_string(10),rand_string(8));
    until i = max
        end repeat;
    #记录一次性提交
    commit;
end;

call insert_dept(10000,10000);
call insert_emp(10000,10000);

