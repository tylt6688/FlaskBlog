/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : pythondemo

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 25/09/2019 08:52:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '数十万 PhpStudy 用户被植入后门，快来检测你是否已沦为“肉鸡”！', '北京时间9月20日，杭州公安发布《杭州警方通报打击涉网违法犯罪暨‘净网2019’专项行动战果》一文，文章曝光了国内知名PHP调试环境程序集成包“PhpStudy软件”遭到黑客篡改并植入“后门”。截...');
INSERT INTO `article` VALUES (2, '.NET Core 3.0 稳定版发布', '一年一度的 .NET 开发者盛会 .NET Conf 2019 在昨日（举办时间为 9.23-9.25）正式开始了。大会第一天最重磅也是最激动人心的消息莫过于 .NET Core 3.0 稳定版的发布。.NET 项目管理总监 Scot...');
INSERT INTO `article` VALUES (3, 'GoFrame v1.9.3 发布，Go 应用开发框架', '该版本实际为v2.0的大版本发布，为避免go module机制严格要求v2版本以上需要修改import并加上v2后缀，因此使用了v1.9版本进行发布。 新特性 新增gf命令行开发辅助工具：https://goframe.org...');
INSERT INTO `article` VALUES (4, 'PHPRAP 2.0.4 发布，新增字段模板功能', 'PHPRAP，是一个基于 YII2 框架开发的 PHP 轻量级开源 API 接口文档管理系统，致力于减少前后端沟通成本，提高团队协作开发效率，打造 PHP 版的 RAP。 更新记录 【新增】新增项目字段模板功能...');
INSERT INTO `article` VALUES (5, 'Mars-java 发布 2.1.7-hotfix 版本', '接着上一篇更新： https://www.oschina.net/news/110055/mars-java-2-1-7-released 由于2.1.7版本存在一些不完美的地方（只是不够完美，并非bug），所以紧急补推了这个版本 更新点如下： 原来...');
INSERT INTO `article` VALUES (6, '高手问答第 233 期 —— 图数据库的设计和实践', '图数据库是一种非关系型数据库，用以解决现有关系数据库的局限性。它是一个使用图结构进行语义查询的数据库，它使用节点、边和属性来表示和存储数据。');
INSERT INTO `article` VALUES (7, '云原生生态：Oracle 宣布永久免费一部分云计算服务', 'Oracle CEO Larry Ellison 在 OpenWorld 大会上宣布推出了 Oracle Cloud Free Tier ，大小型公司和组织、开发人员、学生和教育工作者都可以构建、学习和探索 Oracle 自治数据库和 Oracle 云基...');
INSERT INTO `article` VALUES (8, 'BookStack v2.1 发布，功能类似 GitBook 和看云的在线文档管理系统', '程序介绍 BookStack，分享知识，共享智慧！知识，因分享，传承久远！ BookStack 是基于 Mindoc、使用Go语言的Beego框架开发的功能类似GitBook和看云的在线文档管理系统，实现了文档采集、导入...');
INSERT INTO `article` VALUES (9, 'RMS 卸任，Red Hat 敦促 FSF 任命更多元化主席', '上周开源/自由软件界突发大事件，全球知名黑客、自由软件运动发起人，同时也是自由软件基金会（FSF，Free Software Foundation）创始人与主席的 Richard M. Stallman（RMS）辞去了主席职务并...');
INSERT INTO `article` VALUES (10, 'Google 移除两款劫持 Cookie 信息的 Chrome 广告屏蔽插件', '被移除的插件分别“山寨”了两款主流的广告屏蔽插件 —— Adblock Plus 和 uBlock。 屏蔽浏览网页时出现的广告长期以来都是网民的刚需，正因如此，用户在安装浏览器后往往都会顺便装上一个广...');
INSERT INTO `article` VALUES (11, 'BookChat v2.4 发布，通用书籍阅读微信小程序，最后一个原生开发版本', 'BookChat 介绍 BookChat - 面向程序员的开源书籍和文档阅读学习小程序，同时也是一款基于 Apache 2.0 开源协议进行开源的通用书籍阅读微信小程序。 它非常轻量，200KB 左右的大小，麻雀虽小五...');
INSERT INTO `article` VALUES (12, '效力微软 15 年的前员工解释 Windows 10 为什么问题如此多', '众所周知 Windows 10 系统问题频发，整体来说稳定性比较差，然而在此之前的版本其实相对来说稳定性还挺好的。自从 Windows 10 正式版推出之时，该系统就开始频繁出现问题，乃至现在每个月安全...');
INSERT INTO `article` VALUES (13, '每日一博 | JVM 优化之逃逸分析与分配消除', '要了解逃逸分析背后的基本原理，我们先来看下这段有问题的 C 代码——当然这个是没法用 Java 来写的：');
INSERT INTO `article` VALUES (14, 'SpringBlade 2.5.0 发布，集成 Seata 支持分布式事务', '简介： SpringBlade 是由一个商业级项目升级优化而来的 SpringCloud 微服务架构，采用 Java8 API 重构了业务代码，完全遵循阿里巴巴编码规范。采用 Spring Boot 2 、Spring Cloud Greenwich ...');
INSERT INTO `article` VALUES (15, 'ArtiPub —— 优雅的文章多平台发布工具', 'ArtiPub（Article Publisher 的简称，意为“文章发布者”）是一款一文多发平台，可以帮助文章作者将编写好的文章自动发布到掘金、SegmentFault、CSDN、知乎与开源中国等技术媒体平台，传播优...');
INSERT INTO `article` VALUES (16, '码云推荐 | mole 对战游戏系统 Mole2dConfrontationplatform', '本游戏系统主要是用于开发基于房间的对战竞技游戏，在 windows 下运行，对各种 windows 版本都有支持，对各类比赛、竞技都有很好的支持。');
INSERT INTO `article` VALUES (17, 'OSChina 周二乱弹 —— 富婆没一个好东西', '根本无心工作学习，只想尽快为祖国母亲庆生！');
INSERT INTO `article` VALUES (18, 'KDE Plasma 下一个 LTS 版本 5.18 将于 2020 年 2 月发布', '基于 Qt 5.12 和 KDE Frameworks 5.66 KDE 项目组已宣布 KDE Plasma 桌面环境的下一个 LTS 系列将是 KDE Plasma 5.18，并计划于明年年初发布（暂定的具体日期为 2020 年 2 月 11 日）。在发布...');
INSERT INTO `article` VALUES (19, 'ReactOS 0.4.12 发布，Windows 系统的开源替代方案', 'ReactOS 团队发布了 ReactOS 0.4.12，先来看看值得关注的更新亮点： 内核改进 文件系统驱动程序需要大量支持才能正确运行，并且可以说，没有比运行 Microsoft 自己的 FS 驱动更好的测试 Reac...');
INSERT INTO `article` VALUES (20, 'Spring Batch 4.2.0.RC1 发布，改进性能', 'Spring Batch 4.2.0.RC1 已发布，这是一个使用 Spring 和 Java 编写离线和批处理应用程序的框架。本次更新主要针对核心框架的性能方面进行了改进。 接下来了解一下具体的改进内容，总共包括四...');
INSERT INTO `article` VALUES (21, '数十万 PhpStudy 用户被植入后门，快来检测你是否已沦为“肉鸡”！', '北京时间9月20日，杭州公安发布《杭州警方通报打击涉网违法犯罪暨‘净网2019’专项行动战果》一文，文章曝光了国内知名PHP调试环境程序集成包“PhpStudy软件”遭到黑客篡改并植入“后门”。截...');
INSERT INTO `article` VALUES (22, '高手问答第 233 期 —— 图数据库的设计和实践', '图数据库是一种非关系型数据库，用以解决现有关系数据库的局限性。它是一个使用图结构进行语义查询的数据库，它使用节点、边和属性来表示和存储数据。');
INSERT INTO `article` VALUES (23, '云原生生态：Oracle 宣布永久免费一部分云计算服务', 'Oracle CEO Larry Ellison 在 OpenWorld 大会上宣布推出了 Oracle Cloud Free Tier ，大小型公司和组织、开发人员、学生和教育工作者都可以构建、学习和探索 Oracle 自治数据库和 Oracle 云基...');
INSERT INTO `article` VALUES (24, 'RMS 卸任，Red Hat 敦促 FSF 任命更多元化主席', '上周开源/自由软件界突发大事件，全球知名黑客、自由软件运动发起人，同时也是自由软件基金会（FSF，Free Software Foundation）创始人与主席的 Richard M. Stallman（RMS）辞去了主席职务并...');
INSERT INTO `article` VALUES (25, 'Google 移除两款劫持 Cookie 信息的 Chrome 广告屏蔽插件', '被移除的插件分别“山寨”了两款主流的广告屏蔽插件 —— Adblock Plus 和 uBlock。 屏蔽浏览网页时出现的广告长期以来都是网民的刚需，正因如此，用户在安装浏览器后往往都会顺便装上一个广...');
INSERT INTO `article` VALUES (26, '效力微软 15 年的前员工解释 Windows 10 为什么问题如此多', '众所周知 Windows 10 系统问题频发，整体来说稳定性比较差，然而在此之前的版本其实相对来说稳定性还挺好的。自从 Windows 10 正式版推出之时，该系统就开始频繁出现问题，乃至现在每个月安全...');
INSERT INTO `article` VALUES (27, '每日一博 | JVM 优化之逃逸分析与分配消除', '要了解逃逸分析背后的基本原理，我们先来看下这段有问题的 C 代码——当然这个是没法用 Java 来写的：');
INSERT INTO `article` VALUES (28, 'ArtiPub —— 优雅的文章多平台发布工具', 'ArtiPub（Article Publisher 的简称，意为“文章发布者”）是一款一文多发平台，可以帮助文章作者将编写好的文章自动发布到掘金、SegmentFault、CSDN、知乎与开源中国等技术媒体平台，传播优...');
INSERT INTO `article` VALUES (29, '码云推荐 | mole 对战游戏系统 Mole2dConfrontationplatform', '本游戏系统主要是用于开发基于房间的对战竞技游戏，在 windows 下运行，对各种 windows 版本都有支持，对各类比赛、竞技都有很好的支持。');
INSERT INTO `article` VALUES (30, 'OSChina 周二乱弹 —— 富婆没一个好东西', '根本无心工作学习，只想尽快为祖国母亲庆生！');
INSERT INTO `article` VALUES (31, '每日一博 | 测试驱动开发（TDD）入门', '本文不打算扯过多的理论，而是通过操练的方式，带着大家去操练一下，让同学们切身感受一下 TDD，究竟是怎么玩的。');
INSERT INTO `article` VALUES (32, 'Tamgu（탐구）——函数式、命令式与逻辑一体化编程语言', '使用 Tamgu，可以对于编程中的每个特定问题，选择最合适的形式，并自由地混合函数式、命令式和逻辑方法，以实现最具表现力但最紧凑的代码。');
INSERT INTO `article` VALUES (33, '腾讯游戏部门开源 DevOps 系列项目“蓝鲸”', '蓝鲸智云（蓝鲸）是腾讯游戏运营部“腾讯智营”下的一个子品牌，它是一套基于 PaaS 的技术解决方案，提供了完善的前后台开发框架、调度引擎与公共组件等模块，可以帮助业务的产品和技术人员快...');
INSERT INTO `article` VALUES (34, '谷歌推出 Kotlin 免费在线课程', '近日，我们报道微软推出 Python 免费在线视频教程，该课程名为 Python for Beginners，为 Python 初学者提供学习材料。无独有偶，谷歌也宣布推出两个 Kotlin 免费在线课程，正如苹果将 iOS ...');
INSERT INTO `article` VALUES (35, 'VS Code Python 将支持 Jupyter Notebook', '9 月 21 日，在 PyCon China 2019 上，来自微软开发工具事业部的资深研发工程师韩骏宣布了一项 VS Code Python 的全新功能：Visual Studio Code Python 插件将提供 Jupyter Notebook 原生支持...');
INSERT INTO `article` VALUES (36, 'OSChina 周一乱弹 —— 产品经理和程序员是夫妻？', '产品经理和程序员是夫妻么？可还在一个公司上班？这科学么？');
INSERT INTO `article` VALUES (37, 'Java 13发布、清华学生手写CPU+编译器+OS、Oracle全球首个自治OS', '【一周热点】Chrome 77 发布、国家计算机病毒中心发布违规 APP 和 SDK 名单、Linux 智能手表、RMS 从自由软件基金会与 MIT 离职、LLVM 9.0 发布、微软开源新字体 Cascadia Code...');
INSERT INTO `article` VALUES (38, 'NPM CEO 宣布离职，为 npm 商业化背锅？', '当地时间 9 月 20 日，npm 背后的公司 NPM CEO Bryan Bogensberger 宣布离职，董事会开始寻找候选人。 \r\nhttps://twitter.com/npmjs/status/1175095610602450944 npm 是 JavaScript 的包管理...');
INSERT INTO `article` VALUES (39, '码云推荐 | 人脸检测识别系统  Argus', '基于 YOLO v3、FaceNet 和 SVM 的人脸检测识别系统。');
INSERT INTO `article` VALUES (40, '微软开源其 C++ 标准库实现 STL', '微软近日宣布开源其 MSVC 的 C++ 标准库实现（也就是 STL），该库实现是 MSVC 工具集和 Visual Studio IDE 的一部分。 微软表示开源 STL 可以使开发者随时了解其发展情况，使用最新更新，并且...');
INSERT INTO `article` VALUES (41, '.NET Core 3.0 稳定版发布', '一年一度的 .NET 开发者盛会 .NET Conf 2019 在昨日（举办时间为 9.23-9.25）正式开始了。大会第一天最重磅也是最激动人心的消息莫过于 .NET Core 3.0 稳定版的发布。.NET 项目管理总监 Scot...');
INSERT INTO `article` VALUES (42, 'GoFrame v1.9.3 发布，Go 应用开发框架', '该版本实际为v2.0的大版本发布，为避免go module机制严格要求v2版本以上需要修改import并加上v2后缀，因此使用了v1.9版本进行发布。 新特性 新增gf命令行开发辅助工具：https://goframe.org...');
INSERT INTO `article` VALUES (43, 'PHPRAP 2.0.4 发布，新增字段模板功能', 'PHPRAP，是一个基于 YII2 框架开发的 PHP 轻量级开源 API 接口文档管理系统，致力于减少前后端沟通成本，提高团队协作开发效率，打造 PHP 版的 RAP。 更新记录 【新增】新增项目字段模板功能...');
INSERT INTO `article` VALUES (44, 'Mars-java 发布 2.1.7-hotfix 版本', '接着上一篇更新： https://www.oschina.net/news/110055/mars-java-2-1-7-released 由于2.1.7版本存在一些不完美的地方（只是不够完美，并非bug），所以紧急补推了这个版本 更新点如下： 原来...');
INSERT INTO `article` VALUES (45, 'BookStack v2.1 发布，功能类似 GitBook 和看云的在线文档管理系统', '程序介绍 BookStack，分享知识，共享智慧！知识，因分享，传承久远！ BookStack 是基于 Mindoc、使用Go语言的Beego框架开发的功能类似GitBook和看云的在线文档管理系统，实现了文档采集、导入...');
INSERT INTO `article` VALUES (46, 'BookChat v2.4 发布，通用书籍阅读微信小程序，最后一个原生开发版本', 'BookChat 介绍 BookChat - 面向程序员的开源书籍和文档阅读学习小程序，同时也是一款基于 Apache 2.0 开源协议进行开源的通用书籍阅读微信小程序。 它非常轻量，200KB 左右的大小，麻雀虽小五...');
INSERT INTO `article` VALUES (47, 'SpringBlade 2.5.0 发布，集成 Seata 支持分布式事务', '简介： SpringBlade 是由一个商业级项目升级优化而来的 SpringCloud 微服务架构，采用 Java8 API 重构了业务代码，完全遵循阿里巴巴编码规范。采用 Spring Boot 2 、Spring Cloud Greenwich ...');
INSERT INTO `article` VALUES (48, 'KDE Plasma 下一个 LTS 版本 5.18 将于 2020 年 2 月发布', '基于 Qt 5.12 和 KDE Frameworks 5.66 KDE 项目组已宣布 KDE Plasma 桌面环境的下一个 LTS 系列将是 KDE Plasma 5.18，并计划于明年年初发布（暂定的具体日期为 2020 年 2 月 11 日）。在发布...');
INSERT INTO `article` VALUES (49, 'ReactOS 0.4.12 发布，Windows 系统的开源替代方案', 'ReactOS 团队发布了 ReactOS 0.4.12，先来看看值得关注的更新亮点： 内核改进 文件系统驱动程序需要大量支持才能正确运行，并且可以说，没有比运行 Microsoft 自己的 FS 驱动更好的测试 Reac...');
INSERT INTO `article` VALUES (50, 'Spring Batch 4.2.0.RC1 发布，改进性能', 'Spring Batch 4.2.0.RC1 已发布，这是一个使用 Spring 和 Java 编写离线和批处理应用程序的框架。本次更新主要针对核心框架的性能方面进行了改进。 接下来了解一下具体的改进内容，总共包括四...');
INSERT INTO `article` VALUES (51, 'DBeaver 社区版 6.2.1 发布，可视化数据库管理工具', 'DBeaver 社区版 6.2.1 已发布。 值得关注的更新 Data viewer： 改进了空间（GIS）的表示方式（工具提示、不同列的不同形状颜色） 改善 JSON 渲染性能 修复 XML 值查看器 修复 XML 自动格式化...');
INSERT INTO `article` VALUES (52, 'OnionShare 2.2 发布，匿名文件分享工具', 'OnionShare 是一个开源工具，可以让你安全和匿名地共享任何大小的文件。2.2 已经发布，内容如下： 网站模式(Website mode)，它允许将静态 HTML 网站发布为洋葱服务(onion service) 允许在共享...');
INSERT INTO `article` VALUES (53, 'Material UI 4.4.3 发布，Material Design React 组件', 'Material UI 4.4.3 发布了，Material UI 是一组实现 Google Material Design 规范的 React 组件，它是一个前端 JS 框架，主要用在 Web 领域。 这是一个稳定版本，主要更新内容如下： @mater...');
INSERT INTO `article` VALUES (54, 'Puma 4.2.0 发布，关注高并发的 Ruby HTTP 服务器', 'Puma 4.2.0 发布了。Puma 是一个简单、快速、线程化并且关注高并发的 HTTP 1.1 服务器，适用于开发和生产中的 Ruby/Rack 应用。新版本更新内容如下： 6 个特性 Pumactl 具有一个新的 -e 环境...');
INSERT INTO `article` VALUES (55, 'Riot 4.6.0 发布，JavaScript 的 MVP 框架', 'Riot 4.6.0 发布了，更新内容如下： 修复了在<template>标签中呈现文本表达式的情况下的小写问题 更新改进了核心代码、编译器和 dom 绑定 通过<slot>属性添加对 HOC（高阶组件）组件的支持，...');
INSERT INTO `article` VALUES (56, 'Nim 1.0 发布，命令式编程语言', '就在今天，Nim团队非常荣幸地宣布万众期待的1.0语言版本。 Nim一直专注于提供高效、可读和灵活的静态编译类语言。 1.0版本标志可以在接下来的几年使用Nim的未来版本不会破坏当前版本的代码，...');
INSERT INTO `article` VALUES (57, '悟空 CRM（9.0版本）V9.0_20190923 更新【JAVA版】', '新增： 1. 角色权限按照应用模块分开授权 2. 仪表盘销售简报中，增加跟进记录可点击链接 3. 合同、回款模块增加“保存为草稿”操作按钮 4. 系统设置中增加应用模块管理，办公管理、客户管理、...');
INSERT INTO `article` VALUES (58, 'QQ 机器人平台 Newbe.Mahua 1.16、2.2 发布，可用性修复', '开篇一张图，功能全靠编。 QQ机器人平台意指那些支持通过QQ进行消息收发和群员软件平台。 使用该SDK开发可以实现一次开发，运行于多个不同QQ机器人平台平台的绝佳体验。 基于SDK开发，可以实...');
INSERT INTO `article` VALUES (59, '高性能网络通信框架 HP-Socket v5.6.1', '本次更新主要对 SSL、HTTP 和 UDP 系列组件作了优化和调整！ v5.6.1 更新 一、SSL 组件更新 所有 SSL 组件增加以下接口方法支持加载内存证书 \r\n1) Server：SetupSSLContextByMemory(), AddS...');
INSERT INTO `article` VALUES (60, 'uCharts 1.9.3 发布，高性能跨平台图表库', '支持图表类型 饼图 pie 圆环图 ring 线图 line（直线、曲线） 柱状图 column（分组、堆叠、温度计） 区域图 area（直线、曲线） 雷达图 radar 圆弧进度图 arcbar 仪表盘 gauge K线图 candle...');
INSERT INTO `article` VALUES (61, '易观开源项目 EasyScheduler 进入 Apache 基金会孵化器', '近日，分布式任务调度引擎 DolphinScheduler（原 EasyScheduler）通过 Apache 软件基金会（ASF）的投票决议，正式成为 Apache 孵化器项目。 https://incubator.apache.org/projects/dolphins...');
INSERT INTO `article` VALUES (62, 'End Software Patents，反对软件专利，你觉得怎么样？', '近日 End Software Patents 网站被顶到 Reddit Programming 头条，该网站旨在“取消软件专利”。 “End Software Patents”（ESP）认为软件专利伤害了每个人，20 年来，没有开发人员可以在不...');
INSERT INTO `article` VALUES (63, '9月数据库排行：Microsoft SQL Server 分数罕见下滑', 'DB-Engines 数据库流行度排行榜 9 月更新已发布，排名前二十如下： 明显能看出来，整体排名和上个月的保持一致。而上个月出现分数下跌的 PostgreSQL 和 MongoDB 终于“回归正道”，分数有了稍...');
INSERT INTO `article` VALUES (64, '8月数据库排行：Oracle 节节攀升，PG 和 MongoDB 分数再现下跌', 'DB-Engines 数据库流行度排行榜 8 月更新已发布，排名前二十如下： 整体排名和上个月的基本保持一致，其中最引人注目的变化是 PostgreSQL 和 MongoDB 这两个一直保持上升趋势的数据库罕见地再...');
INSERT INTO `article` VALUES (65, '摩尔定律已死，Raja 定律取而代之：每十年性能提升10倍', '在半导体行业，摩尔定律的大名无人不知无人不晓，这是 Intel 联合创始人戈登·摩尔在 1965 年提出的一个规律，最初指的是半导体芯片每年晶体管密度翻倍，性能翻倍，后来修为每2年晶体管翻倍，...');
INSERT INTO `article` VALUES (66, '工信部废止《关于组织开展计算机技术与软件专业技术资格（水平）证书登记工作的通知》部分文件', '工信部关于废止《关于组织开展计算机技术与软件专业技术资格（水平）证书登记工作的通知》等四个文件的通知已经发布。 工业和信息化部办公厅关于废止部分文件的通知 工信厅人〔2019〕50号 各...');
INSERT INTO `article` VALUES (67, '赛门铁克和博通停止交易谈判，前者不接受每股低于 28 美元', '不久前，芯片制造商 Broadcom 公司就收购网络安全公司 Symantec 进行谈判。 据 CNBC 报道称，赛门铁克和博通现已停止交易谈判，有知情人士表示，赛门铁克不会接受低于每股 28 美元的股价。 ...');
INSERT INTO `article` VALUES (68, '巨杉数据库与深度操作系统合作共建基础软件技术生态', '近日，巨杉数据库与深度操作系统完成互认证工作，建立全面技术合作，共同推进国内基础软件生态的建设。 经双方共同严格测试，SequoiaDB 巨杉数据库与深度操作系统ARM服务器版软件V15共同稳定...');
INSERT INTO `article` VALUES (69, 'IBM 收购 Red Hat 是个错误', '昨天 IBM 正式完成收购 Red Hat，对于这单影响深远的科技界收购案，不少人看好，当然也有人看衰，本文作者 Crispus Nyaga 是 Seeking Alpha 网站的金融栏目博客主，他就认为“IBM 收购 Red ...');
INSERT INTO `article` VALUES (70, 'IBM 完成对 Red Hat 的收购', '当地时间 7 月 9 日，IBM 宣布最终以 340 亿美元完成对 Red Hat 的收购。 该交易是去年 10 月份宣布的，作为 IBM 100 多年光辉历史上最大的一笔交易，同时也是美国科技界历史上的第三大交易、...');
INSERT INTO `article` VALUES (71, '腾讯 TarsCloud 获得尖峰开源技术创新奖', '7月3日，由中国信息通信研究院主办的2019云计算开源产业大会在北京举办。腾讯开源独揽尖峰开源企业奖、尖峰开源技术创新奖（自主研发项目）、尖峰开源技术创新奖（基于社区版本二次开发项目）...');
INSERT INTO `article` VALUES (72, '扩展国产数据库生态，巨杉技术社区与恩墨学院建立全面合作', '2019年6月28日，巨杉技术社区与恩墨学院在深圳正式宣布全面合作，共同拓展国产数据库技术生态。 在新技术趋势下，原生分布式数据库将成为新一代数据架构的绝对核心，也是企业走向微服务、云化...');
INSERT INTO `article` VALUES (73, '突发！美国国会发函要求 Facebook 立即停止 Libra 项目', '文章来源：硅星人 “如果不立即停止该项目的实施，我们将面临一个一旦失败将会引发金融海啸的新体系。” 文 | 光谱 屋漏偏逢连夜雨。昨天总部刚发生毒性邮件事件的 Facebook，今天再遭重创。...');
INSERT INTO `article` VALUES (74, '彭博社：博通正在与赛门铁克洽谈收购事宜', '彭博社今日消息，知名芯片制造商 Broadcom 公司正在就收购网络安全公司 Symantec 事宜进行高级会谈，因为 Broadcom 希望寻找半导体业务之外的机会，以实现多元化经营。 据称，在彭博社报道这...');
INSERT INTO `article` VALUES (75, '最新数据库排行：Oracle 分数增长最多，Redis 持续下降', 'DB-Engines 数据库流行度排行榜 7 月更新已发布，排名前二十如下： 总体排名依旧是没有什么变化，虽然分数基本都有所增加，但可以看到，和去年同时期的相比，今年增加的分数稍显疲软。哪怕是...');
INSERT INTO `article` VALUES (76, 'ZDNS 发布基于龙芯的域名服务器和红枫 2.0', '域名国家工程研究中心（ZDNS）发布了首款搭载国产龙芯 CPU 的域名服务器，并同步发布了国产域名管理软件 “红枫系统” 2.0 版。 官方新闻稿称，“2.0 版本在根区数据更新、分发和加载等方面的...');
INSERT INTO `article` VALUES (77, 'KubeCon + CloudNativeCon + Open Source Summit 2019大会第二天看点不断!', '2019年6月24日，由CNCF和Linux基金会共同举办的KubeCon + CloudNativeCon + Open Source Summit 2019大会在上海世博中心盛大召开。来自全球各地的开源及云原生社区的采用者和技术专家齐聚于此...');
INSERT INTO `article` VALUES (78, 'Apache 基金会创始人、主席与执行副总裁三人离职', 'Apache 软件基金会（ASF）三名董事会成员辞职，包括联合创始人。 ASF 官方博客公布了该消息，递交辞呈的三人分别是 Jim Jagielski、Phil Steitz 和 Ross Gardler，上个月 ASF 董事会已经通过...');
INSERT INTO `article` VALUES (79, 'CNNIC 设立六台域名根镜像服务器', '根据工信部的通知，CNNIC 将设立六台域名根镜像服务器（F、I、K、L）。 这六台域名根服务器编号为 JX0001F、JX0002F、JX0003I、JX0004K、JX0005L 和 JX0006L。这不是中国第一次设立域名根镜像...');
INSERT INTO `article` VALUES (80, '首次！腾讯全面公开整体开源路线图', '6月25日，由 Cloud Native Computing Foundation (CNCF) 主办的云原生技术大会在上海举办，腾讯开源联盟主席、腾讯开源管理办公室委员、Apache Member 堵俊平首次公开了腾讯整体的开源战略路...');
INSERT INTO `article` VALUES (81, 'TIOBE 9月排行：PHP 排名在 TOP 10 边缘飘摇', 'TIOBE 编程语言排行榜 9 月份的榜单已公布，排名前十的分别是：Java, C, Python, C++, C#, Visual Basic .NET, JavaScript, SQL, PHP 和 Objective-C。 整体排名变化不大，但在 9 月榜单中 ...');
INSERT INTO `article` VALUES (82, 'IEEE Spectrum 2019 年度编程语言排行榜：Matlab 上榜', 'IEEE Spectrum 发布了 2019 年年度编程语言排行榜。 IEEE Spectrum 专为引领变革的先锋人士和积极探索问题解决方案的进步人士而设计，旨在探讨未来技术发展趋势及其对社会和商业的影响，主要...');
INSERT INTO `article` VALUES (83, 'PYPL 9 月编程语言排行榜发布，Python 一枝独秀', 'PYPL（PopularitY of Programming Language，编程语言流行指数）9 月份的榜单已经发布了。 PYPL 是非常流行的参考指标，其榜单数据的排名均是根据榜单对象在 Google 上相关的搜索频率进行统计...');
INSERT INTO `article` VALUES (84, 'TIOBE 8月排行：你说 Objective-C 将走向衰败，我不同意', 'TIOBE 编程语言排行榜 8 月更新已公布，排名前十的分别是：Java, C, Python, C++, C#, Visual Basic .NET, JavaScript, PHP, Objective-C 和 SQL。和上个月唯一的不同之处在于 Objective-C ...');
INSERT INTO `article` VALUES (85, 'TIOBE 7月排行：Perl 成为过分炒作 Python 的受害者？', 'TIOBE 编程语言排行榜 7 月更新已公布，排名前十的分别是：Java, C, Python, C++, C#, Visual Basic .NET, JavaScript, PHP, SQL 和 Objective-C。 和上个月的不同之处主要是 C# 以微弱的优势...');
INSERT INTO `article` VALUES (86, '迈向 Go 2 的下一步', 'Go 2 又有进展了，近日 Go 团队在博客公布了关于 Go 2 下一步的计划。根据此前的报道，所谓的 Go 2 并非一个单独的重大更新版本，而是通过“增量(incremental)更新”的方式以逐渐抵达 \"Go 2....');
INSERT INTO `article` VALUES (87, 'Java 13 进入 RDP 1，新特性有哪些？', 'Java 13（JDK 13）目前已经进入了 Rampdown Phase One（RDP 1）状态，该状态意味着特性已经冻结，接下来开启稳定版本库，并主要进行 bug 修复与功能增强。 按照生命周期，GA 版本将于 9 月 ...');
INSERT INTO `article` VALUES (88, 'TIOBE 6月排行：Python 排名飙升，有望挤下 C 和 Java？', 'TIOBE 编程语言排行榜 6 月更新已发布，排名前十的分别是：Java, C, Python, C++, Visual Basic .NET, C#, JavaScript, PHP, SQL 和汇编语言。 值得关注的亮点包括： Python 排名再度超越 C+...');
INSERT INTO `article` VALUES (89, 'PYPL 6 月编程语言排行，Kotlin 与 PHP 亮了 ', 'PYPL 发布了 6 月份编程语言排行榜，榜单如下： PYPL 是非常流行的参考指标，其榜单数据的排名均是根据榜单对象在 Google 上相关的搜索频率进行统计排名，原始数据来自 Google Trends，也就是...');
INSERT INTO `article` VALUES (90, 'PHP 7.4 早期性能基准测试：与 7.3 差不多', 'PHP 7.4 目前正在积极开发中，准备添加到该版本的新特性包括短闭包、自定义对象序列化、FFI（Foreign Function Interface，外部函数接口）与扩展运算符等。 7.4 的首个 alpha 版本预计将于 ...');
INSERT INTO `article` VALUES (91, 'F# 换“山头”啦！现已迁移到 .NET 名下', '微软负责 .NET 的项目经理 Phillip 在博客宣布，他们已经将 F# 的 GitHub repo 从 microsoft/visualfsharp 迁移到 dotnet/fsharp，并按 corresponding RFC 中的规范来操作。 事实上，F# 的名...');
INSERT INTO `article` VALUES (92, 'PHP 早已不是十年前的模样', '开发者 Brent 发布了一篇文章，详细介绍了 2019 年的 PHP 是怎么样的。 原文地址：https://stitcher.io/blog/php-in-2019 Brent 承认 PHP 当前仍然存在一些问题，比如许多核心函数仍然有不一...');
INSERT INTO `article` VALUES (93, 'PHP 使用统计和市场定位最新报告', 'PHP 作为一门随时都能引起话题的编程语言，是否真的如某些语言排行榜显示的那样，正在走下坡路？不妨根据 W3Techs 提供的数据和报告，看看 PHP 最新的使用统计和市场定位情况。 W3Techs 是一...');
INSERT INTO `article` VALUES (94, '除了 async 速度翻 10 倍，JavaScript 还带来了什么？', '今天的 JavaScript 已经无处不在了，以传统的方式使用 JavaScript，开发者可以在各种 Web 浏览器中创建 Web 应用；通过 Node.js，可以开发命令行工具与服务器等应用；而在桌面领域，通过基于...');
INSERT INTO `article` VALUES (95, 'Android 开发者应该从 Java 转到 Kotlin 吗？谷歌告诉你', '今年 I/O 大会上，谷歌宣布正在采取的下一个重大步骤是 Kotlin-first，Android 开发将越来越多地以 Kotlin 为主，许多新的 Jetpack API 和功能将首先在 Kotlin 中提供。并且当天谷歌就开源了...');
INSERT INTO `article` VALUES (96, '5月语言排行榜：R 跌出前二十，Python 紧咬 C++', 'TIOBE 今天公布了2019年5月编程语言排行榜，总体排名变化不大，排名前十的依旧是：Java, C, C++, Python, Visual Basic .NET, C#, JavaScript, SQL, PHP 和汇编语言。 本月值得关注的亮点包括...');
INSERT INTO `article` VALUES (97, '编程语言之父谈语言设计，龟叔大赞 TypeScript', '争论哪门编程语言孰优孰劣，长期以来都是程序员乐此不疲的“娱乐活动”。之所以说是娱乐活动，因为这些争论到最后往往只是各自在发泄情绪，再则就是，脱离使用场景去讨论所谓哪门语言更好并没...');
INSERT INTO `article` VALUES (98, '红帽接手维护 OpenJDK 8 和 OpenJDK 11', '在 Oracle 退出和变更许可后，红帽宣布接手维护 OpenJDK 8 和 OpenJDK 11，为这两个 OpenJDK 的旧版本提供错误修复和安全补丁。 Oracle 分别在 2014 年 3 月和 2018 年 9 月发布了 JDK 8 和 ...');
INSERT INTO `article` VALUES (99, '4月编程语言排行榜：C++ 重回前三，PHP 呈下降势头', 'TIOBE 公布了2019年4月编程语言排行榜，总体排名变化不大，排名前十的分别是：Java, C, C++, Python, Visual Basic .NET, C#, JavaScript, SQL, PHP 和汇编语言。 不过与上期相比，依然有值得...');
INSERT INTO `article` VALUES (100, ' PYPL 4 月排行：Python 最流行，Java 还行不行？', 'PYPL 发布了 4 月份的编程语言排行榜。 前五的分别是：Python、Java、Javascript、C# 和 PHP。可以看到，榜单没有什么大变化，但是相比去年 4 月份，Python 市场份额在今年上涨了 5.2%，成绩...');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `face_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人脸信息\r\n',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'tylt', '123', NULL);

SET FOREIGN_KEY_CHECKS = 1;
