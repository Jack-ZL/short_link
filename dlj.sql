-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-05-11 03:50:52
-- 服务器版本： 5.7.18-log
-- PHP 版本： 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dlj`
--

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin`
--

CREATE TABLE `fa_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_admin`
--

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', 0, 1559974232, 1492186163, 1559974232, '032608e0-e82c-4d05-88a3-6c41eeba3fcf', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin_log`
--

CREATE TABLE `fa_admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日志表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_admin_log`
--

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"3c809fe09358f3768dfc38393222e8d1\",\"username\":\"admin\",\"captcha\":\"rhvv\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559211801),
(2, 1, 'admin', '/admin.php/index/login?url=%2Fadmin.php', '登录', '{\"url\":\"\\/admin.php\",\"__token__\":\"a5223f5b013e830af206cc993d398509\",\"username\":\"admin\",\"captcha\":\"3jk3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559275713),
(3, 1, 'admin', '/LunziSTU_Admin.php/addon/install', '插件管理 安装', '{\"name\":\"geetest\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20190510_beta\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559288233),
(4, 1, 'admin', '/LunziSTU_Admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559288234),
(5, 1, 'admin', '/LunziSTU_Admin.php/index/login', '登录', '{\"__token__\":\"6bd4fdc5742daedf5746b58456d3403b\",\"username\":\"admin\",\"captcha\":\"ok\",\"geetest_challenge\":\"fd18de65cf53bc354555125564e77d35hv\",\"geetest_validate\":\"01c8922c3adc371900a2973ec037eb81\",\"geetest_seccode\":\"01c8922c3adc371900a2973ec037eb81|jordan\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559290933),
(6, 1, 'admin', '/LunziSTU_Admin.php/addon/install', '插件管理 安装', '{\"name\":\"loginbg\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20190510_beta\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559292036),
(7, 1, 'admin', '/LunziSTU_Admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559292037),
(8, 1, 'admin', '/LunziSTU_Admin.php/index/login', '登录', '{\"__token__\":\"6f4842931bb10dc5dd4cf0f61ce11a0a\",\"username\":\"admin\",\"captcha\":\"ok\",\"geetest_challenge\":\"c0f442dcb25435c2169a7e684b9b3e50bh\",\"geetest_validate\":\"f30603ce60ab9ffcf8cbe761583e695f\",\"geetest_seccode\":\"f30603ce60ab9ffcf8cbe761583e695f|jordan\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559295351),
(9, 1, 'admin', '/LunziSTU_Admin.php/addon/state', '插件管理 禁用启用', '{\"name\":\"geetest\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559297852),
(10, 1, 'admin', '/LunziSTU_Admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559297852),
(11, 0, 'Unknown', '/LunziSTU_Admin.php/index/login?url=%2FLunziSTU_Admin.php%2Faddon%3Fref%3Daddtabs', '', '{\"url\":\"\\/LunziSTU_Admin.php\\/addon?ref=addtabs\",\"__token__\":\"59c62dd71dd3d12193169405e50eac4d\",\"username\":\"dsfs\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1559301220),
(12, 0, 'Unknown', '/LunziSTU_Admin.php/index/login?url=%2FLunziSTU_Admin.php%2Faddon%3Fref%3Daddtabs', '', '{\"url\":\"\\/LunziSTU_Admin.php\\/addon?ref=addtabs\",\"__token__\":\"418acad3618702028630a33dd6685aef\",\"username\":\"dsfs\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1559301282),
(13, 0, 'Unknown', '/LunziSTU_Admin.php/index/login?url=%2FLunziSTU_Admin.php%2Faddon%3Fref%3Daddtabs', '', '{\"url\":\"\\/LunziSTU_Admin.php\\/addon?ref=addtabs\",\"__token__\":\"58eb1e4c46e4811892abb70439cd12e0\",\"username\":\"dsfs\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1559301287),
(14, 0, 'Unknown', '/LunziSTU_Admin.php/index/login?url=%2FLunziSTU_Admin.php%2Faddon%3Fref%3Daddtabs', '', '{\"url\":\"\\/LunziSTU_Admin.php\\/addon?ref=addtabs\",\"__token__\":\"666961ba4d76b96aa05358ef639778f4\",\"username\":\"dsfs\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1559301290),
(93, 0, 'Unknown', '/LunziSTU_Admin.php/index/login?url=%2FLunziSTU_Admin.php', '', '{\"url\":\"\\/LunziSTU_Admin.php\",\"__token__\":\"d4ab81c71021665fcf4242a37c319434\",\"username\":\"admin\",\"captcha\":\"ok\",\"tcaptcha_ticket\":\"t02-dsjvMMHxJMjjdPZNslAJ7Hppi9ZElZiIYxlyahpvgOeHZk0eAk3WORQeSBjzsq8ojEWB3In18fw8Ghd0Qo52WNw1xvDWZNjWoRzX1v_nFIoxc4HqLb_Tg**\",\"tcaptcha_randstr\":\"@Jy_\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559395372),
(121, 1, 'admin', '/LunziSTU_Admin.php/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559974433);

-- --------------------------------------------------------

--
-- 表的结构 `fa_attachment`
--

CREATE TABLE `fa_attachment` (
  `id` int(20) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group`
--

CREATE TABLE `fa_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_auth_group`
--

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group_access`
--

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_auth_group_access`
--

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_rule`
--

CREATE TABLE `fa_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_auth_rule`
--

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal'),
(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal'),
(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(85, 'file', 2, 'general/database', '数据库管理', 'fa fa-database', '', '可在线进行一些简单的数据库表优化或修复,查看表结构和数据。也可以进行SQL语句的操作', 1, 1559646940, 1559646940, 0, 'normal'),
(86, 'file', 85, 'general/database/index', '查看', 'fa fa-circle-o', '', '', 0, 1559646940, 1559646940, 0, 'normal'),
(87, 'file', 85, 'general/database/query', '查询', 'fa fa-circle-o', '', '', 0, 1559646940, 1559646940, 0, 'normal'),
(88, 'file', 85, 'general/database/backup', '备份', 'fa fa-circle-o', '', '', 0, 1559646940, 1559646940, 0, 'normal'),
(89, 'file', 85, 'general/database/restore', '恢复', 'fa fa-circle-o', '', '', 0, 1559646940, 1559646940, 0, 'normal'),
(90, 'file', 0, 'log', 'Log', 'fa fa-circle-o\r', '', '', 1, 1559974352, 1559974352, 0, 'normal'),
(91, 'file', 90, 'log/index', '查看', 'fa fa-circle-o', '', '', 0, 1559974352, 1559974352, 0, 'normal'),
(92, 'file', 90, 'log/add', '添加', 'fa fa-circle-o', '', '', 0, 1559974352, 1559974352, 0, 'normal'),
(93, 'file', 90, 'log/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1559974352, 1559974352, 0, 'normal'),
(94, 'file', 90, 'log/del', '删除', 'fa fa-circle-o', '', '', 0, 1559974352, 1559974352, 0, 'normal'),
(95, 'file', 90, 'log/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1559974352, 1559974352, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_category`
--

CREATE TABLE `fa_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_config`
--

CREATE TABLE `fa_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_config`
--

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '点链接', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_ems`
--

CREATE TABLE `fa_ems` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱验证码表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_sms`
--

CREATE TABLE `fa_sms` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_sms`
--

INSERT INTO `fa_sms` (`id`, `event`, `mobile`, `code`, `times`, `ip`, `createtime`) VALUES
(2, 'register', '19965412404', '1739', 0, '0.0.0.0', 1559619653),
(3, 'register', '19965412404', '1722', 0, '0.0.0.0', 1559620098),
(4, 'register', '19965412404', '6260', 0, '0.0.0.0', 1559620164),
(5, 'register', '19965412404', '9571', 0, '0.0.0.0', 1559620196),
(6, 'register', '19965412404', '3298', 0, '0.0.0.0', 1559620212),
(7, 'register', '19965412404', '7376', 0, '0.0.0.0', 1559620326),
(8, 'register', '19965412404', '3508', 0, '0.0.0.0', 1559620366),
(9, 'register', '19965412404', '4060', 0, '0.0.0.0', 1559620392),
(10, 'register', '19965412404', '3801', 0, '0.0.0.0', 1559620439),
(11, 'register', '19965412404', '8084', 0, '0.0.0.0', 1559620451),
(12, 'register', '19965412404', '6786', 0, '0.0.0.0', 1559620497),
(13, 'register', '19965412404', '9519', 0, '0.0.0.0', 1559620534),
(14, 'register', '19965412404', '8711', 0, '0.0.0.0', 1559620630),
(15, 'register', '19965412404', '4102', 0, '0.0.0.0', 1559620637),
(16, 'register', '19965412404', '4598', 0, '0.0.0.0', 1559620747),
(17, 'register', '19965412404', '2165', 0, '0.0.0.0', 1559620854),
(18, 'register', '19965412404', '7428', 0, '0.0.0.0', 1559621012),
(22, 'register', '19965412404', '3074', 0, '0.0.0.0', 1559622324),
(29, 'register', '13038599723', '5842', 0, '0.0.0.0', 1559641781),
(30, 'register', '13038599723', '8899', 0, '0.0.0.0', 1559641849);

-- --------------------------------------------------------

--
-- 表的结构 `fa_test`
--

CREATE TABLE `fa_test` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_test`
--

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `json`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, NULL, 0, 1, 'normal', '1');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user`
--

CREATE TABLE `fa_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_user`
--

INSERT INTO `fa_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-15', '', '0.00', 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', ''),
(2, 0, 'test', 'test', 'c5afd2dd70b69e840726155d9e9d4308', '5QhylC', 'rafiwx@gmail.com', '18933475596', '', 1, 0, NULL, '', '0.00', 0, 1, 1, 1559541520, 1559541520, '0.0.0.0', 0, '0.0.0.0', 1559541520, 1559541520, 1559541520, '', 'normal', ''),
(3, 0, '', '', '44082c1ffbf656be746e9942b4d6de9b', 'LwN1dt', '', '17127290868', '', 1, 0, NULL, '', '0.00', 0, 1, 1, 1559628474, 1559641425, '0.0.0.0', 0, '0.0.0.0', 1559626803, 1559626803, 1559641425, '', 'normal', '{\"email\":0,\"mobile\":1}'),
(4, 0, '', '', '7ed695b9297396b7d93893c04f4aa38e', 'F2H6hp', '', '13038599723', '', 1, 0, NULL, '', '0.00', 0, 2, 2, 1559645153, 1559714276, '0.0.0.0', 0, '0.0.0.0', 1559641915, 1559641915, 1559714276, '4f0a140c-05eb-46f3-a148-4a73310a9ddb', 'normal', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_group`
--

CREATE TABLE `fa_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_user_group`
--

INSERT INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_money_log`
--

CREATE TABLE `fa_user_money_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员余额变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_rule`
--

CREATE TABLE `fa_user_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员规则表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_user_rule`
--

INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal'),
(2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal'),
(3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal'),
(4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal'),
(5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal'),
(6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal'),
(7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal'),
(8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal'),
(9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal'),
(10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal'),
(11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal'),
(12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_score_log`
--

CREATE TABLE `fa_user_score_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_token`
--

CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fa_version`
--

CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_version`
--

INSERT INTO `fa_version` (`id`, `oldversion`, `newversion`, `packagesize`, `content`, `downloadurl`, `enforce`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE `log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uuid` char(23) NOT NULL DEFAULT '',
  `ip` varchar(41) NOT NULL,
  `referer` varchar(200) NOT NULL DEFAULT '',
  `referer_scheme` varchar(5) NOT NULL DEFAULT '',
  `referer_host` varchar(255) NOT NULL DEFAULT '',
  `user_agent` text,
  `device` varchar(6) NOT NULL DEFAULT '',
  `new_visitor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:老用户；1：新用户',
  `click_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `log`
--

INSERT INTO `log` (`id`, `url_id`, `uuid`, `ip`, `referer`, `referer_scheme`, `referer_host`, `user_agent`, `device`, `new_visitor`, `click_time`) VALUES
(1, 10017, '5cd3eb4cde0401.24892321', '127.0.0.1', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 0, '2019-05-10 09:02:34'),
(2, 10015, '5cd3eb4cde0401.24892321', '127.0.0.1', 'http://localhost:8000/', 'http', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 1, '2019-05-10 09:59:18'),
(3, 10023, '5cd3eb4cde0401.24892321', '127.0.0.1', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 1, '2019-05-14 10:54:42'),
(4, 10023, '5cd3eb4cde0401.24892321', '127.0.0.1', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 0, '2019-05-14 10:55:47'),
(5, 10024, '5cd3eb4cde0401.24892321', '127.0.0.1', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 1, '2019-05-14 11:09:30'),
(6, 10024, '5cd3eb4cde0401.24892321', '127.0.0.1', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'pc', 0, '2019-05-14 11:10:05'),
(7, 10048, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 1, '2019-05-31 04:01:57'),
(8, 10050, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 1, '2019-05-31 04:02:51'),
(9, 10050, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 0, '2019-05-31 04:03:09'),
(10, 10054, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 1, '2019-06-03 05:55:36'),
(11, 10072, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 1, '2019-06-04 10:36:03'),
(12, 10072, '5cf0a5a38380d6.95428930', '0.0.0.0', '', '', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'pc', 0, '2019-06-04 10:36:12');

-- --------------------------------------------------------

--
-- 表的结构 `urls`
--

CREATE TABLE `urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` text,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:系统生成；2：自定义',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(41) NOT NULL,
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `urls`
--

INSERT INTO `urls` (`id`, `user_id`, `keyword`, `url`, `type`, `create_time`, `ip`, `clicks`) VALUES
(10000, NULL, '2Bi', 'https://www.baidu.com', 1, '2019-04-22 11:22:51', '127.0.0.1', 0),
(10001, NULL, '2Bk', 'https://www.baidu.com/', 2, '2019-04-22 11:22:51', '127.0.0.1', 0),
(10002, NULL, '2Bj', 'https://www.baidu.com/aaa', 1, '2019-04-22 11:25:13', '127.0.0.1', 0),
(10003, NULL, '2Bl', 'http://www.baidu.com', 1, '2019-04-24 05:32:36', '127.0.0.1', 0),
(10004, NULL, '2Bm', 'https://dwz.cn/console/apidoc', 1, '2019-04-24 05:37:21', '127.0.0.1', 0),
(10005, NULL, '2Bn', 'https://dwz.cn/console/apid', 1, '2019-04-24 05:38:47', '127.0.0.1', 0),
(10006, NULL, '2Bo', 'https://dwz.cn/console/api', 1, '2019-04-24 05:41:27', '127.0.0.1', 0),
(10007, NULL, '2Bp', 'https://dwz.cn/console/ap', 1, '2019-04-24 05:42:37', '127.0.0.1', 0),
(10008, NULL, 'a', 'https://dwz.cn/', 2, '2019-04-24 06:23:11', '127.0.0.1', 0),
(10009, NULL, 'b', 'https://dwz.cn/', 2, '2019-04-24 06:23:54', '127.0.0.1', 0),
(10010, NULL, '你', 'http://127.0.0.1:8000/b', 2, '2019-04-24 06:25:32', '127.0.0.1', 0),
(10011, NULL, 'bbb', 'https://dwz.cn/', 2, '2019-04-24 06:29:22', '127.0.0.1', 0),
(10013, NULL, 'bbbc', 'https://dwz.cn/bbbbbbb', 2, '2019-04-24 06:31:40', '127.0.0.1', 0),
(10014, NULL, 'cccc', 'http://127.0.0.1:8000/2Bm', 2, '2019-04-24 07:25:24', '127.0.0.1', 0),
(10015, NULL, '2Bx', 'http://t.cn/EJD4c7K', 1, '2019-04-29 03:28:56', '127.0.0.1', 10),
(10016, NULL, '2By', 'http://newphper.com', 1, '2019-05-09 08:56:28', '127.0.0.1', 0),
(10017, NULL, '2Bz', 'http://thinkphp.cn', 1, '2019-05-10 09:02:30', '127.0.0.1', 1),
(10018, NULL, 'npt', 'http://newphper.com/tool', 2, '2019-05-13 11:27:42', '127.0.0.1', 0),
(10019, NULL, 'npts', 'http://newphper.com/tool/', 2, '2019-05-13 11:28:16', '127.0.0.1', 0),
(10020, NULL, '2BC', 'http://t.cn/aaaaa', 1, '2019-05-14 07:15:41', '127.0.0.1', 0),
(10021, NULL, '2BD', 'http://t.cn/EJD4c7Kdfg', 1, '2019-05-14 08:19:16', '127.0.0.1', 0),
(10022, NULL, '2BE', 'https://www.bt.cn/bbs/thread-3187-1-1.html', 1, '2019-05-14 08:22:16', '127.0.0.1', 0),
(10023, NULL, '2BF', 'https://github.com/top-think/think-queue', 1, '2019-05-14 10:34:28', '127.0.0.1', 2),
(10024, NULL, '2BG', 'https://mp.weixin.qq.com/wxopen/frame?t=promotion/ad_simple_frame&hidewording=1&page=campaign/edit&token=966700545&from_pos_type=999#/ad_group_edit?_k=nmb5kn', 1, '2019-05-14 11:09:21', '127.0.0.1', 2),
(10025, NULL, '2BH', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:34', '0.0.0.0', 0),
(10026, NULL, '2BI', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:37', '0.0.0.0', 0),
(10027, NULL, '2BJ', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:38', '0.0.0.0', 0),
(10028, NULL, '2BK', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:39', '0.0.0.0', 0),
(10029, NULL, '2BL', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:40', '0.0.0.0', 0),
(10030, NULL, '2BM', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:40', '0.0.0.0', 0),
(10031, NULL, '2BN', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:40', '0.0.0.0', 0),
(10032, NULL, '2BO', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10033, NULL, '2BP', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10034, NULL, '2BQ', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10035, NULL, '2BR', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10036, NULL, '2BS', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10037, NULL, '2BT', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:41', '0.0.0.0', 0),
(10038, NULL, '2BU', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:42', '0.0.0.0', 0),
(10039, NULL, '2BV', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:42', '0.0.0.0', 0),
(10040, NULL, '2BW', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:42', '0.0.0.0', 0),
(10041, NULL, '2BX', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:42', '0.0.0.0', 0),
(10042, NULL, '2BY', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:42', '0.0.0.0', 0),
(10043, NULL, '2BZ', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:43', '0.0.0.0', 0),
(10044, NULL, '2C0', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:43', '0.0.0.0', 0),
(10045, NULL, '2C1', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:47:43', '0.0.0.0', 0),
(10046, NULL, 'aaa', 'http://t.cn/EJD4c7K', 2, '2019-05-31 03:47:49', '0.0.0.0', 0),
(10047, NULL, 'aaabb', 'http://t.cn/EJD4c7K', 2, '2019-05-31 03:47:52', '0.0.0.0', 0),
(10048, NULL, '2C4', 'http://t.cn/EJD4c7K', 1, '2019-05-31 03:50:15', '0.0.0.0', 1),
(10049, NULL, '2C5', 'http://baidu.com', 1, '2019-05-31 04:00:48', '0.0.0.0', 0),
(10050, NULL, 'bdd', 'http://baidu.com', 2, '2019-05-31 04:01:05', '0.0.0.0', 2),
(10051, NULL, '2C7', 'http://baidu.com', 1, '2019-06-03 05:53:26', '0.0.0.0', 0),
(10052, NULL, '2C8', 'http://baidu.com', 1, '2019-06-03 05:53:51', '0.0.0.0', 0),
(10053, NULL, '2C9', 'http://baidu.com', 1, '2019-06-03 05:54:53', '0.0.0.0', 0),
(10054, NULL, '2Ca', 'http://dlj.biz', 1, '2019-06-03 05:55:29', '0.0.0.0', 1),
(10055, NULL, '2Cb', 'http://dlj.biz', 1, '2019-06-04 09:35:06', '0.0.0.0', 0),
(10056, NULL, '2Cc', 'http://baidu.com', 1, '2019-06-04 09:44:06', '0.0.0.0', 0),
(10057, NULL, '2Cd', 'http://dlj.biz', 1, '2019-06-04 09:52:50', '0.0.0.0', 0),
(10058, NULL, '2Ce', 'http://dlj.biz', 1, '2019-06-04 09:53:14', '0.0.0.0', 0),
(10059, NULL, 'dfsfa', 'http://dlj.biz', 2, '2019-06-04 09:54:17', '0.0.0.0', 0),
(10060, NULL, '2Cg', 'http://t.cn/EJD4c7K', 1, '2019-06-04 09:55:57', '0.0.0.0', 0),
(10061, NULL, '2Ch', 'http://dlj.biz', 1, '2019-06-04 09:56:58', '0.0.0.0', 0),
(10062, NULL, '2Ci', 'http://t.cn/EJD4c7K', 1, '2019-06-04 10:03:04', '0.0.0.0', 0),
(10063, NULL, '2Cj', 'http://dlj.biz', 1, '2019-06-04 10:05:31', '0.0.0.0', 0),
(10064, 4, '2Ck', 'http://dlj.biz', 1, '2019-06-04 10:07:35', '0.0.0.0', 0),
(10065, 4, '2Cl', 'http://dlj.biz', 1, '2019-06-04 10:07:45', '0.0.0.0', 0),
(10066, 4, '2Cm', 'http://dlj.biz', 1, '2019-06-04 10:07:46', '0.0.0.0', 0),
(10067, NULL, '2Cn', 'http://dlj.biz', 1, '2019-06-04 10:08:05', '0.0.0.0', 0),
(10068, NULL, '2Co', 'http://dlj.biz', 1, '2019-06-04 10:08:11', '0.0.0.0', 0),
(10069, NULL, '2Cp', 'http://dlj.biz', 1, '2019-06-04 10:08:11', '0.0.0.0', 0),
(10070, NULL, '2Cq', 'http://dlj.biz', 1, '2019-06-04 10:08:11', '0.0.0.0', 0),
(10071, NULL, '2Cr', 'http://dlj.biz', 1, '2019-06-04 10:08:42', '0.0.0.0', 0),
(10072, 4, '2Cs', 'http://t.cn/EJD4c7K', 1, '2019-06-04 10:29:38', '0.0.0.0', 2);

--
-- 转储表的索引
--

--
-- 表的索引 `fa_admin`
--
ALTER TABLE `fa_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- 表的索引 `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- 表的索引 `fa_attachment`
--
ALTER TABLE `fa_attachment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_auth_group_access`
--
ALTER TABLE `fa_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- 表的索引 `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `weigh` (`weigh`);

--
-- 表的索引 `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- 表的索引 `fa_config`
--
ALTER TABLE `fa_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `fa_ems`
--
ALTER TABLE `fa_ems`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `fa_sms`
--
ALTER TABLE `fa_sms`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_test`
--
ALTER TABLE `fa_test`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_user`
--
ALTER TABLE `fa_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`);

--
-- 表的索引 `fa_user_group`
--
ALTER TABLE `fa_user_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fa_user_token`
--
ALTER TABLE `fa_user_token`
  ADD PRIMARY KEY (`token`);

--
-- 表的索引 `fa_version`
--
ALTER TABLE `fa_version`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword` (`keyword`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `ip` (`ip`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fa_admin`
--
ALTER TABLE `fa_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=122;

--
-- 使用表AUTO_INCREMENT `fa_attachment`
--
ALTER TABLE `fa_attachment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- 使用表AUTO_INCREMENT `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fa_config`
--
ALTER TABLE `fa_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `fa_ems`
--
ALTER TABLE `fa_ems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fa_sms`
--
ALTER TABLE `fa_sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `fa_test`
--
ALTER TABLE `fa_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_user`
--
ALTER TABLE `fa_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `fa_user_group`
--
ALTER TABLE `fa_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fa_version`
--
ALTER TABLE `fa_version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `urls`
--
ALTER TABLE `urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10073;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
