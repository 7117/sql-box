select database();
show tables;
create table index_test(
  id int(11) auto_increment primary key,
  name1 varchar(11) unique default '',
  name2 varchar(11)  default '',
  name3 varchar(11) default '',
  name4 varchar(11) default '',
  name5 varchar(11) default '',
  name6 int(11)
)engine=innodb default charset=utf8;
create table index_fk(
         id int(11) auto_increment primary key,
         fk int(11)
)engine=innodb default charset=utf8;
desc index_test;
select * from index_test;
insert into index_test values (null,'7','2','1','1','1',1);
insert into index_fk values (null,888);
insert into index_fk values (null,2);
drop table index_test;
# system const eq_ref ref range index all
# 总结：
# system就是只有一行匹配
# system只有一行 是system 衍生表里面有stystem
select * from (select name1 from index_test  where name1='1') d;
explain select * from (select name1 from index_test  where name1='1') d;
# const因为name1为唯一索引 只有一行数据  为const
select name1 from index_test  where name1='1';
explain select name1 from index_test  where name1='1';

# eq_ref 索引 只有一行是匹配的 就是eq_reg
select * from index_test inner join index_fk on index_test.id=index_fk.id;
explain select * from index_test inner join index_fk on index_test.id=index_fk.id;
# ref 非主键和唯一索引的其他索引加上唯一性条件的就是ref
create index index_aaa on index_test(name2);
select name2 from index_test where name2='2';
explain select name2 from index_test where name2='2';
select name2 from index_test where name2='666';
explain select name2 from index_test where name2='666';
explain select name6 from index_test where name6=2;
# range 有索引的 索引使用范围的就是range
create index index_name6 on index_test(name6);
select name6 from index_test where name6 between 4 and 6;
explain select name6 from index_test where name6 between 4 and 6;

# index只有索引的没有where条件的就是index索引
explain select name1 from index_test;
# all 全表扫描的 不会用到索引的就是all
explain select * from index_test;


/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : myemployees

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-22 15:17:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for index_fk
-- ----------------------------
DROP TABLE IF EXISTS `index_fk`;
CREATE TABLE `index_fk` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `fk` int(11) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_fk
-- ----------------------------
INSERT INTO `index_fk` VALUES ('1', '3');

-- ----------------------------
-- Table structure for index_test
-- ----------------------------
DROP TABLE IF EXISTS `index_test`;
CREATE TABLE `index_test` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name1` varchar(11) DEFAULT '',
                            `name2` varchar(11) DEFAULT '',
                            `name3` varchar(11) DEFAULT '',
                            `name4` varchar(11) DEFAULT '',
                            `name5` varchar(11) DEFAULT '',
                            `name6` int(11) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `name1` (`name1`),
                            KEY `index_aaa` (`name2`),
                            KEY `index_name6` (`name6`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_test
-- ----------------------------
INSERT INTO `index_test` VALUES ('1', '1', '666', '1', '1', '1', '1');
INSERT INTO `index_test` VALUES ('2', '2', '2', '1', '1', '1', '2');
INSERT INTO `index_test` VALUES ('3', '3', '2', '1', '1', '1', '3');
INSERT INTO `index_test` VALUES ('4', '4', '2', '1', '1', '1', '3');
INSERT INTO `index_test` VALUES ('5', '5', '2', '1', '1', '1', '5');
INSERT INTO `index_test` VALUES ('6', '6', '2', '1', '1', '1', '6');
INSERT INTO `index_test` VALUES ('7', '7', '2', '1', '1', '1', '7');
