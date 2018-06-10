/*
SQLyog Professional v12.3.1 (32 bit)
MySQL - 5.7.17-log : Database - fuyanjuan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fuyanjuan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fuyanjuan`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章表ID',
  `Title` varchar(100) NOT NULL COMMENT '文章标题',
  `Issuing_Time` varchar(50) NOT NULL COMMENT '文章发布时间',
  `Author` int(11) NOT NULL COMMENT '文章发布人（作者）',
  `Content` longtext NOT NULL COMMENT '文章内容',
  `Commentator` varchar(45) DEFAULT NULL COMMENT '评论老师',
  `Comment` longtext COMMENT '老师评论内容',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '文章状态0正常状态，1为删除状态',
  PRIMARY KEY (`ID`),
  KEY `PK_AuthorID` (`Author`),
  CONSTRAINT `PK_AuthorID` FOREIGN KEY (`Author`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

LOCK TABLES `article` WRITE;

insert  into `article`(`ID`,`Title`,`Issuing_Time`,`Author`,`Content`,`Commentator`,`Comment`,`Status`) values 
(1,'测试1','2018-04-24 22:10:00',1,'测试内容',NULL,'',0),
(2,'测试2','2018-04-24 22:11:00',1,'测试内容2',NULL,NULL,0),
(3,'测试3','2018-04-24 22:12:00',1,'测试内容3',NULL,NULL,0),
(4,'测试4','2018-04-24 22:13:00',1,'  测试内容4',NULL,NULL,0),
(5,'测试5','2018-04-24 23:47:01',1,'  来自网页的测试内容！\n啊啊啊啊啊啊。\n    求过',NULL,NULL,0),
(6,'测试三','2018-04-25 21:21:29',1,'afaf af af af a fa a fa \nafaf a af a f a a fa f ',NULL,NULL,0),
(7,'测试7','2018-04-25 21:22:51',1,'阿发啊啊啊啊 啊啊分 啊\n阿发发发疯阿发阿发 啊 ',NULL,NULL,0);

UNLOCK TABLES;

/*Table structure for table `message_board` */

DROP TABLE IF EXISTS `message_board`;

CREATE TABLE `message_board` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言板表ID',
  `Commenter` varchar(45) NOT NULL COMMENT '留言人',
  `Content` longtext NOT NULL COMMENT '留言内容',
  `Time` varchar(50) NOT NULL COMMENT '留言时间',
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `message_board` */

LOCK TABLES `message_board` WRITE;

insert  into `message_board`(`ID`,`Commenter`,`Content`,`Time`) values 
(1,'测试员','测试留言','2018-04-24 10:34:00'),
(2,'测试员','测试留言1','2018-03-24 10:34:00'),
(3,'测试员','这是来自网页的测试留言板内容！','2018-04-28 12:15:07'),
(4,'测试员','这是来自网页留言板测试内容2！','2018-04-28 12:18:07'),
(5,'测试员','这是来自网页的测试内容3','2018-04-28 12:20:07'),
(6,'测试员','这是来自网页的测试留言板内容4！','2018-04-28 12:22:07');

UNLOCK TABLES;

/*Table structure for table `photo_wall` */

DROP TABLE IF EXISTS `photo_wall`;

CREATE TABLE `photo_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '照片表id',
  `FileUrl` longtext NOT NULL COMMENT '照片文件路径',
  `Photo_Description` longtext COMMENT '用户输入的描述',
  `Uploader` varchar(45) NOT NULL COMMENT '上传者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `photo_wall` */

LOCK TABLES `photo_wall` WRITE;

insert  into `photo_wall`(`id`,`FileUrl`,`Photo_Description`,`Uploader`) values 
(5,'a3f58725-3965-4549-8753-63a857f1071fHydrangeas.jpg','嘎嘎sag','测试员');

UNLOCK TABLES;

/*Table structure for table `remarks` */

DROP TABLE IF EXISTS `remarks`;

CREATE TABLE `remarks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Time` varchar(100) DEFAULT NULL COMMENT '操作记录的操作时间',
  `Content` longtext COMMENT '操作内容',
  `Objects` int(11) NOT NULL COMMENT '对哪个对象进行的操作',
  PRIMARY KEY (`ID`),
  KEY `PK_ObjectID` (`Objects`),
  CONSTRAINT `PK_ObjectID` FOREIGN KEY (`Objects`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `remarks` */

LOCK TABLES `remarks` WRITE;

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表ID',
  `UserName` varchar(45) NOT NULL COMMENT '用户名',
  `PassWord` varchar(1000) NOT NULL COMMENT '用户密码',
  `Registration_Time` varchar(100) NOT NULL COMMENT '用户注册时间',
  `isadmin` int(11) NOT NULL COMMENT '是否为管理员',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`ID`,`UserName`,`PassWord`,`Registration_Time`,`isadmin`) values 
(1,'测试员','14e1b600b1fd579f47433b88e8d85291','2018-04-18 23:50:26',0),
(2,'李老师','14e1b600b1fd579f47433b88e8d85291','2018-04-28 22:50:26',1),
(3,'王小','14e1b600b1fd579f47433b88e8d85291','2018-04-27 22:51:26',0),
(4,'王小二','14e1b600b1fd579f47433b88e8d85291','2018-06-7 19:51:26',0);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
