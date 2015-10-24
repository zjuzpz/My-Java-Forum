create database bbs;

use bbs;

create table article 
(
id int primary key auto_increment,
pid int,
rootid int,
title varchar(255),
cont text,
pdate datetime,
isleaf int #1-not leaf 0-leaf
);

insert into article values (null, 0, 1, 'How to use eclipse', 'How to use eclipse to write Java?', now(), 1);
insert into article values (null, 1, 1, 'First you need to create a java class', 'First you need to create a java class',now(), 1);
insert into article values (null, 2, 1, 'No, actually you need to create a java project first!','No, actually you need to create a java project first!', now(), 1);
insert into article values (null, 3, 1, 'Yeah, you are right, then you can add a class file','Yeah, you are right, then you can add a class file', now(), 0);
insert into article values (null, 1, 1, 'Then you can use the System.out.println function to print "Hello world!"','Then you can use the System.out.println function to print "Hello world!"', now(), 0);
insert into article values (null, 1, 1, 'Also you can define some classes','Also you can define some classes', now(), 1);
insert into article values (null, 6, 1, 'Usually you may want to add some methods for your classes','Usually you may want to add some methods for your classes', now(), 0);
insert into article values (null, 7, 1, 'Yeah, actully, eclipse can help you to generate setters and getters automatically','Yeah, actully, eclipse can help you to generate setters and getters automatically', now(), 0);