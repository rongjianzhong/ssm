/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.36 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `dep` */

DROP TABLE IF EXISTS `dep`;

CREATE TABLE `dep` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tele` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dep` */

insert  into `dep`(`uuid`,`name`,`tele`) values ('3a8a17322a344ed5bab31de6fde16d36','财务部','0735-888888'),('70b4cf1784cf46aabccbb04785f8f71e','采购部','0735-111111'),('84b1b2ddef4542f98e1c84cf0d3dd953','销售部','0735-222222'),('9b43d254ab2b4da2834d89551d37c806','仓库部','0735-333333'),('c58e050f9fdc41379d6e6785339b3084','管理员组','0735-000000');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `uuid` varchar(32) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tele` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `depuuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp` */

insert  into `emp`(`uuid`,`username`,`pwd`,`name`,`gender`,`email`,`tele`,`address`,`birthday`,`depuuid`) values ('258564e39c0b489cbb1941a750ed46bd','cgjl','1234','小王','男','4654456@qq.com','19888999988','北京','2019-01-09','采购部'),('ab784754f21e4587b3843cf157575dc8','qhb','1234','秦海波','男','555555@qq.com','13199888899','湖南长沙','2019-01-09','采购部'),('bc7c5f25241f423eaa2b5669d2440120','ck','1234','ck','男','222222@qq.com','15544556655','湖南','2019-01-09','仓库部'),('bccfc19fd6a9472593305c84e285e8b0','liwen','1234','李文','男','6666666@qq.com','0735-6666666','湖南','2018-12-27','销售部'),('c0d7f87dc34d416d997bd4148b8c7a67','xsjl','1234','小李','男','66699885@qq.com','13677885566','北京','2019-01-09','销售部'),('effbf67b8bbe49da83c66a799b9b0d96','admin','admin','管理员','男','88888@qq.com','0735-88888888','北京','2018-12-28','管理员组');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `producer` varchar(30) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `inprice` float DEFAULT NULL,
  `outprice` float DEFAULT NULL,
  `goodstypeuuid` varchar(32) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`uuid`,`name`,`origin`,`producer`,`unit`,`inprice`,`outprice`,`goodstypeuuid`,`createdate`) values ('07cc4f3eb50e47bbace28e82f529914b','kk','kk','112','斤',12,15,'零食','2019-01-10 14:46:07'),('11ab204f21144d848731c556a891f35e','1','1','黑色经典','1',1,1,'小吃','2019-01-09 22:33:51'),('b61ed937d1f34a2c89eef925946845a9','臭豆腐','湖南','黑色经典','斤',11,15,'小吃','2018-12-27 21:39:27'),('be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭','北京','112','只',112,170,'零食','2018-12-27 19:32:19');

/*Table structure for table `goodstype` */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `uuid` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `goodstype` */

insert  into `goodstype`(`uuid`,`name`) values (38,'零食'),(41,'nan');

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `text` varchar(20) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `module` */

insert  into `module`(`id`,`pid`,`text`,`icon`,`url`) values (1,-1,'基本信息',NULL,NULL),(2,-1,'人事管理',NULL,NULL),(3,-1,'采购管理',NULL,NULL),(4,-1,'销售管理',NULL,NULL),(5,-1,'库存管理',NULL,NULL),(6,-1,'统计分析',NULL,NULL),(7,-1,'权限分配',NULL,NULL),(8,1,'商品类型',NULL,'basicInfo/splx.jsp'),(9,1,'商品',NULL,'basicInfo/sp.jsp'),(10,1,'供应商',NULL,'basicInfo/supplier.jsp'),(11,1,'客户',NULL,'basicInfo/kh.jsp'),(12,1,'仓库',NULL,'basicInfo/store.jsp'),(13,2,'部门管理',NULL,'personnel/bmgl.jsp'),(14,2,'员工管理',NULL,'personnel/yggl.jsp'),(15,3,'采购申请',NULL,'purchasing/order.jsp'),(16,3,'采购订单查询',NULL,'purchasing/queryorder.jsp'),(17,3,'采购订单审核',NULL,'purchasing/queryorder1.jsp'),(18,3,'采购订单确认',NULL,'purchasing/queryorder2.jsp'),(21,4,'销售订单查询',NULL,'sale/orders.jsp'),(23,5,'库存查询',NULL,'warehouse/kc.jsp'),(24,5,'库存变动记录查询',NULL,'warehouse/storeoperLog.jsp'),(25,6,'销售统计表',NULL,'highcharts/ybtj.jsp'),(26,7,'角色权限设置',NULL,'sys/role.jsp'),(27,7,'用户角色设置',NULL,'sys/userRole.jsp'),(30,8,'商品类型增加',NULL,'goodStype/addGoodStype'),(31,8,'商品类型修改',NULL,'goodStype/editGoodStype'),(32,8,'商品类型删除',NULL,'goodStype/delGoodStype'),(34,9,'商品增加',NULL,'goods/addGoods'),(35,9,'商品修改',NULL,'goods/editGoods'),(36,9,'商品删除',NULL,'goods/delGoods'),(38,10,'供应商增加',NULL,'supplier/addSupplier'),(39,10,'供应商修改',NULL,'supplier/editSupplier'),(40,10,'供应商删除',NULL,'supplier/delSupplier'),(42,11,'客户增加',NULL,'supplier/addSupplier'),(43,11,'客户修改',NULL,'supplier/editSupplier'),(44,11,'客户删除',NULL,'supplier/delSupplier'),(46,12,'仓库增加',NULL,'store/addstore'),(47,12,'仓库修改',NULL,'store/editstore'),(48,12,'仓库删除',NULL,'store/delstore'),(49,13,'部门增加',NULL,'dep/addDep'),(51,13,'部门修改',NULL,'dep/editDep'),(52,13,'部门删除',NULL,'dep/delDep'),(54,14,'员工增加',NULL,'emp/addEmp'),(55,14,'员工修改',NULL,'emp/editEmp'),(56,14,'员工删除',NULL,'emp/delEmp'),(58,21,'录入销售订单',NULL,'order/addOrders'),(59,21,'销售订单出库',NULL,'order/updateorders'),(60,21,'销售退货申请',NULL,'order/Salesreturn'),(61,21,'退货申请审核',NULL,'order/Salesreturna');

/*Table structure for table `month` */

DROP TABLE IF EXISTS `month`;

CREATE TABLE `month` (
  `month` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `month` */

insert  into `month`(`month`) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `uuid` varchar(32) NOT NULL,
  `goodsuuid` varchar(32) DEFAULT NULL,
  `goodsname` varchar(32) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `ender` varchar(32) DEFAULT NULL,
  `storeuuid` varchar(32) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `ordersuuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`uuid`,`goodsuuid`,`goodsname`,`price`,`num`,`money`,`endtime`,`ender`,`storeuuid`,`state`,`ordersuuid`) values ('019e0eac592b4c14a7432d1061e4c13d','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'cdcb10979be3496bb960d041804c783d'),('0236dc6aae11487ba5a1435b31b32372','11ab204f21144d848731c556a891f35e','1',1,1,1,NULL,NULL,NULL,NULL,'9470a254bd54410fa92b96ec78c05667'),('05bd42397bc343a2957626763c3cd42b','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'2a483a735401488ca4934bbcdd2aa022'),('0e3a4ce4acf54f63a65bbc7f85cfa7a9','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'4c999873345d4a8eaa4d28dde03361a4'),('1','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,10,1700,'2019-01-07','admin','食品仓库','2','1'),('14f069627ac547359df83eef24e75b53','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'800cb058abc1478d8108dd65d1b0780f'),('1566efc93bfa4d3c8af57461d898527d','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,100,1500,'2019-01-09',NULL,NULL,'2','b2dffbc55f21447ead7b10d27d7a82d2'),('1d90e069d2bb456d910abd7764be7e9b','11ab204f21144d848731c556a891f35e','1',1,10,10,'2019-01-10',NULL,NULL,'2','bb41825fd07c4cc4be1fdf6da1bc1aa5'),('267cc425a9c448929e21325e6bf122fa','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,3,45,NULL,NULL,NULL,NULL,'4c999873345d4a8eaa4d28dde03361a4'),('38ed2382532b46eca74119d81246cdae','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'e41fbe3ef6224f76868e7acba3dac50c'),('404ac181ef4a4416a147560a530308cf','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'e41fbe3ef6224f76868e7acba3dac50c'),('4af54bd2ed3c4634ada0c583c44c6915','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,'2019-01-09',NULL,NULL,'2','b2dffbc55f21447ead7b10d27d7a82d2'),('4fe38b3f1d5d4fb7934825345cb22a8e','11ab204f21144d848731c556a891f35e','1',1,122,122,'2019-01-10',NULL,NULL,'2','d93f72aef10b4c0889e181f516f81c25'),('5bfb92fca87e45c286a24cb9ccffa219','07cc4f3eb50e47bbace28e82f529914b','kk',15,1,15,'2019-01-10',NULL,NULL,'2','a887e97f1c8c46bdae2841d1faf2d948'),('63d213a64825479daabb0bd1ae1a9179','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'da9b07fbf16948cfaeaf7ccbbf72de30'),('747ec1c85aa647f0b78fd6458a62f060','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'9470a254bd54410fa92b96ec78c05667'),('793d9e115f5f4353a1cef655072c1fb3','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'56d0c252b99b4de78901ad01f7d3c00c'),('93861ad89acc496289b11b02a1f675fc','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,200,3000,'2019-01-09',NULL,NULL,'2','47867edc3a274db6aa45eda13747360e'),('996080cb05c044c59a652f6ec9634f5f','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,'2019-01-10',NULL,NULL,'2','a887e97f1c8c46bdae2841d1faf2d948'),('a3c1da958c5f4bc5a99ed7a54a2444bc','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'2a483a735401488ca4934bbcdd2aa022'),('a416c7ddb86146cf8881a6545bea56da','07cc4f3eb50e47bbace28e82f529914b','kk',15,1,15,NULL,NULL,NULL,NULL,'2a483a735401488ca4934bbcdd2aa022'),('b362b02422284b018ad71e71a2daa19b','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'56d0c252b99b4de78901ad01f7d3c00c'),('b535c06411004021aaa208c2d5153ed1','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,'2019-01-10',NULL,NULL,'2','bb41825fd07c4cc4be1fdf6da1bc1aa5'),('c513d0b7097242e8be0c7de0170a35b7','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'37b8a5a972dc4e308f8c3ffd49acbe9f'),('c51f6b40136f4ef1b6a0235153c962c2','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'800cb058abc1478d8108dd65d1b0780f'),('d7a704946a584a908ab0588441e11e65','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,1,15,NULL,NULL,NULL,NULL,'bfe762a5ced0470b92e27691049b9b0f'),('dd6eef4166c545d0bc069262ab7e685e','11ab204f21144d848731c556a891f35e','1',1,1,1,NULL,NULL,NULL,NULL,'da9b07fbf16948cfaeaf7ccbbf72de30'),('ed875b6e69f3438e934d5d23201f6faf','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,NULL,NULL,NULL,NULL,'bfe762a5ced0470b92e27691049b9b0f'),('f6242b08775442bab7ac541b5682ac7d','11ab204f21144d848731c556a891f35e','1',1,1,1,NULL,NULL,NULL,NULL,'2a483a735401488ca4934bbcdd2aa022'),('fad5bb1f73474aa0bb9226203c2ea139','b61ed937d1f34a2c89eef925946845a9','臭豆腐',15,2,30,NULL,NULL,NULL,NULL,'662a7d002bc24cceb461f3047b287527'),('feffcca8f9eb452ab0ed6e5a7c43841d','be3f9f89ba0a455aaa2736a14c5aba9e','北京烤鸭',170,1,170,'2019-01-09',NULL,NULL,'2','3fceb3b04cb5442087d87ee2bc9b9c21');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `uuid` varchar(32) NOT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `checktime` timestamp NULL DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `checker` varchar(32) DEFAULT NULL,
  `starter` varchar(32) DEFAULT NULL,
  `ender` varchar(32) DEFAULT NULL,
  `supplieruuid` varchar(32) DEFAULT NULL,
  `totalmoney` float DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`uuid`,`createtime`,`checktime`,`starttime`,`endtime`,`type`,`creater`,`checker`,`starter`,`ender`,`supplieruuid`,`totalmoney`,`state`) values ('1','2019-01-07 00:00:00','2018-06-22 04:51:04','2019-01-07 00:00:00','2019-01-07 00:00:00','2','admin','admin','admin','admin','茶馆',1700,'6'),('2a483a735401488ca4934bbcdd2aa022','2019-01-10 15:02:16','2019-01-10 15:03:32','2019-01-10 15:03:39','2019-01-10 15:03:39','2','管理员','管理员','管理员','管理员','asd',201,'7'),('37b8a5a972dc4e308f8c3ffd49acbe9f','2019-01-08 18:18:07','2019-01-08 18:18:07','2019-01-08 18:18:07','2019-01-08 18:18:07','2','代号101','小A','小B','小B','2',200,'4'),('3fceb3b04cb5442087d87ee2bc9b9c21','2019-01-09 19:24:23','2019-01-10 09:47:55','2019-01-10 09:54:37','2019-01-10 09:54:37','1','管理员','管理员','管理员','管理员','全不得烤鸭厂',170,'3'),('47867edc3a274db6aa45eda13747360e','2019-01-09 10:03:02','2019-01-09 10:03:02','2019-01-09 10:03:02','2019-01-09 10:03:02','1','代号101','小A','小B','小B','全不得烤鸭厂',3000,'4'),('4c999873345d4a8eaa4d28dde03361a4','2019-01-08 17:18:36','2019-01-08 17:18:36','2019-01-08 17:18:36','2019-01-08 17:18:36','2','代号101','小A','小B','小B','2',200,'4'),('56d0c252b99b4de78901ad01f7d3c00c','2019-01-09 10:08:15','2019-01-09 10:08:15','2019-01-09 10:08:15','2019-01-09 10:08:15','2','代号101','小A','小B','小B','2',200,'7'),('662a7d002bc24cceb461f3047b287527','2019-01-09 21:10:16','2019-01-09 21:10:16','2019-01-09 21:10:16','2019-01-09 21:10:16','2','代号101','小A','小B','小B','12',30,'3'),('800cb058abc1478d8108dd65d1b0780f','2019-01-09 10:08:30','2019-01-09 10:08:30','2019-01-09 10:08:30','2019-01-09 10:08:30','2','代号101','小A','小B','小B','2',200,'7'),('9470a254bd54410fa92b96ec78c05667','2019-01-10 10:24:55',NULL,NULL,NULL,'2','管理员',NULL,NULL,NULL,'aa',16,'3'),('a887e97f1c8c46bdae2841d1faf2d948','2019-01-10 14:50:11','2019-01-10 14:52:51','2019-01-10 14:55:25','2019-01-10 14:55:25','1','秦海波','小王','管理员','管理员','黑色经典',185,'5'),('b2dffbc55f21447ead7b10d27d7a82d2','2019-01-09 10:01:56','2019-01-09 21:52:53','2019-01-09 10:01:56','2019-01-09 10:01:56','1','代号101','管理员','小B','小B','undefined',1670,'4'),('bb41825fd07c4cc4be1fdf6da1bc1aa5','2019-01-10 10:01:54','2019-01-10 10:02:05','2019-01-10 10:02:14','2019-01-10 10:02:14','1','管理员','管理员','管理员','管理员','黑色经典',25,'3'),('bfe762a5ced0470b92e27691049b9b0f','2019-01-09 20:14:44',NULL,'2019-01-09 20:17:47',NULL,'2','李文',NULL,'李文',NULL,'2',200,'4'),('cdcb10979be3496bb960d041804c783d','2019-01-07 23:14:13','2019-01-07 23:14:13','2019-01-07 23:14:13','2019-01-07 23:14:13','2','代号101','小A','小B','小B','2',200,'7'),('d93f72aef10b4c0889e181f516f81c25','2019-01-10 09:59:08','2019-01-10 09:59:47','2019-01-10 10:00:04','2019-01-10 10:00:04','1','管理员','管理员','管理员','管理员','黑色经典',122,'3'),('da9b07fbf16948cfaeaf7ccbbf72de30','2019-01-10 10:03:50','2019-01-10 10:03:56',NULL,NULL,'2','李文','李文',NULL,NULL,'undefined',171,'6'),('e07962195aa645d1809051f4c0c0078d','2019-01-07 23:13:40','2019-01-07 23:13:40','2019-01-07 23:13:40','2019-01-07 23:13:40','2','代号101','小A','小B','小B','2',200,'7'),('e41fbe3ef6224f76868e7acba3dac50c','2019-01-08 18:03:36','2019-01-08 18:03:36','2019-01-08 18:03:36','2019-01-08 18:03:36','2','代号101','小A','小B','小B','2',200,'4');

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `empuuid` varchar(30) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`uuid`,`name`,`address`,`empuuid`,`createdate`) values ('940adf66c2ee4836ac679e62f9dbe48d','衣服仓库','湖南','ck','2019-01-10 09:54:05'),('f87d27ba2bf54aa2aeea2607d7bc2779','食品仓库','湖南省','1','2018-12-27 14:27:38');

/*Table structure for table `storedetail` */

DROP TABLE IF EXISTS `storedetail`;

CREATE TABLE `storedetail` (
  `uuid` varchar(32) NOT NULL,
  `storeuuid` varchar(40) DEFAULT NULL,
  `goodsuuid` varchar(40) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `storedetail` */

insert  into `storedetail`(`uuid`,`storeuuid`,`goodsuuid`,`num`) values ('1','食品仓库','北京烤鸭',1006),('2','食品仓库','臭豆腐',401),('701dce9d23ac46fbb565fcc61a51c11e','衣服仓库','kk',1),('c9a0d975cbf04cf4af9b420bab76c469','衣服仓库','1',132);

/*Table structure for table `storeoper` */

DROP TABLE IF EXISTS `storeoper`;

CREATE TABLE `storeoper` (
  `uuid` varchar(32) NOT NULL,
  `empuuid` varchar(32) DEFAULT NULL,
  `opertime` timestamp NULL DEFAULT NULL,
  `storeuuid` varchar(32) DEFAULT NULL,
  `goodsuuid` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `storeoper` */

insert  into `storeoper`(`uuid`,`empuuid`,`opertime`,`storeuuid`,`goodsuuid`,`num`,`type`) values ('07fa64b683d94f4e9f82a1e5a3474cf8','管理员','2019-01-10 10:00:04','2','1',122,'1'),('08a7db3587734deb8b53ab94e6002348','admin','2019-01-09 20:17:47','食品仓库','臭豆腐',1,'2'),('1','admin','2019-01-04 20:58:03','食品仓库','北京烤鸭',2000,'1'),('19a52b781cb342cabf589361f66445b0','管理员','2019-01-10 09:48:11','2','北京烤鸭',1,'1'),('235eba92fc004534b57738368382b9fa','admin','2019-01-09 20:15:06','食品仓库','北京烤鸭',1,'2'),('272f67bb5fba4ec697b652013bcd58d5','管理员','2019-01-10 09:47:23','2','北京烤鸭',1,'1'),('283ac6974b61476d8154f4b1a64db552','管理员','2019-01-10 15:03:39','食品仓库','kk',1,'3'),('2969ff2c4b0c437c88d35ac3125ba90d','管理员','2019-01-10 15:03:39','食品仓库','臭豆腐',1,'3'),('2a74dd0a6e6c4b8c9a8589bfb4dcb998','aa','2019-01-09 10:30:07','2','臭豆腐',200,'1'),('2aaf3528e5f8403f9ccd027fd92887ad','admin','2019-01-08 00:00:00','食品仓库','臭豆腐',3,'3'),('2e50075524d9412d8d03d71835f257bc','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'2'),('31a8b71a04804e349a553d5e21f2f1b8','管理员','2019-01-10 15:02:53','食品仓库','1',1,'2'),('332cad7b58b2447f859a6a0c1753856d','admin','2019-01-09 10:13:59','食品仓库','北京烤鸭',1,'3'),('37282585e5fe45cf84e975a17b233745','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'3'),('374a22c6e8a548969e6e8420d437bc71','admin','2019-01-09 10:14:01','食品仓库','臭豆腐',1,'3'),('38ef1321f01841ab9d001c4941332070','admin','2019-01-09 10:13:44','食品仓库','臭豆腐',1,'2'),('3e9f5d4c63184e399048ebfab531e9a8','管理员','2019-01-10 15:02:53','食品仓库','北京烤鸭',1,'2'),('44eb471560aa4122a8f0e8ed6528bac3','管理员','2019-01-10 14:55:25','2','北京烤鸭',1,'1'),('46865a7924324b4ba40a2141608e5ef2','admin','2019-01-08 00:00:00','食品仓库','臭豆腐',3,'2'),('4856fc6368af4508aebd23c275eb32c0','管理员','2019-01-10 15:03:39','食品仓库','1',1,'3'),('4b101d857cc04504bc21fd159f42adce','admin','2019-01-09 10:13:44','食品仓库','北京烤鸭',1,'2'),('4e855dfff7844ff89f1fba9dbe5b875f','aa','2019-01-09 10:05:19','2','臭豆腐',200,'1'),('5654d0315afa4a4dac4d340d2ea5a946','aa','2019-01-09 19:25:44','2','北京烤鸭',1,'1'),('584eb87b02ab4c8f84cc2eb57fc2f447','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'2'),('5899653982714e54b5dbc473dc585fa8','admin','2019-01-08 18:49:48','食品仓库','臭豆腐',3,'3'),('5efad08f68e44e41ae89668fa43f8191','admin','2019-01-08 00:00:00','食品仓库','臭豆腐',1,'2'),('6ac342d8c25a4a4fa18855efba52676c','admin','2019-01-08 19:52:25','食品仓库','北京烤鸭',1,'2'),('727a0c2e9a4544798cdcaf42064430cb','admin','2019-01-09 20:15:46','食品仓库','臭豆腐',1,'2'),('7b59c8298fa440c88b1dfcbdea6b45e5','admin','2019-01-09 10:13:59','食品仓库','臭豆腐',1,'3'),('7dccefc47c4e4cb28ac82c1511beb392','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'3'),('7e16c24d564a4020aa06d211269d7ad6','admin','2019-01-08 19:19:29','食品仓库','北京烤鸭',1,'3'),('87c085cf3da94c838213bf46eff49def','管理员','2019-01-10 10:02:14','2','1',10,'1'),('8ad0d1ea02094031a5f381a48056cb61','管理员','2019-01-10 15:02:53','食品仓库','kk',1,'2'),('8bd897bc041a4320be4511d21f902465','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'2'),('8c7a3f78189041389ab144d549416b3a','admin','2019-01-09 20:15:06','食品仓库','臭豆腐',1,'2'),('8da0ba74cdaa4ccb8f5334135baacebd','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'3'),('8dd59c6ce01d41c591bf71dc4c70724e','admin','2019-01-09 20:15:46','食品仓库','北京烤鸭',1,'2'),('93044a28f0a44bba86d629fbcbbb6182','aa','2019-01-09 10:28:53','2','北京烤鸭',1,'1'),('95b2849ff0524a8a940272c731e1ef07','admin','2019-01-08 19:52:25','食品仓库','臭豆腐',3,'2'),('9dbace7ae5e14cf68ccc8eb6154bc0e5','admin','2019-01-08 00:00:00','食品仓库','臭豆腐',3,'3'),('a0e8ac3e8de649a8a932c6f90cfaec63','管理员','2019-01-10 10:02:14','2','臭豆腐',1,'1'),('a3f0a887e34d4c1da600861c88d0ed22','管理员','2019-01-10 14:55:25','2','kk',1,'1'),('a43ea79cc3804cbb81f6a1bd685df955','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'3'),('c42b5bb0630343f5b0e119018bfbc91f','admin','2019-01-08 00:00:00','食品仓库','北京烤鸭',1,'3'),('c94e385c0f16429d9481a88046562a8c','admin','2019-01-09 10:14:01','食品仓库','北京烤鸭',1,'3'),('d7313e60d9db467e955f864132fa7a84','admin','2019-01-08 18:49:48','食品仓库','北京烤鸭',1,'3'),('d8a0f490efbb4bac8de80a1c8df1afe0','管理员','2019-01-10 15:02:53','食品仓库','臭豆腐',1,'2'),('db99c143c8a5482eb7b0f8b3bc7416d7','管理员','2019-01-10 15:03:39','食品仓库','北京烤鸭',1,'3'),('e85d1e72c4cc4039aa098367ba0e5aea','管理员','2019-01-10 08:55:14','2','北京烤鸭',1,'1'),('e8cf9b36acfd4d5888e540ff34cbc1be','管理员','2019-01-10 09:54:37','2','北京烤鸭',1,'1'),('ea8729586ae04ad5a3e5a30c82893db1','aa','2019-01-09 10:28:53','2','臭豆腐',100,'1'),('f1389d6df554458f97906aad13e6c5ab','admin','2019-01-09 20:17:47','食品仓库','北京烤鸭',1,'2'),('fc156f9bba5e40499c3c7c9e70446e2d','admin','2019-01-08 00:00:00','食品仓库','臭豆腐',3,'3');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `tele` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`uuid`,`name`,`address`,`contact`,`tele`,`email`,`type`,`createdate`) values ('39eac960bee044f7be3ff97f79be7fba','ted','fdg','asd','852','74','客户','2019-01-10 15:01:53'),('ed5cf408335840c28870b86bf907e9a4','112','112','112','11','11','供应商','2018-12-27 21:09:04'),('f45c8e88dd31448b8da91d0360114c8b','黑色经典','王府路','小王','15879456549','xiaowan@qq.com','供应商','2018-12-27 21:32:40');

/*Table structure for table `t_sys_permission` */

DROP TABLE IF EXISTS `t_sys_permission`;

CREATE TABLE `t_sys_permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `pername` varchar(100) NOT NULL COMMENT '权限名称',
  `pid` int(11) DEFAULT NULL COMMENT '父编号',
  `permission` varchar(100) NOT NULL COMMENT '权限字符串：例如：system:user:create:1',
  PRIMARY KEY (`perid`)
) ENGINE=InnoDB AUTO_INCREMENT=110104 DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_permission` */

insert  into `t_sys_permission`(`perid`,`pername`,`pid`,`permission`) values (10,'书本管理',-1,''),(11,'系统管理',-1,''),(1001,'书本管理',10,'bookmanager:book:*'),(1002,'订单管理',10,'bookmanager:order:*'),(1101,'用户管理',11,'system:user:*'),(100101,'书本查询',1001,'bookmanager:book:query'),(100102,'书本新增',1001,'bookmanager:book:add'),(100103,'书本修改',1001,'bookmanager:book:edit'),(100104,'书本删除',1001,'bookmanager:book:del'),(110101,'用户查询',1101,'system:user:query'),(110102,'用户新增',1101,'system:user:add'),(110103,'用户修改',1101,'system:user:edit');

/*Table structure for table `t_sys_role` */

DROP TABLE IF EXISTS `t_sys_role`;

CREATE TABLE `t_sys_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID,主键',
  `rolename` varchar(100) NOT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_role` */

insert  into `t_sys_role`(`roleid`,`rolename`,`description`) values (1,'管理员',NULL),(8,'采购员',NULL),(9,'销售员',NULL),(10,'采购经理',NULL),(11,'销售经理',NULL),(12,'总经理',NULL),(13,'库管员',NULL);

/*Table structure for table `t_sys_role_permission` */

DROP TABLE IF EXISTS `t_sys_role_permission`;

CREATE TABLE `t_sys_role_permission` (
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  `perid` int(11) NOT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_role_permission` */

insert  into `t_sys_role_permission`(`roleid`,`perid`) values (1,1),(1,8),(1,30),(1,31),(1,32),(1,9),(1,34),(1,35),(1,36),(1,10),(1,38),(1,39),(1,40),(1,11),(1,42),(1,43),(1,44),(1,12),(1,46),(1,47),(1,48),(1,2),(1,13),(1,49),(1,51),(1,52),(1,14),(1,54),(1,55),(1,56),(1,3),(1,15),(1,16),(1,17),(1,18),(1,4),(1,21),(1,58),(1,59),(1,60),(1,61),(1,5),(1,23),(1,24),(1,6),(1,25),(1,7),(1,26),(1,27),(11,4),(11,21),(11,61),(11,5),(11,23),(11,24),(8,3),(8,15),(8,16),(8,5),(8,23),(10,3),(10,16),(10,17),(10,5),(10,23),(10,24),(13,3),(13,18),(13,4),(13,21),(13,59),(13,5),(13,23),(13,24),(9,4),(9,21),(9,58),(9,60),(9,5),(9,23);

/*Table structure for table `t_sys_user_role` */

DROP TABLE IF EXISTS `t_sys_user_role`;

CREATE TABLE `t_sys_user_role` (
  `urid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `userid` varchar(32) NOT NULL COMMENT '用户ID',
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_user_role` */

insert  into `t_sys_user_role`(`urid`,`userid`,`roleid`) values (2,'2',2),(6,'effbf67b8bbe49da83c66a799b9b0d96',1),(9,'bccfc19fd6a9472593305c84e285e8b0',9),(10,'258564e39c0b489cbb1941a750ed46bd',10),(12,'ab784754f21e4587b3843cf157575dc8',8),(13,'c0d7f87dc34d416d997bd4148b8c7a67',11),(14,'bc7c5f25241f423eaa2b5669d2440120',13);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
