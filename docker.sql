-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-08-13 18:29:01
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `docker`
--

-- --------------------------------------------------------

--
-- 表的结构 `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `name` varchar(20) NOT NULL,
  `decription` text NOT NULL,
  `cmdJson` text NOT NULL,
  `sshPort` int(11) NOT NULL,
  `otherPort` int(11) NOT NULL,
  `url` varchar(40) NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='static information about apps';

--
-- 转存表中的数据 `app`
--

INSERT INTO `app` (`name`, `decription`, `cmdJson`, `sshPort`, `otherPort`, `url`) VALUES
('mysql', 'MySQL with ssh service inside.', '{"Cmd":[],"Image":"mysql:sshd","HostConfig":{"PortBindings":{"22/tcp":[{"HostPort":"10022"}],"3306/tcp":[{"HostPort":"13306"}]}}}', 10022, 13306, '10080/phpMyAdmin'),
('openoffice', 'OpenOffice on Ubuntu with desktop intergrated.', '{"Cmd":[],"Image":"tobegit3hub/dockerized-openoffice:latest","HostConfig":{"PortBindings":{"6080/tcp":[{"HostPort":"6080"}]}}}', 0, 6080, '6080/vnc_auto.html'),
('phpmyadmin', 'PhpMyAdmin is a web user interface for MySQL.', '{"Cmd":[],"Image":"tutum/apache-php:latest","HostConfig":{"Binds":["/home/ubuntu/webapps:/app"],"PortBindings":{"80/tcp":[{"HostPort":"10080"}]}}}', 0, 10080, '10080/phpMyAdmin'),
('tomcat', 'Tomcat with ssh service inside.', '{"Cmd":[],"Image":"tomcat:Tomcat","HostConfig":{"Binds": ["/home/ubuntu/webapps:/usr/local/tomcat/webapps"],"PortBindings":{"22/tcp":[{"HostPort":"10023"}],"8080/tcp":[{"HostPort":"18080"}]}}}', 10023, 18080, '18080/manager');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(8) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`) VALUES
(1, '414214550@qq.com', '123456', '陈航'),
(2, '857205379@qq.com', '123456', 'Joey');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
