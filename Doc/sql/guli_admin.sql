/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.22-log : Database - guli_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guli_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `guli_admin`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values 
('guliScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai'),
('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values 
('guliScheduler','TASK_1','DEFAULT',NULL,'com.atguigu.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.atguigu.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0k���xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),
('RenrenScheduler','TASK_1','DEFAULT',NULL,'com.atguigu.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.atguigu.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0k���xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('RenrenScheduler','STATE_ACCESS'),
('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('guliScheduler','DESKTOP-G0LDITS1564022533118',1564130467969,15000),
('RenrenScheduler','DESKTOP-G0LDITS1562576376372',1562592385551,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values 
('guliScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1564131600000,1564129800000,5,'WAITING','CRON',1562592416000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.atguigu.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0k���xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),
('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1562592600000,1562590800000,5,'WAITING','CRON',1562214590000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\00com.atguigu.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0k���xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values 
(1,'testTask','renren','0 0/30 * * * ?',0,'参数测试','2019-06-27 12:02:51');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`params`,`status`,`error`,`times`,`create_time`) values 
(1,1,'testTask','renren',0,NULL,0,'2019-07-04 14:00:00'),
(2,1,'testTask','renren',0,NULL,1,'2019-07-08 17:30:00'),
(3,1,'testTask','renren',0,NULL,1,'2019-07-08 18:00:00'),
(4,1,'testTask','renren',0,NULL,1,'2019-07-08 18:30:00'),
(5,1,'testTask','renren',0,NULL,1,'2019-07-08 19:00:00'),
(6,1,'testTask','renren',0,NULL,0,'2019-07-08 19:30:00'),
(7,1,'testTask','renren',0,NULL,1,'2019-07-08 20:00:00'),
(8,1,'testTask','renren',0,NULL,0,'2019-07-08 20:30:00'),
(9,1,'testTask','renren',0,NULL,0,'2019-07-08 21:00:00'),
(10,1,'testTask','renren',0,NULL,1,'2019-07-08 21:30:00'),
(11,1,'testTask','renren',0,NULL,1,'2019-07-08 22:00:00'),
(12,1,'testTask','renren',0,NULL,1,'2019-07-08 22:30:00'),
(13,1,'testTask','renren',0,NULL,1,'2019-07-08 23:00:00'),
(14,1,'testTask','renren',0,NULL,1,'2019-07-08 23:30:00'),
(15,1,'testTask','renren',0,NULL,22,'2019-07-09 00:00:00'),
(16,1,'testTask','renren',0,NULL,0,'2019-07-11 21:30:00'),
(17,1,'testTask','renren',0,NULL,1,'2019-07-11 22:00:00'),
(18,1,'testTask','renren',0,NULL,0,'2019-07-11 22:30:00'),
(19,1,'testTask','renren',0,NULL,0,'2019-07-11 23:00:00'),
(20,1,'testTask','renren',0,NULL,1,'2019-07-11 23:30:00'),
(21,1,'testTask','renren',0,NULL,6,'2019-07-12 00:00:00'),
(22,1,'testTask','renren',0,NULL,1,'2019-07-12 00:30:00'),
(23,1,'testTask','renren',0,NULL,1,'2019-07-12 01:00:00'),
(24,1,'testTask','renren',0,NULL,0,'2019-07-12 01:30:00'),
(25,1,'testTask','renren',0,NULL,1,'2019-07-12 02:00:00'),
(26,1,'testTask','renren',0,NULL,0,'2019-07-12 02:30:00'),
(27,1,'testTask','renren',0,NULL,0,'2019-07-12 03:00:00'),
(28,1,'testTask','renren',0,NULL,1,'2019-07-12 03:30:00'),
(29,1,'testTask','renren',0,NULL,0,'2019-07-12 04:00:00'),
(30,1,'testTask','renren',0,NULL,1,'2019-07-12 04:30:00'),
(31,1,'testTask','renren',0,NULL,1,'2019-07-12 05:00:00'),
(32,1,'testTask','renren',0,NULL,1,'2019-07-12 05:30:00'),
(33,1,'testTask','renren',0,NULL,1,'2019-07-12 06:00:00'),
(34,1,'testTask','renren',0,NULL,0,'2019-07-12 06:30:00'),
(35,1,'testTask','renren',0,NULL,1,'2019-07-12 07:00:00'),
(36,1,'testTask','renren',0,NULL,1,'2019-07-12 07:30:00'),
(37,1,'testTask','renren',0,NULL,1,'2019-07-12 08:00:00'),
(38,1,'testTask','renren',0,NULL,1,'2019-07-12 08:30:00'),
(39,1,'testTask','renren',0,NULL,0,'2019-07-12 09:00:00'),
(40,1,'testTask','renren',0,NULL,1,'2019-07-12 09:30:00'),
(41,1,'testTask','renren',0,NULL,0,'2019-07-12 10:00:00'),
(42,1,'testTask','renren',0,NULL,8,'2019-07-12 10:30:00'),
(43,1,'testTask','renren',0,NULL,2,'2019-07-12 11:00:00'),
(44,1,'testTask','renren',0,NULL,1,'2019-07-12 11:30:00'),
(45,1,'testTask','renren',0,NULL,4,'2019-07-12 12:00:00'),
(46,1,'testTask','renren',0,NULL,1,'2019-07-12 12:30:00'),
(47,1,'testTask','renren',0,NULL,2,'2019-07-12 13:00:00'),
(48,1,'testTask','renren',0,NULL,1,'2019-07-13 00:30:00'),
(49,1,'testTask','renren',0,NULL,1,'2019-07-13 01:00:00'),
(50,1,'testTask','renren',0,NULL,2,'2019-07-13 01:30:00'),
(51,1,'testTask','renren',0,NULL,1,'2019-07-13 02:00:00'),
(52,1,'testTask','renren',0,NULL,1,'2019-07-13 02:30:00'),
(53,1,'testTask','renren',0,NULL,1,'2019-07-15 01:00:00'),
(54,1,'testTask','renren',0,NULL,1,'2019-07-15 01:30:00'),
(55,1,'testTask','renren',0,NULL,0,'2019-07-15 02:00:00'),
(56,1,'testTask','renren',0,NULL,1,'2019-07-15 02:30:00'),
(57,1,'testTask','renren',0,NULL,1,'2019-07-15 03:00:00'),
(58,1,'testTask','renren',0,NULL,1,'2019-07-15 03:30:00'),
(59,1,'testTask','renren',0,NULL,1,'2019-07-15 04:00:00'),
(60,1,'testTask','renren',0,NULL,0,'2019-07-15 04:30:00'),
(61,1,'testTask','renren',0,NULL,1,'2019-07-15 05:00:00'),
(62,1,'testTask','renren',0,NULL,1,'2019-07-15 05:30:00'),
(63,1,'testTask','renren',0,NULL,0,'2019-07-15 06:00:00'),
(64,1,'testTask','renren',0,NULL,1,'2019-07-15 06:30:00'),
(65,1,'testTask','renren',0,NULL,1,'2019-07-15 07:00:00'),
(66,1,'testTask','renren',0,NULL,0,'2019-07-15 07:30:00'),
(67,1,'testTask','renren',0,NULL,1,'2019-07-15 08:00:00'),
(68,1,'testTask','renren',0,NULL,1,'2019-07-15 08:30:00'),
(69,1,'testTask','renren',0,NULL,15,'2019-07-15 09:00:00'),
(70,1,'testTask','renren',0,NULL,4,'2019-07-15 09:30:00'),
(71,1,'testTask','renren',0,NULL,3,'2019-07-15 10:00:00'),
(72,1,'testTask','renren',0,NULL,2,'2019-07-15 10:30:00'),
(73,1,'testTask','renren',0,NULL,3,'2019-07-15 11:00:00'),
(74,1,'testTask','renren',0,NULL,2,'2019-07-15 11:30:00'),
(75,1,'testTask','renren',0,NULL,3,'2019-07-15 12:00:00'),
(76,1,'testTask','renren',0,NULL,5,'2019-07-15 12:30:00'),
(77,1,'testTask','renren',0,NULL,2,'2019-07-15 13:00:00'),
(78,1,'testTask','renren',0,NULL,2,'2019-07-15 13:30:00'),
(79,1,'testTask','renren',0,NULL,2,'2019-07-15 14:00:00'),
(80,1,'testTask','renren',0,NULL,1,'2019-07-15 14:30:00'),
(81,1,'testTask','renren',0,NULL,0,'2019-07-15 15:00:00'),
(82,1,'testTask','renren',0,NULL,1,'2019-07-15 15:30:00'),
(83,1,'testTask','renren',0,NULL,2,'2019-07-15 16:00:00'),
(84,1,'testTask','renren',0,NULL,1,'2019-07-15 16:30:00'),
(85,1,'testTask','renren',0,NULL,1,'2019-07-15 17:00:00'),
(86,1,'testTask','renren',0,NULL,1,'2019-07-15 17:30:00'),
(87,1,'testTask','renren',0,NULL,0,'2019-07-15 18:00:00'),
(88,1,'testTask','renren',0,NULL,1,'2019-07-15 18:30:00'),
(89,1,'testTask','renren',0,NULL,1,'2019-07-15 19:00:00'),
(90,1,'testTask','renren',0,NULL,1,'2019-07-15 19:30:00'),
(91,1,'testTask','renren',0,NULL,2,'2019-07-15 20:00:00'),
(92,1,'testTask','renren',0,NULL,1,'2019-07-15 20:30:00'),
(93,1,'testTask','renren',0,NULL,1,'2019-07-15 21:00:00'),
(94,1,'testTask','renren',0,NULL,1,'2019-07-15 21:30:00'),
(95,1,'testTask','renren',0,NULL,1,'2019-07-15 22:00:00'),
(96,1,'testTask','renren',0,NULL,0,'2019-07-15 22:30:00'),
(97,1,'testTask','renren',0,NULL,1,'2019-07-15 23:00:00'),
(98,1,'testTask','renren',0,NULL,1,'2019-07-15 23:30:00'),
(99,1,'testTask','renren',0,NULL,1,'2019-07-16 23:30:00'),
(100,1,'testTask','renren',0,NULL,4,'2019-07-17 00:00:00'),
(101,1,'testTask','renren',0,NULL,0,'2019-07-17 00:30:00'),
(102,1,'testTask','renren',0,NULL,1,'2019-07-17 01:00:00'),
(103,1,'testTask','renren',0,NULL,1,'2019-07-17 01:30:00'),
(104,1,'testTask','renren',0,NULL,1,'2019-07-17 02:00:00'),
(105,1,'testTask','renren',0,NULL,1,'2019-07-17 02:30:00'),
(106,1,'testTask','renren',0,NULL,1,'2019-07-17 03:00:00'),
(107,1,'testTask','renren',0,NULL,1,'2019-07-17 03:30:00'),
(108,1,'testTask','renren',0,NULL,0,'2019-07-17 04:00:00'),
(109,1,'testTask','renren',0,NULL,1,'2019-07-17 04:30:00'),
(110,1,'testTask','renren',0,NULL,1,'2019-07-17 05:00:00'),
(111,1,'testTask','renren',0,NULL,1,'2019-07-17 05:30:00'),
(112,1,'testTask','renren',0,NULL,1,'2019-07-17 06:00:00'),
(113,1,'testTask','renren',0,NULL,1,'2019-07-17 06:30:00'),
(114,1,'testTask','renren',0,NULL,1,'2019-07-17 07:00:00'),
(115,1,'testTask','renren',0,NULL,1,'2019-07-17 07:30:00'),
(116,1,'testTask','renren',0,NULL,1,'2019-07-17 08:00:00'),
(117,1,'testTask','renren',0,NULL,0,'2019-07-17 08:30:00'),
(118,1,'testTask','renren',0,NULL,1,'2019-07-17 09:00:00'),
(119,1,'testTask','renren',0,NULL,1,'2019-07-17 09:30:00'),
(120,1,'testTask','renren',0,NULL,1,'2019-07-17 10:00:00'),
(121,1,'testTask','renren',0,NULL,1,'2019-07-17 10:30:00'),
(122,1,'testTask','renren',0,NULL,1,'2019-07-17 11:00:00'),
(123,1,'testTask','renren',0,NULL,0,'2019-07-17 11:30:00'),
(124,1,'testTask','renren',0,NULL,1,'2019-07-17 12:00:00'),
(125,1,'testTask','renren',0,NULL,1,'2019-07-17 12:30:00'),
(126,1,'testTask','renren',0,NULL,1,'2019-07-17 13:00:00'),
(127,1,'testTask','renren',0,NULL,1,'2019-07-17 13:30:00'),
(128,1,'testTask','renren',0,NULL,0,'2019-07-17 14:00:00'),
(129,1,'testTask','renren',0,NULL,1,'2019-07-17 14:30:00'),
(130,1,'testTask','renren',0,NULL,1,'2019-07-17 15:00:00'),
(131,1,'testTask','renren',0,NULL,0,'2019-07-17 15:30:00'),
(132,1,'testTask','renren',0,NULL,1,'2019-07-17 16:00:00'),
(133,1,'testTask','renren',0,NULL,0,'2019-07-17 16:30:00'),
(134,1,'testTask','renren',0,NULL,1,'2019-07-17 17:00:00'),
(135,1,'testTask','renren',0,NULL,0,'2019-07-17 17:30:00'),
(136,1,'testTask','renren',0,NULL,1,'2019-07-17 18:00:00'),
(137,1,'testTask','renren',0,NULL,1,'2019-07-17 18:30:00'),
(138,1,'testTask','renren',0,NULL,1,'2019-07-17 19:00:00'),
(139,1,'testTask','renren',0,NULL,0,'2019-07-17 19:30:00'),
(140,1,'testTask','renren',0,NULL,0,'2019-07-17 20:00:00'),
(141,1,'testTask','renren',0,NULL,0,'2019-07-17 20:30:00'),
(142,1,'testTask','renren',0,NULL,1,'2019-07-17 21:00:00'),
(143,1,'testTask','renren',0,NULL,1,'2019-07-17 21:30:00'),
(144,1,'testTask','renren',0,NULL,0,'2019-07-17 22:00:00'),
(145,1,'testTask','renren',0,NULL,1,'2019-07-17 22:30:00'),
(146,1,'testTask','renren',0,NULL,0,'2019-07-17 23:00:00'),
(147,1,'testTask','renren',0,NULL,0,'2019-07-17 23:30:00'),
(148,1,'testTask','renren',0,NULL,12,'2019-07-18 00:00:00'),
(149,1,'testTask','renren',0,NULL,0,'2019-07-18 00:30:00'),
(150,1,'testTask','renren',0,NULL,1,'2019-07-18 01:00:00'),
(151,1,'testTask','renren',0,NULL,0,'2019-07-18 01:30:00'),
(152,1,'testTask','renren',0,NULL,1,'2019-07-18 02:00:00'),
(153,1,'testTask','renren',0,NULL,0,'2019-07-18 02:30:00'),
(154,1,'testTask','renren',0,NULL,0,'2019-07-18 03:00:00'),
(155,1,'testTask','renren',0,NULL,0,'2019-07-18 03:30:00'),
(156,1,'testTask','renren',0,NULL,1,'2019-07-18 04:00:00'),
(157,1,'testTask','renren',0,NULL,1,'2019-07-18 04:30:00'),
(158,1,'testTask','renren',0,NULL,0,'2019-07-18 05:00:00'),
(159,1,'testTask','renren',0,NULL,0,'2019-07-18 05:30:00'),
(160,1,'testTask','renren',0,NULL,1,'2019-07-18 06:00:00'),
(161,1,'testTask','renren',0,NULL,1,'2019-07-18 06:30:00'),
(162,1,'testTask','renren',0,NULL,1,'2019-07-18 07:00:00'),
(163,1,'testTask','renren',0,NULL,1,'2019-07-18 07:30:00'),
(164,1,'testTask','renren',0,NULL,0,'2019-07-18 08:00:00'),
(165,1,'testTask','renren',0,NULL,0,'2019-07-18 08:30:00'),
(166,1,'testTask','renren',0,NULL,0,'2019-07-18 09:00:00'),
(167,1,'testTask','renren',0,NULL,1,'2019-07-18 09:30:00'),
(168,1,'testTask','renren',0,NULL,0,'2019-07-18 10:00:00'),
(169,1,'testTask','renren',0,NULL,0,'2019-07-18 10:30:00'),
(170,1,'testTask','renren',0,NULL,0,'2019-07-18 11:00:00'),
(171,1,'testTask','renren',0,NULL,1,'2019-07-18 11:30:00'),
(172,1,'testTask','renren',0,NULL,0,'2019-07-18 12:00:00'),
(173,1,'testTask','renren',0,NULL,1,'2019-07-18 12:30:00'),
(174,1,'testTask','renren',0,NULL,1,'2019-07-18 13:00:00'),
(175,1,'testTask','renren',0,NULL,0,'2019-07-18 13:30:00'),
(176,1,'testTask','renren',0,NULL,0,'2019-07-18 14:00:00'),
(177,1,'testTask','renren',0,NULL,0,'2019-07-18 14:30:00'),
(178,1,'testTask','renren',0,NULL,1,'2019-07-18 15:00:00'),
(179,1,'testTask','renren',0,NULL,0,'2019-07-18 15:30:00'),
(180,1,'testTask','renren',0,NULL,0,'2019-07-18 16:00:00'),
(181,1,'testTask','renren',0,NULL,0,'2019-07-18 16:30:00'),
(182,1,'testTask','renren',0,NULL,0,'2019-07-18 17:00:00'),
(183,1,'testTask','renren',0,NULL,1,'2019-07-18 17:30:00'),
(184,1,'testTask','renren',0,NULL,1,'2019-07-18 18:00:00'),
(185,1,'testTask','renren',0,NULL,1,'2019-07-18 18:30:00'),
(186,1,'testTask','renren',0,NULL,1,'2019-07-18 19:00:00'),
(187,1,'testTask','renren',0,NULL,1,'2019-07-18 19:30:00'),
(188,1,'testTask','renren',0,NULL,0,'2019-07-18 20:00:00'),
(189,1,'testTask','renren',0,NULL,1,'2019-07-18 20:30:00'),
(190,1,'testTask','renren',0,NULL,0,'2019-07-18 21:00:00'),
(191,1,'testTask','renren',0,NULL,0,'2019-07-18 21:30:00'),
(192,1,'testTask','renren',0,NULL,0,'2019-07-18 22:00:00'),
(193,1,'testTask','renren',0,NULL,0,'2019-07-18 22:30:00'),
(194,1,'testTask','renren',0,NULL,0,'2019-07-18 23:00:00'),
(195,1,'testTask','renren',0,NULL,0,'2019-07-18 23:30:00'),
(196,1,'testTask','renren',0,NULL,4,'2019-07-19 00:00:00'),
(197,1,'testTask','renren',0,NULL,1,'2019-07-19 00:30:00'),
(198,1,'testTask','renren',0,NULL,1,'2019-07-19 01:00:00'),
(199,1,'testTask','renren',0,NULL,1,'2019-07-19 01:30:00'),
(200,1,'testTask','renren',0,NULL,1,'2019-07-19 02:00:00'),
(201,1,'testTask','renren',0,NULL,1,'2019-07-19 02:30:00'),
(202,1,'testTask','renren',0,NULL,1,'2019-07-19 03:00:00'),
(203,1,'testTask','renren',0,NULL,1,'2019-07-19 03:30:00'),
(204,1,'testTask','renren',0,NULL,1,'2019-07-19 04:00:00'),
(205,1,'testTask','renren',0,NULL,0,'2019-07-19 04:30:00'),
(206,1,'testTask','renren',0,NULL,1,'2019-07-19 05:00:00'),
(207,1,'testTask','renren',0,NULL,0,'2019-07-19 05:30:00'),
(208,1,'testTask','renren',0,NULL,1,'2019-07-19 06:00:00'),
(209,1,'testTask','renren',0,NULL,0,'2019-07-19 06:30:00'),
(210,1,'testTask','renren',0,NULL,0,'2019-07-19 07:00:00'),
(211,1,'testTask','renren',0,NULL,1,'2019-07-19 07:30:00'),
(212,1,'testTask','renren',0,NULL,0,'2019-07-19 08:00:00'),
(213,1,'testTask','renren',0,NULL,1,'2019-07-19 08:30:00'),
(214,1,'testTask','renren',0,NULL,1,'2019-07-19 09:00:00'),
(215,1,'testTask','renren',0,NULL,1,'2019-07-19 09:30:00'),
(216,1,'testTask','renren',0,NULL,1,'2019-07-19 10:00:00'),
(217,1,'testTask','renren',0,NULL,1,'2019-07-19 10:30:00'),
(218,1,'testTask','renren',0,NULL,1,'2019-07-19 11:00:00'),
(219,1,'testTask','renren',0,NULL,1,'2019-07-19 11:30:00'),
(220,1,'testTask','renren',0,NULL,1,'2019-07-19 12:00:00'),
(221,1,'testTask','renren',0,NULL,0,'2019-07-19 12:30:00'),
(222,1,'testTask','renren',0,NULL,0,'2019-07-19 13:00:00'),
(223,1,'testTask','renren',0,NULL,0,'2019-07-19 13:30:00'),
(224,1,'testTask','renren',0,NULL,1,'2019-07-19 14:00:00'),
(225,1,'testTask','renren',0,NULL,1,'2019-07-19 14:30:00'),
(226,1,'testTask','renren',0,NULL,1,'2019-07-19 15:00:00'),
(227,1,'testTask','renren',0,NULL,1,'2019-07-19 15:30:00'),
(228,1,'testTask','renren',0,NULL,1,'2019-07-19 16:00:00'),
(229,1,'testTask','renren',0,NULL,0,'2019-07-19 16:30:00'),
(230,1,'testTask','renren',0,NULL,4,'2019-07-19 17:00:00'),
(231,1,'testTask','renren',0,NULL,1,'2019-07-19 17:30:00'),
(232,1,'testTask','renren',0,NULL,0,'2019-07-19 18:00:00'),
(233,1,'testTask','renren',0,NULL,1,'2019-07-19 18:30:00'),
(234,1,'testTask','renren',0,NULL,1,'2019-07-19 19:00:00'),
(235,1,'testTask','renren',0,NULL,1,'2019-07-19 19:30:00'),
(236,1,'testTask','renren',0,NULL,1,'2019-07-19 20:00:00'),
(237,1,'testTask','renren',0,NULL,2,'2019-07-19 20:30:00'),
(238,1,'testTask','renren',0,NULL,1,'2019-07-19 21:00:00'),
(239,1,'testTask','renren',0,NULL,0,'2019-07-19 21:30:00'),
(240,1,'testTask','renren',0,NULL,1,'2019-07-19 22:00:00'),
(241,1,'testTask','renren',0,NULL,1,'2019-07-19 22:30:00'),
(242,1,'testTask','renren',0,NULL,1,'2019-07-19 23:00:00'),
(243,1,'testTask','renren',0,NULL,0,'2019-07-19 23:30:00'),
(244,1,'testTask','renren',0,NULL,58,'2019-07-20 00:00:00'),
(245,1,'testTask','renren',0,NULL,0,'2019-07-20 00:30:00'),
(246,1,'testTask','renren',0,NULL,1,'2019-07-20 01:00:00'),
(247,1,'testTask','renren',0,NULL,1,'2019-07-20 11:30:00'),
(248,1,'testTask','renren',0,NULL,1,'2019-07-20 12:00:00'),
(249,1,'testTask','renren',0,NULL,1,'2019-07-20 12:30:00'),
(250,1,'testTask','renren',0,NULL,1,'2019-07-20 13:00:00'),
(251,1,'testTask','renren',0,NULL,1,'2019-07-20 13:30:00'),
(252,1,'testTask','renren',0,NULL,0,'2019-07-20 14:00:00'),
(253,1,'testTask','renren',0,NULL,1,'2019-07-20 14:30:00'),
(254,1,'testTask','renren',0,NULL,1,'2019-07-20 15:00:00'),
(255,1,'testTask','renren',0,NULL,2,'2019-07-20 15:30:00'),
(256,1,'testTask','renren',0,NULL,0,'2019-07-20 16:00:00'),
(257,1,'testTask','renren',0,NULL,1,'2019-07-20 16:30:00'),
(258,1,'testTask','renren',0,NULL,0,'2019-07-20 17:00:00'),
(259,1,'testTask','renren',0,NULL,1,'2019-07-20 17:30:00'),
(260,1,'testTask','renren',0,NULL,0,'2019-07-20 18:00:00'),
(261,1,'testTask','renren',0,NULL,1,'2019-07-20 18:30:00'),
(262,1,'testTask','renren',0,NULL,1,'2019-07-20 19:00:00'),
(263,1,'testTask','renren',0,NULL,0,'2019-07-20 19:30:00'),
(264,1,'testTask','renren',0,NULL,1,'2019-07-20 20:00:00'),
(265,1,'testTask','renren',0,NULL,2,'2019-07-20 20:30:00'),
(266,1,'testTask','renren',0,NULL,1,'2019-07-20 21:00:00'),
(267,1,'testTask','renren',0,NULL,1,'2019-07-20 21:30:00'),
(268,1,'testTask','renren',0,NULL,1,'2019-07-20 22:00:00'),
(269,1,'testTask','renren',0,NULL,2,'2019-07-20 22:30:00'),
(270,1,'testTask','renren',0,NULL,1,'2019-07-20 23:00:00'),
(271,1,'testTask','renren',0,NULL,1,'2019-07-20 23:30:00'),
(272,1,'testTask','renren',0,NULL,6,'2019-07-21 00:00:00'),
(273,1,'testTask','renren',0,NULL,1,'2019-07-21 00:30:00'),
(274,1,'testTask','renren',0,NULL,1,'2019-07-21 01:00:00'),
(275,1,'testTask','renren',0,NULL,0,'2019-07-21 01:30:00'),
(276,1,'testTask','renren',0,NULL,1,'2019-07-21 02:00:00'),
(277,1,'testTask','renren',0,NULL,1,'2019-07-21 02:30:00'),
(278,1,'testTask','renren',0,NULL,1,'2019-07-21 03:00:00'),
(279,1,'testTask','renren',0,NULL,1,'2019-07-21 03:30:00'),
(280,1,'testTask','renren',0,NULL,1,'2019-07-21 04:00:00'),
(281,1,'testTask','renren',0,NULL,0,'2019-07-21 04:30:00'),
(282,1,'testTask','renren',0,NULL,0,'2019-07-21 05:00:00'),
(283,1,'testTask','renren',0,NULL,1,'2019-07-21 05:30:00'),
(284,1,'testTask','renren',0,NULL,1,'2019-07-21 06:00:00'),
(285,1,'testTask','renren',0,NULL,0,'2019-07-21 06:30:00'),
(286,1,'testTask','renren',0,NULL,1,'2019-07-21 07:00:00'),
(287,1,'testTask','renren',0,NULL,0,'2019-07-21 07:30:00'),
(288,1,'testTask','renren',0,NULL,1,'2019-07-21 08:00:00'),
(289,1,'testTask','renren',0,NULL,1,'2019-07-21 08:30:00'),
(290,1,'testTask','renren',0,NULL,1,'2019-07-21 09:00:00'),
(291,1,'testTask','renren',0,NULL,1,'2019-07-21 09:30:00'),
(292,1,'testTask','renren',0,NULL,0,'2019-07-21 10:00:00'),
(293,1,'testTask','renren',0,NULL,1,'2019-07-21 10:30:00'),
(294,1,'testTask','renren',0,NULL,1,'2019-07-21 11:00:00'),
(295,1,'testTask','renren',0,NULL,1,'2019-07-21 11:30:00'),
(296,1,'testTask','renren',0,NULL,0,'2019-07-21 12:00:00'),
(297,1,'testTask','renren',0,NULL,1,'2019-07-21 12:30:00'),
(298,1,'testTask','renren',0,NULL,0,'2019-07-21 13:00:00'),
(299,1,'testTask','renren',0,NULL,1,'2019-07-21 13:30:00'),
(300,1,'testTask','renren',0,NULL,1,'2019-07-21 14:00:00'),
(301,1,'testTask','renren',0,NULL,0,'2019-07-21 14:30:00'),
(302,1,'testTask','renren',0,NULL,0,'2019-07-21 15:00:00'),
(303,1,'testTask','renren',0,NULL,1,'2019-07-21 15:30:00'),
(304,1,'testTask','renren',0,NULL,1,'2019-07-21 16:00:00'),
(305,1,'testTask','renren',0,NULL,2,'2019-07-21 16:30:00'),
(306,1,'testTask','renren',0,NULL,10,'2019-07-21 17:00:00'),
(307,1,'testTask','renren',0,NULL,1,'2019-07-21 17:30:00'),
(308,1,'testTask','renren',0,NULL,1,'2019-07-21 18:00:00'),
(309,1,'testTask','renren',0,NULL,1,'2019-07-21 18:30:00'),
(310,1,'testTask','renren',0,NULL,1,'2019-07-21 19:00:00'),
(311,1,'testTask','renren',0,NULL,0,'2019-07-21 19:30:00'),
(312,1,'testTask','renren',0,NULL,1,'2019-07-21 20:00:00'),
(313,1,'testTask','renren',0,NULL,0,'2019-07-21 20:30:00'),
(314,1,'testTask','renren',0,NULL,1,'2019-07-21 21:00:00'),
(315,1,'testTask','renren',0,NULL,1,'2019-07-21 21:30:00'),
(316,1,'testTask','renren',0,NULL,0,'2019-07-21 22:00:00'),
(317,1,'testTask','renren',0,NULL,1,'2019-07-21 22:30:00'),
(318,1,'testTask','renren',0,NULL,1,'2019-07-21 23:00:00'),
(319,1,'testTask','renren',0,NULL,1,'2019-07-21 23:30:00'),
(320,1,'testTask','renren',0,NULL,6,'2019-07-22 00:00:00'),
(321,1,'testTask','renren',0,NULL,0,'2019-07-22 00:30:00'),
(322,1,'testTask','renren',0,NULL,1,'2019-07-22 01:00:00'),
(323,1,'testTask','renren',0,NULL,1,'2019-07-22 01:30:00'),
(324,1,'testTask','renren',0,NULL,1,'2019-07-22 02:00:00'),
(325,1,'testTask','renren',0,NULL,0,'2019-07-22 02:30:00'),
(326,1,'testTask','renren',0,NULL,0,'2019-07-22 03:00:00'),
(327,1,'testTask','renren',0,NULL,1,'2019-07-22 03:30:00'),
(328,1,'testTask','renren',0,NULL,1,'2019-07-22 04:00:00'),
(329,1,'testTask','renren',0,NULL,1,'2019-07-22 04:30:00'),
(330,1,'testTask','renren',0,NULL,0,'2019-07-22 05:00:00'),
(331,1,'testTask','renren',0,NULL,1,'2019-07-22 05:30:00'),
(332,1,'testTask','renren',0,NULL,0,'2019-07-22 06:00:00'),
(333,1,'testTask','renren',0,NULL,1,'2019-07-22 06:30:00'),
(334,1,'testTask','renren',0,NULL,1,'2019-07-22 07:00:00'),
(335,1,'testTask','renren',0,NULL,0,'2019-07-22 07:30:00'),
(336,1,'testTask','renren',0,NULL,0,'2019-07-22 08:00:00'),
(337,1,'testTask','renren',0,NULL,1,'2019-07-22 08:30:00'),
(338,1,'testTask','renren',0,NULL,1,'2019-07-22 09:00:00'),
(339,1,'testTask','renren',0,NULL,0,'2019-07-22 09:30:00'),
(340,1,'testTask','renren',0,NULL,0,'2019-07-22 10:00:00'),
(341,1,'testTask','renren',0,NULL,1,'2019-07-22 10:30:00'),
(342,1,'testTask','renren',0,NULL,1,'2019-07-22 11:00:00'),
(343,1,'testTask','renren',0,NULL,1,'2019-07-22 11:30:00'),
(344,1,'testTask','renren',0,NULL,1,'2019-07-22 12:00:00'),
(345,1,'testTask','renren',0,NULL,0,'2019-07-22 12:30:00'),
(346,1,'testTask','renren',0,NULL,0,'2019-07-22 13:00:00'),
(347,1,'testTask','renren',0,NULL,1,'2019-07-22 13:30:00'),
(348,1,'testTask','renren',0,NULL,0,'2019-07-22 14:00:00'),
(349,1,'testTask','renren',0,NULL,0,'2019-07-22 14:30:00'),
(350,1,'testTask','renren',0,NULL,0,'2019-07-22 15:00:00'),
(351,1,'testTask','renren',0,NULL,1,'2019-07-22 15:30:00'),
(352,1,'testTask','renren',0,NULL,0,'2019-07-22 16:00:00'),
(353,1,'testTask','renren',0,NULL,0,'2019-07-22 16:30:00'),
(354,1,'testTask','renren',0,NULL,1,'2019-07-22 17:00:00'),
(355,1,'testTask','renren',0,NULL,1,'2019-07-22 17:30:00'),
(356,1,'testTask','renren',0,NULL,0,'2019-07-22 18:00:00'),
(357,1,'testTask','renren',0,NULL,0,'2019-07-22 18:30:00'),
(358,1,'testTask','renren',0,NULL,1,'2019-07-22 19:00:00'),
(359,1,'testTask','renren',0,NULL,1,'2019-07-22 19:30:00'),
(360,1,'testTask','renren',0,NULL,1,'2019-07-22 20:00:00'),
(361,1,'testTask','renren',0,NULL,1,'2019-07-22 20:30:00'),
(362,1,'testTask','renren',0,NULL,1,'2019-07-22 21:00:00'),
(363,1,'testTask','renren',0,NULL,0,'2019-07-22 21:30:00'),
(364,1,'testTask','renren',0,NULL,0,'2019-07-22 22:00:00'),
(365,1,'testTask','renren',0,NULL,1,'2019-07-22 22:30:00'),
(366,1,'testTask','renren',0,NULL,1,'2019-07-22 23:00:00'),
(367,1,'testTask','renren',0,NULL,1,'2019-07-22 23:30:00'),
(368,1,'testTask','renren',0,NULL,5,'2019-07-23 00:00:00'),
(369,1,'testTask','renren',0,NULL,1,'2019-07-23 00:30:00'),
(370,1,'testTask','renren',0,NULL,0,'2019-07-23 01:00:00'),
(371,1,'testTask','renren',0,NULL,0,'2019-07-23 01:30:00'),
(372,1,'testTask','renren',0,NULL,1,'2019-07-23 02:00:00'),
(373,1,'testTask','renren',0,NULL,1,'2019-07-23 02:30:00'),
(374,1,'testTask','renren',0,NULL,1,'2019-07-23 03:00:00'),
(375,1,'testTask','renren',0,NULL,1,'2019-07-23 03:30:00'),
(376,1,'testTask','renren',0,NULL,1,'2019-07-23 04:00:00'),
(377,1,'testTask','renren',0,NULL,1,'2019-07-23 04:30:00'),
(378,1,'testTask','renren',0,NULL,1,'2019-07-23 05:00:00'),
(379,1,'testTask','renren',0,NULL,1,'2019-07-23 05:30:00'),
(380,1,'testTask','renren',0,NULL,1,'2019-07-23 06:00:00'),
(381,1,'testTask','renren',0,NULL,1,'2019-07-23 06:30:00'),
(382,1,'testTask','renren',0,NULL,0,'2019-07-23 07:00:00'),
(383,1,'testTask','renren',0,NULL,1,'2019-07-23 07:30:00'),
(384,1,'testTask','renren',0,NULL,1,'2019-07-23 08:00:00'),
(385,1,'testTask','renren',0,NULL,1,'2019-07-23 08:30:00'),
(386,1,'testTask','renren',0,NULL,0,'2019-07-23 09:00:00'),
(387,1,'testTask','renren',0,NULL,0,'2019-07-23 09:30:00'),
(388,1,'testTask','renren',0,NULL,0,'2019-07-23 10:00:00'),
(389,1,'testTask','renren',0,NULL,1,'2019-07-23 10:30:00'),
(390,1,'testTask','renren',0,NULL,0,'2019-07-23 11:00:00'),
(391,1,'testTask','renren',0,NULL,0,'2019-07-23 11:30:00'),
(392,1,'testTask','renren',0,NULL,1,'2019-07-23 12:00:00'),
(393,1,'testTask','renren',0,NULL,1,'2019-07-23 12:30:00'),
(394,1,'testTask','renren',0,NULL,0,'2019-07-23 13:00:00'),
(395,1,'testTask','renren',0,NULL,0,'2019-07-23 13:30:00'),
(396,1,'testTask','renren',0,NULL,0,'2019-07-23 14:00:00'),
(397,1,'testTask','renren',0,NULL,0,'2019-07-23 14:30:00'),
(398,1,'testTask','renren',0,NULL,1,'2019-07-23 15:00:00'),
(399,1,'testTask','renren',0,NULL,0,'2019-07-23 15:30:00'),
(400,1,'testTask','renren',0,NULL,0,'2019-07-23 16:00:00'),
(401,1,'testTask','renren',0,NULL,1,'2019-07-23 16:30:00'),
(402,1,'testTask','renren',0,NULL,1,'2019-07-23 17:00:00'),
(403,1,'testTask','renren',0,NULL,1,'2019-07-23 17:30:00'),
(404,1,'testTask','renren',0,NULL,0,'2019-07-23 18:00:00'),
(405,1,'testTask','renren',0,NULL,0,'2019-07-23 18:30:00'),
(406,1,'testTask','renren',0,NULL,1,'2019-07-23 19:00:00'),
(407,1,'testTask','renren',0,NULL,1,'2019-07-23 19:30:00'),
(408,1,'testTask','renren',0,NULL,1,'2019-07-23 20:00:00'),
(409,1,'testTask','renren',0,NULL,0,'2019-07-23 20:30:00'),
(410,1,'testTask','renren',0,NULL,1,'2019-07-23 21:00:00'),
(411,1,'testTask','renren',0,NULL,1,'2019-07-23 21:30:00'),
(412,1,'testTask','renren',0,NULL,0,'2019-07-23 22:00:00'),
(413,1,'testTask','renren',0,NULL,1,'2019-07-23 22:30:00'),
(414,1,'testTask','renren',0,NULL,1,'2019-07-23 23:00:00'),
(415,1,'testTask','renren',0,NULL,0,'2019-07-23 23:30:00'),
(416,1,'testTask','renren',0,NULL,4,'2019-07-24 00:00:00'),
(417,1,'testTask','renren',0,NULL,1,'2019-07-24 00:30:00'),
(418,1,'testTask','renren',0,NULL,0,'2019-07-24 01:00:00'),
(419,1,'testTask','renren',0,NULL,1,'2019-07-24 01:30:00'),
(420,1,'testTask','renren',0,NULL,0,'2019-07-24 02:00:00'),
(421,1,'testTask','renren',0,NULL,0,'2019-07-24 02:30:00'),
(422,1,'testTask','renren',0,NULL,1,'2019-07-24 03:00:00'),
(423,1,'testTask','renren',0,NULL,1,'2019-07-24 03:30:00'),
(424,1,'testTask','renren',0,NULL,1,'2019-07-24 04:00:00'),
(425,1,'testTask','renren',0,NULL,1,'2019-07-24 04:30:00'),
(426,1,'testTask','renren',0,NULL,0,'2019-07-24 05:00:00'),
(427,1,'testTask','renren',0,NULL,0,'2019-07-24 05:30:00'),
(428,1,'testTask','renren',0,NULL,1,'2019-07-24 06:00:00'),
(429,1,'testTask','renren',0,NULL,1,'2019-07-24 06:30:00'),
(430,1,'testTask','renren',0,NULL,1,'2019-07-24 07:00:00'),
(431,1,'testTask','renren',0,NULL,1,'2019-07-24 07:30:00'),
(432,1,'testTask','renren',0,NULL,1,'2019-07-24 08:00:00'),
(433,1,'testTask','renren',0,NULL,1,'2019-07-24 08:30:00'),
(434,1,'testTask','renren',0,NULL,1,'2019-07-24 09:00:00'),
(435,1,'testTask','renren',0,NULL,0,'2019-07-24 09:30:00'),
(436,1,'testTask','renren',0,NULL,0,'2019-07-24 10:00:00'),
(437,1,'testTask','renren',0,NULL,0,'2019-07-24 10:30:00'),
(438,1,'testTask','renren',0,NULL,1,'2019-07-24 11:00:00'),
(439,1,'testTask','renren',0,NULL,0,'2019-07-24 11:30:00'),
(440,1,'testTask','renren',0,NULL,1,'2019-07-24 12:00:00'),
(441,1,'testTask','renren',0,NULL,1,'2019-07-24 12:30:00'),
(442,1,'testTask','renren',0,NULL,1,'2019-07-24 13:00:00'),
(443,1,'testTask','renren',0,NULL,0,'2019-07-24 13:30:00'),
(444,1,'testTask','renren',0,NULL,0,'2019-07-24 14:00:00'),
(445,1,'testTask','renren',0,NULL,1,'2019-07-24 14:30:00'),
(446,1,'testTask','renren',0,NULL,0,'2019-07-24 15:00:00'),
(447,1,'testTask','renren',0,NULL,0,'2019-07-24 15:30:00'),
(448,1,'testTask','renren',0,NULL,1,'2019-07-24 16:00:00'),
(449,1,'testTask','renren',0,NULL,0,'2019-07-24 16:30:00'),
(450,1,'testTask','renren',0,NULL,1,'2019-07-24 17:00:00'),
(451,1,'testTask','renren',0,NULL,0,'2019-07-24 17:30:00'),
(452,1,'testTask','renren',0,NULL,0,'2019-07-24 18:00:00'),
(453,1,'testTask','renren',0,NULL,0,'2019-07-24 18:30:00'),
(454,1,'testTask','renren',0,NULL,0,'2019-07-24 19:00:00'),
(455,1,'testTask','renren',0,NULL,1,'2019-07-24 19:30:00'),
(456,1,'testTask','renren',0,NULL,1,'2019-07-24 20:00:00'),
(457,1,'testTask','renren',0,NULL,2,'2019-07-24 20:30:00'),
(458,1,'testTask','renren',0,NULL,1,'2019-07-24 21:00:00'),
(459,1,'testTask','renren',0,NULL,1,'2019-07-24 21:30:00'),
(460,1,'testTask','renren',0,NULL,1,'2019-07-24 22:00:00'),
(461,1,'testTask','renren',0,NULL,0,'2019-07-24 22:30:00'),
(462,1,'testTask','renren',0,NULL,1,'2019-07-24 23:00:00'),
(463,1,'testTask','renren',0,NULL,0,'2019-07-24 23:30:00'),
(464,1,'testTask','renren',0,NULL,5,'2019-07-25 00:00:00'),
(465,1,'testTask','renren',0,NULL,1,'2019-07-25 00:30:00'),
(466,1,'testTask','renren',0,NULL,1,'2019-07-25 01:00:00'),
(467,1,'testTask','renren',0,NULL,1,'2019-07-25 01:30:00'),
(468,1,'testTask','renren',0,NULL,0,'2019-07-25 02:00:00'),
(469,1,'testTask','renren',0,NULL,1,'2019-07-25 02:30:00'),
(470,1,'testTask','renren',0,NULL,0,'2019-07-25 03:00:00'),
(471,1,'testTask','renren',0,NULL,1,'2019-07-25 03:30:00'),
(472,1,'testTask','renren',0,NULL,1,'2019-07-25 04:00:00'),
(473,1,'testTask','renren',0,NULL,0,'2019-07-25 04:30:00'),
(474,1,'testTask','renren',0,NULL,0,'2019-07-25 05:00:00'),
(475,1,'testTask','renren',0,NULL,1,'2019-07-25 05:30:00'),
(476,1,'testTask','renren',0,NULL,0,'2019-07-25 06:00:00'),
(477,1,'testTask','renren',0,NULL,1,'2019-07-25 06:30:00'),
(478,1,'testTask','renren',0,NULL,1,'2019-07-25 07:00:00'),
(479,1,'testTask','renren',0,NULL,1,'2019-07-25 07:30:00'),
(480,1,'testTask','renren',0,NULL,0,'2019-07-25 08:00:00'),
(481,1,'testTask','renren',0,NULL,0,'2019-07-25 08:30:00'),
(482,1,'testTask','renren',0,NULL,1,'2019-07-25 09:00:00'),
(483,1,'testTask','renren',0,NULL,1,'2019-07-25 09:30:00'),
(484,1,'testTask','renren',0,NULL,1,'2019-07-25 10:00:00'),
(485,1,'testTask','renren',0,NULL,1,'2019-07-25 10:30:00'),
(486,1,'testTask','renren',0,NULL,1,'2019-07-25 11:00:00'),
(487,1,'testTask','renren',0,NULL,1,'2019-07-25 11:30:00'),
(488,1,'testTask','renren',0,NULL,0,'2019-07-25 12:00:00'),
(489,1,'testTask','renren',0,NULL,1,'2019-07-25 12:30:00'),
(490,1,'testTask','renren',0,NULL,0,'2019-07-25 13:00:00'),
(491,1,'testTask','renren',0,NULL,0,'2019-07-25 13:30:00'),
(492,1,'testTask','renren',0,NULL,1,'2019-07-25 14:00:00'),
(493,1,'testTask','renren',0,NULL,1,'2019-07-25 14:30:00'),
(494,1,'testTask','renren',0,NULL,0,'2019-07-25 15:00:00'),
(495,1,'testTask','renren',0,NULL,1,'2019-07-25 15:30:00'),
(496,1,'testTask','renren',0,NULL,0,'2019-07-25 16:00:00'),
(497,1,'testTask','renren',0,NULL,0,'2019-07-25 16:30:00'),
(498,1,'testTask','renren',0,NULL,1,'2019-07-25 17:00:00'),
(499,1,'testTask','renren',0,NULL,0,'2019-07-25 17:30:00'),
(500,1,'testTask','renren',0,NULL,0,'2019-07-25 18:00:00'),
(501,1,'testTask','renren',0,NULL,1,'2019-07-25 18:30:00'),
(502,1,'testTask','renren',0,NULL,1,'2019-07-25 19:00:00'),
(503,1,'testTask','renren',0,NULL,1,'2019-07-25 19:30:00'),
(504,1,'testTask','renren',0,NULL,1,'2019-07-25 20:00:00'),
(505,1,'testTask','renren',0,NULL,0,'2019-07-25 20:30:00'),
(506,1,'testTask','renren',0,NULL,1,'2019-07-25 21:00:00'),
(507,1,'testTask','renren',0,NULL,0,'2019-07-25 21:30:00'),
(508,1,'testTask','renren',0,NULL,0,'2019-07-25 22:00:00'),
(509,1,'testTask','renren',0,NULL,1,'2019-07-25 22:30:00'),
(510,1,'testTask','renren',0,NULL,0,'2019-07-25 23:00:00'),
(511,1,'testTask','renren',0,NULL,1,'2019-07-25 23:30:00'),
(512,1,'testTask','renren',0,NULL,19,'2019-07-26 00:00:00'),
(513,1,'testTask','renren',0,NULL,1,'2019-07-26 00:30:00'),
(514,1,'testTask','renren',0,NULL,1,'2019-07-26 01:00:00'),
(515,1,'testTask','renren',0,NULL,1,'2019-07-26 01:30:00'),
(516,1,'testTask','renren',0,NULL,0,'2019-07-26 02:00:00'),
(517,1,'testTask','renren',0,NULL,1,'2019-07-26 02:30:00'),
(518,1,'testTask','renren',0,NULL,1,'2019-07-26 03:00:00'),
(519,1,'testTask','renren',0,NULL,1,'2019-07-26 03:30:00'),
(520,1,'testTask','renren',0,NULL,0,'2019-07-26 04:00:00'),
(521,1,'testTask','renren',0,NULL,1,'2019-07-26 04:30:00'),
(522,1,'testTask','renren',0,NULL,0,'2019-07-26 05:00:00'),
(523,1,'testTask','renren',0,NULL,1,'2019-07-26 05:30:00'),
(524,1,'testTask','renren',0,NULL,0,'2019-07-26 06:00:00'),
(525,1,'testTask','renren',0,NULL,0,'2019-07-26 06:30:00'),
(526,1,'testTask','renren',0,NULL,0,'2019-07-26 07:00:00'),
(527,1,'testTask','renren',0,NULL,1,'2019-07-26 07:30:00'),
(528,1,'testTask','renren',0,NULL,2,'2019-07-26 08:00:00'),
(529,1,'testTask','renren',0,NULL,1,'2019-07-26 08:30:00'),
(530,1,'testTask','renren',0,NULL,0,'2019-07-26 09:00:00'),
(531,1,'testTask','renren',0,NULL,0,'2019-07-26 09:30:00'),
(532,1,'testTask','renren',0,NULL,4,'2019-07-26 10:00:00'),
(533,1,'testTask','renren',0,NULL,1,'2019-07-26 10:30:00'),
(534,1,'testTask','renren',0,NULL,1,'2019-07-26 11:00:00'),
(535,1,'testTask','renren',0,NULL,1,'2019-07-26 11:30:00'),
(536,1,'testTask','renren',0,NULL,0,'2019-07-26 12:00:00'),
(537,1,'testTask','renren',0,NULL,1,'2019-07-26 12:30:00'),
(538,1,'testTask','renren',0,NULL,1,'2019-07-26 13:00:00'),
(539,1,'testTask','renren',0,NULL,0,'2019-07-26 13:30:00'),
(540,1,'testTask','renren',0,NULL,0,'2019-07-26 14:00:00'),
(541,1,'testTask','renren',0,NULL,0,'2019-07-26 14:30:00'),
(542,1,'testTask','renren',0,NULL,0,'2019-07-26 15:00:00'),
(543,1,'testTask','renren',0,NULL,1,'2019-07-26 15:30:00'),
(544,1,'testTask','renren',0,NULL,0,'2019-07-26 16:00:00'),
(545,1,'testTask','renren',0,NULL,0,'2019-07-26 16:30:00');

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values 
('009669ef-76d9-41ea-829c-8ca97a10c7a9','68bn7','2019-07-08 17:05:38'),
('03ff5059-7350-480d-88bc-8905b3a0c105','gbge8','2019-07-08 17:05:24'),
('28cac9b7-0e2f-4500-86b3-f84a0da2a45c','x5a8y','2019-07-19 23:47:39'),
('2a136e80-5494-44cf-85ac-227bb3da9cb9','5d3m3','2020-01-11 01:18:18'),
('48d1f189-f778-4b38-8539-2154cdf5128e','n4px2','2019-07-15 23:10:03'),
('507d49f2-36ba-41d3-8c61-54c07394bbb6','4wmnx','2019-07-15 20:40:51'),
('63e824d2-edd0-46e9-82dd-dcfe6f8b8055','ynn85','2019-07-19 17:29:49'),
('82078b71-8f6c-455c-8ea9-a852c50fbfb7','5n577','2019-07-21 19:41:15'),
('8239924a-ea06-4371-8be0-5221b1af640e','nayye','2019-07-21 11:21:59'),
('b1e0d2cf-3c27-491e-847c-4c067a710c61','wey2n','2020-01-10 23:59:46'),
('b2f90cf6-f44e-47a1-8014-49754bacb97a','pgb88','2019-07-19 18:35:52'),
('b3cadd6f-ce46-4ee0-8a3b-9bfc34f4542c','np7g2','2019-07-04 13:47:11'),
('b60db9a8-d3fa-4543-8151-37c35707803d','g3np8','2020-01-11 01:18:20'),
('bfdaad62-85d7-48ed-8d21-ced0c5ae3d31','4enmf','2020-01-11 01:15:10'),
('e3057e14-0b76-4254-8b25-7e2f917621e7','awwmn','2019-07-19 18:24:38'),
('ea556b10-8109-4f5f-847d-13a94e349381','68mbf','2019-07-21 19:59:20'),
('eaf9e005-4487-4aac-8b57-c577a63e3696','2apxg','2019-07-20 00:14:49'),
('fc621be9-b374-4897-82de-236648906318','xx8bw','2019-07-19 17:50:47'),
('fc6b1dd3-05d9-4fa4-8f65-a3461c573cd6','3aeb3','2019-07-21 10:54:36');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values 
(1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values 
(1,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]',6,'127.0.0.1','2019-07-04 13:48:35'),
(2,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":0,\"name\":\"优惠营销\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-04 13:51:19'),
(3,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":0,\"name\":\"库存管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]',3,'127.0.0.1','2019-07-04 13:54:03'),
(4,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":34,\"parentId\":0,\"name\":\"订单管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]',3,'127.0.0.1','2019-07-04 13:54:52'),
(5,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":35,\"parentId\":0,\"name\":\"物流管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"oss\",\"orderNum\":0}]',3,'127.0.0.1','2019-07-04 13:57:29'),
(6,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":36,\"parentId\":0,\"name\":\"内容管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0}]',2,'127.0.0.1','2019-07-04 13:58:26'),
(7,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":37,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"/category/list\",\"perms\":\"category:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',7,'127.0.0.1','2019-07-08 17:14:28'),
(8,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":38,\"parentId\":31,\"name\":\"商品列表\",\"url\":\"/spu/list\",\"perms\":\"spu:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 17:15:21'),
(9,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":39,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"/brand/list\",\"perms\":\"brand:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 17:16:57'),
(10,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":40,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"/attr/list\",\"perms\":\"attr:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 17:17:42'),
(11,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":37,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"/pms/category/list\",\"perms\":\"category:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',9,'127.0.0.1','2019-07-08 17:43:05'),
(12,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":38,\"parentId\":31,\"name\":\"商品列表\",\"url\":\"/pms/spu/list\",\"perms\":\"spu:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 17:43:16'),
(13,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":39,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"/pms/brand/list\",\"perms\":\"brand:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 17:43:27'),
(14,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":40,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"/pms/attr/list\",\"perms\":\"attr:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',7,'127.0.0.1','2019-07-08 17:43:38'),
(15,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":41,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 20:43:15'),
(16,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":41,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]',4,'127.0.0.1','2019-07-08 20:43:30'),
(17,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]',10,'192.168.3.3','2019-07-19 17:44:20'),
(18,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon/list\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]',6,'192.168.3.3','2019-07-19 18:03:06'),
(19,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon/list\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',7,'192.168.3.3','2019-07-19 18:03:17'),
(20,'admin','保存角色','com.atguigu.modules.sys.controller.SysRoleController.save()','[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,33,34,35,36,41,-666666],\"createTime\":\"Jul 21, 2019 11:18:03 AM\"}]',193,'192.168.3.3','2019-07-21 11:18:03'),
(21,'admin','修改用户','com.atguigu.modules.sys.controller.SysUserController.update()','[{\"userId\":2,\"username\":\"lei\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"lei@com.atguigu\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]',336,'192.168.3.3','2019-07-21 11:18:26'),
(22,'lei','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":43,\"parentId\":32,\"name\":\"秒杀活动\",\"url\":\"/sms/seckill/list\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',7,'192.168.3.3','2019-07-21 13:15:25'),
(23,'lei','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":43,\"parentId\":32,\"name\":\"秒杀活动\",\"url\":\"/sms/seckill/list\",\"perms\":\"sms:seckill:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',6,'192.168.3.3','2019-07-21 13:15:54'),
(24,'admin','修改角色','com.atguigu.modules.sys.controller.SysRoleController.update()','[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,33,34,35,36,41,-666666]}]',42,'192.168.3.3','2019-07-21 13:17:12'),
(25,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":44,\"parentId\":32,\"name\":\"优惠券领取历史\",\"url\":\"/sms/coupon/history\",\"perms\":\"sms:coupon:history\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',6,'192.168.3.3','2019-07-21 23:43:07'),
(26,'admin','修改菜单','com.atguigu.modules.sys.controller.SysMenuController.update()','[{\"menuId\":44,\"parentId\":32,\"name\":\"优惠券领取历史\",\"url\":\"/sms/coupon/coupon-history\",\"perms\":\"sms:coupon:history\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',8,'192.168.3.3','2019-07-21 23:44:17'),
(27,'admin','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":45,\"parentId\":32,\"name\":\"商品折扣\",\"url\":\"/sms/spu/discount\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',4,'192.168.3.3','2019-07-22 11:27:17'),
(28,'lei','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":46,\"parentId\":33,\"name\":\"仓库信息\",\"url\":\"/wms/wareinfo/list\",\"perms\":\"wms:wareinfo:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',7,'192.168.3.3','2019-07-25 17:26:43'),
(29,'admin','修改角色','com.atguigu.modules.sys.controller.SysRoleController.update()','[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,44,45,33,46,34,35,36,41,-666666]}]',189,'192.168.3.3','2019-07-25 17:30:53'),
(30,'admin','修改用户','com.atguigu.modules.sys.controller.SysUserController.update()','[{\"userId\":2,\"username\":\"lei\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"lei@com.atguigu\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]',316,'192.168.3.3','2019-07-25 17:31:03'),
(31,'lei','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":47,\"parentId\":33,\"name\":\"库存工作单\",\"url\":\"/wms/task/list\",\"perms\":\"wms:task:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',4,'192.168.3.3','2019-07-25 18:24:07'),
(32,'lei','保存菜单','com.atguigu.modules.sys.controller.SysMenuController.save()','[{\"menuId\":48,\"parentId\":33,\"name\":\"商品库存\",\"url\":\"/wms/sku/list\",\"perms\":\"wms:sku:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',5,'192.168.3.3','2019-07-25 18:24:57'),
(33,'admin','修改角色','com.atguigu.modules.sys.controller.SysRoleController.update()','[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,44,45,33,46,47,48,34,35,36,41,-666666]}]',63,'192.168.3.3','2019-07-25 18:25:51');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values 
(1,0,'系统管理',NULL,NULL,0,'system',0),
(2,1,'管理员列表','sys/user',NULL,1,'admin',1),
(3,1,'角色管理','sys/role',NULL,1,'role',2),
(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),
(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),
(6,1,'定时任务','job/schedule',NULL,1,'job',5),
(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),
(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),
(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),
(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),
(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),
(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),
(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),
(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),
(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),
(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),
(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),
(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),
(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),
(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),
(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),
(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),
(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),
(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),
(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),
(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),
(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),
(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),
(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),
(31,0,'商品管理','','',0,'zonghe',0),
(32,0,'优惠营销','','',0,'mudedi',0),
(33,0,'库存管理','','',0,'shouye',0),
(34,0,'订单管理','','',0,'log',0),
(35,0,'物流管理','','',0,'oss',0),
(36,0,'内容管理','','',0,'editor',0),
(37,31,'分类维护','/pms/category/list','pms:category:list',1,'menu',0),
(38,31,'商品列表','/pms/spu/list','pms:spu:list',1,'tubiao',0),
(39,31,'品牌管理','/pms/brand/list','pms:brand:list',1,'tubiao',0),
(40,31,'属性维护','/pms/attr/list','pms:attr:list',1,'tubiao',0),
(41,0,'用户管理','','',0,'admin',0),
(42,32,'优惠卷','/sms/coupon/list','sms:coupon:list',1,'log',0),
(43,32,'秒杀活动','/sms/seckill/list','sms:seckill:list',1,'log',0),
(44,32,'优惠券领取历史','/sms/coupon/coupon-history','sms:coupon:history',1,'log',0),
(45,32,'商品折扣','/sms/spu/discount','',1,'log',0),
(46,33,'仓库信息','/wms/wareinfo/list','wms:wareinfo:list',1,'log',0),
(47,33,'库存工作单','/wms/task/list','wms:task:list',1,'log',0),
(48,33,'商品库存','/wms/sku/list','wms:sku:list',1,'log',0);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`remark`,`create_user_id`,`create_time`) values 
(1,'lfy','123456',1,'2019-07-21 11:18:03');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values 
(132,1,1),
(133,1,2),
(134,1,15),
(135,1,16),
(136,1,17),
(137,1,18),
(138,1,3),
(139,1,19),
(140,1,20),
(141,1,21),
(142,1,22),
(143,1,4),
(144,1,23),
(145,1,24),
(146,1,25),
(147,1,26),
(148,1,5),
(149,1,6),
(150,1,7),
(151,1,8),
(152,1,9),
(153,1,10),
(154,1,11),
(155,1,12),
(156,1,13),
(157,1,14),
(158,1,27),
(159,1,29),
(160,1,30),
(161,1,31),
(162,1,37),
(163,1,38),
(164,1,39),
(165,1,40),
(166,1,32),
(167,1,42),
(168,1,43),
(169,1,44),
(170,1,45),
(171,1,33),
(172,1,46),
(173,1,47),
(174,1,48),
(175,1,34),
(176,1,35),
(177,1,36),
(178,1,41),
(179,1,-666666);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values 
(1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@com.atguigu','13612345678',1,1,'2016-11-11 11:11:11'),
(2,'lei','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','lei@com.atguigu','13612345678',1,1,'2019-07-19 17:26:22');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
(2,2,1);

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values 
(1,'3b708b7d7f318d657b0ca5e512c0cfbf','2020-01-18 08:30:33','2020-01-17 20:30:33'),
(2,'f94ddd4c95cf3d327387fb43d802e474','2019-07-27 00:05:14','2019-07-26 12:05:14');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values 
(1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
