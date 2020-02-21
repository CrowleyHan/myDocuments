// 创建库，设定字符编码和大小写不区分utf8_general_ci 区分大小写/utf8_general_cs


create database `mydatabase` character set utf8mb4 collate utf8_general_ci;

create table tb_user(
		id varchar(100) not null comment "主键" ,
		username varchar(100) default null comment "用户名", 
		password varchar(255) default null ,
		gender int default null comment "0男1女2不显示",
		userlevel int not null comment "用户等级" ,
		exp_text varchar(255) default null comment "个人说明" ,
		usertype int not null comment "0超管1管理2普通见用户类型表");
		//插入创建时间的字段
		
	//用户类型		
//create table usertype (typeid int primary KEY,typename varchar(20) not null );
		create table usertype (typeid int primary KEY,typename varchar(20) not null,parent_type int not null comment "父类属性(typeid)");
		
	//论坛

		

