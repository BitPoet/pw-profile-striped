# --- WireDatabaseBackup {"time":"2018-03-14 16:44:47","user":"","dbName":"pwblog","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '160');

DROP TABLE IF EXISTS `field_blog_body`;
CREATE TABLE `field_blog_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_body` (`pages_id`, `data`) VALUES('1028', '<p>This blog profile is built upon kongondo\'s <a href=\"https://modules.processwire.com/modules/process-blog/\">blog module</a>, but a lot of things have been changed, removed or extended. The layout was taken from the free responsive <a href=\"https://html5up.net/striped\">Striped</a> template at <a href=\"https://html5up.net/\">html5up.net</a>.</p>\n\n<p>The target group for this site profile are travel bloggers that want to have a feature rich layout and the option to list and read posts in ascending chronological order (something that most blog designs, no matter on which platform, are sorely lacking).</p>\n\n<p><strong>Setting up your blog:</strong></p>\n\n<ul>\n	<li>Adjust the settings on the <a href=\"../../processwire/page/edit/?id=1027\">Settings</a> page, this is where most of the generic settings that affect the whole blog are kept (title, copyright, color settings, logo, result limits, widgets, email for contact form etc.)</li>\n	<li>You should create an extra user for blogging with blog-author and page-edit permissions (or multiple users). Put the name that should be displayed on the frontend in the Display name field</li>\n	<li>Start blogging</li>\n</ul>\n\n<p><strong>The Home page:</strong></p>\n\n<p>The home page shows a three-column layout with images and teasers. The image shown is the first image (or a grey box if none found) for the post. You can sort the post\'s images in the backend page editor.</p>\n\n<p>Posts have a \"Blog Sticky Flag for Home\" checkbox. Posts with this flag are always shown first on the home page, so if you check that box in too many posts, other, newer posts won\'t make their way onto the home page!</p>\n\n<p><strong>The Search:</strong></p>\n\n<p>The built-in search searches through title, summary and body of posts. If multiple terms are entered, all of them have to be found, but they may be spread over multiple fields.</p>\n\n<p><strong>Post Lists:</strong></p>\n\n<p>All post lists are limited to show only as many excerpts as configured in the Settings page at one and provide pagination. This pagination is built upon ProcessWire\'s built-in pagination modules but uses a bit of hackery behind the scenes to make it adhere to the styles provided with the Striped theme.</p>\n\n<p><strong>Advanced:</strong></p>\n\n<ul>\n	<li>You can sort the order of widgets in the settings page</li>\n	<li>To create a new sidebar widget:\n	<ul>\n		<li>create a new php file blog-WIDGETNAME.php in site/templates</li>\n		<li>create a new template for that in the backend using the same fields as blog-widget-basic</li>\n		<li>edit your php file, it needs to return:\n		<ul>\n			<li>a wrapping tag \"section\" with css class \"box\"</li>\n			<li>inside that, a \"header\" tag (if you want to show a headline for your widget) with the h2 tag containing the label</li>\n			<li>the html for the widget content</li>\n			<li>you can look into the shipped widgets like blog-recent-posts.php, blog-recent-comments.php, blog-copyright.php etc. for inspiration</li>\n		</ul>\n		</li>\n		<li>create a new page under Widgets with your template and publish it</li>\n		<li>add the new widget page to the widgets on the Settings page</li>\n	</ul>\n	</li>\n	<li>LanguageSupport has been installed and the blog templates with translatable strings already added, so you can translate or customize those right away</li>\n</ul>\n\n<p><strong>Files:</strong></p>\n\n<p>Feel free to adapt the styles/blog.css and styles/blog.js files in the templates directory to your liking.</p>\n\n<p>The \"assets\" dir inside templates comes from the HTML5 template used and was copied as-is.</p>');
INSERT INTO `field_blog_body` (`pages_id`, `data`) VALUES('1047', '<p>Leave me a message here with your email address and I will try to get back to you as soon as possible.</p>');
INSERT INTO `field_blog_body` (`pages_id`, `data`) VALUES('1046', '<p>Welcome to this blog.</p>');

DROP TABLE IF EXISTS `field_blog_categories`;
CREATE TABLE `field_blog_categories` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_categories` (`pages_id`, `data`, `sort`) VALUES('1028', '1029', '0');

DROP TABLE IF EXISTS `field_blog_comments`;
CREATE TABLE `field_blog_comments` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `cite` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL,
  `created_users_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `website` varchar(250) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) DEFAULT NULL,
  `subcode` varchar(40) DEFAULT NULL,
  `upvotes` int(10) unsigned NOT NULL DEFAULT '0',
  `downvotes` int(10) unsigned NOT NULL DEFAULT '0',
  `stars` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_id_sort` (`pages_id`,`sort`),
  KEY `status` (`status`,`email`),
  KEY `pages_id` (`pages_id`,`status`,`created`),
  KEY `created` (`created`,`status`),
  KEY `code` (`code`),
  KEY `subcode` (`subcode`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_comments_max`;
CREATE TABLE `field_blog_comments_max` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_comments_view`;
CREATE TABLE `field_blog_comments_view` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_comments_votes`;
CREATE TABLE `field_blog_comments_votes` (
  `comment_id` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`,`ip`,`vote`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_date`;
CREATE TABLE `field_blog_date` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_date` (`pages_id`, `data`) VALUES('1028', '2018-03-12 15:17:00');

DROP TABLE IF EXISTS `field_blog_files`;
CREATE TABLE `field_blog_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_header_fgcolor`;
CREATE TABLE `field_blog_header_fgcolor` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(6) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_header_fgcolor` (`pages_id`, `data`) VALUES('1027', 'CFE2FF');

DROP TABLE IF EXISTS `field_blog_header_image`;
CREATE TABLE `field_blog_header_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_header_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1027', '03_panorama_jochl.jpg', '0', '', '2018-03-14 09:03:02', '2018-03-14 09:03:02', '');

DROP TABLE IF EXISTS `field_blog_header_outlinecolor`;
CREATE TABLE `field_blog_header_outlinecolor` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(6) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_headline`;
CREATE TABLE `field_blog_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_headline` (`pages_id`, `data`) VALUES('1027', 'My Travel Blog');

DROP TABLE IF EXISTS `field_blog_href`;
CREATE TABLE `field_blog_href` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_blog_images`;
CREATE TABLE `field_blog_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1028', '05_blick_martin_busch_hutte.jpg', '0', '', '2018-03-14 12:25:11', '2018-03-14 12:25:11', '');
INSERT INTO `field_blog_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1028', 'pic01.jpg', '1', '', '2018-03-12 16:56:16', '2018-03-12 16:56:16', '');

DROP TABLE IF EXISTS `field_blog_links`;
CREATE TABLE `field_blog_links` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_links` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1052', '', '0', '1053');

DROP TABLE IF EXISTS `field_blog_note`;
CREATE TABLE `field_blog_note` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_note` (`pages_id`, `data`) VALUES('1027', '2018 By Me');

DROP TABLE IF EXISTS `field_blog_numitems`;
CREATE TABLE `field_blog_numitems` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_numitems` (`pages_id`, `data`) VALUES('1027', '10');

DROP TABLE IF EXISTS `field_blog_post_sticky`;
CREATE TABLE `field_blog_post_sticky` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_post_sticky` (`pages_id`, `data`) VALUES('1028', '1');

DROP TABLE IF EXISTS `field_blog_quantity`;
CREATE TABLE `field_blog_quantity` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_quantity` (`pages_id`, `data`) VALUES('1027', '6');
INSERT INTO `field_blog_quantity` (`pages_id`, `data`) VALUES('1034', '3');

DROP TABLE IF EXISTS `field_blog_small`;
CREATE TABLE `field_blog_small` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_small` (`pages_id`, `data`) VALUES('1027', '400');

DROP TABLE IF EXISTS `field_blog_summary`;
CREATE TABLE `field_blog_summary` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_summary` (`pages_id`, `data`) VALUES('1027', 'Welcome to my blog. Enjoy reading and go on a multitude of exhilarating adventures with me.');
INSERT INTO `field_blog_summary` (`pages_id`, `data`) VALUES('1028', 'This is an example blog entry that explains some of the things you want to know about this site profile. You should probably unpublish it and keep it around at first. Make sure to add an entry of your own before you do so, or a lot of things might stop working in a completely empty blog.');

DROP TABLE IF EXISTS `field_blog_tags`;
CREATE TABLE `field_blog_tags` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_tags` (`pages_id`, `data`, `sort`) VALUES('1028', '1030', '0');

DROP TABLE IF EXISTS `field_blog_widgets`;
CREATE TABLE `field_blog_widgets` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_blog_widgets` (`pages_id`, `data`, `sort`) VALUES('1027', '1034', '0');
INSERT INTO `field_blog_widgets` (`pages_id`, `data`, `sort`) VALUES('1027', '1035', '1');
INSERT INTO `field_blog_widgets` (`pages_id`, `data`, `sort`) VALUES('1027', '1051', '2');
INSERT INTO `field_blog_widgets` (`pages_id`, `data`, `sort`) VALUES('1027', '1054', '4');
INSERT INTO `field_blog_widgets` (`pages_id`, `data`, `sort`) VALUES('1027', '1059', '3');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1057', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1057', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language_files_site`;
CREATE TABLE `field_language_files_site` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--home-php.json', '15', '', '2018-03-14 15:44:21', '2018-03-14 15:44:21', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-tags-php.json', '14', '', '2018-03-14 15:44:16', '2018-03-14 15:44:16', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-tag-php.json', '13', '', '2018-03-14 15:44:10', '2018-03-14 15:44:10', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-sidebar-php.json', '12', '', '2018-03-14 15:44:07', '2018-03-14 15:44:07', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-search-php.json', '11', '', '2018-03-14 15:44:02', '2018-03-14 15:44:02', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-rss-php.json', '10', '', '2018-03-14 15:43:56', '2018-03-14 15:43:56', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-recent-comments-php.json', '8', '', '2018-03-14 15:40:14', '2018-03-14 15:40:14', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-recent-posts-php.json', '9', '', '2018-03-14 15:43:29', '2018-03-14 15:43:29', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-prevnext-php.json', '7', '', '2018-03-14 15:39:49', '2018-03-14 15:39:49', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-category-php.json', '6', '', '2018-03-14 15:39:26', '2018-03-14 15:39:26', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-categories-php.json', '5', '', '2018-03-14 15:38:49', '2018-03-14 15:38:49', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-articlelist-php.json', '4', '', '2018-03-14 15:38:05', '2018-03-14 15:38:05', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-articlelist-category-php.json', '2', '', '2018-03-14 15:36:24', '2018-03-14 15:36:24', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-articlelist-tag-php.json', '3', '', '2018-03-14 15:36:58', '2018-03-14 15:36:58', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--blog-article-php.json', '1', '', '2018-03-14 15:35:47', '2018-03-14 15:35:47', '');
INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1057', 'site--templates--ajax-php.json', '0', '', '2018-03-14 15:35:15', '2018-03-14 15:35:15', '');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1010', '159');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1012', '161');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1015', '163');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1056', '178');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1058', '179');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_scf_email`;
CREATE TABLE `field_scf_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_scf_message`;
CREATE TABLE `field_scf_message` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_scf_name`;
CREATE TABLE `field_scf_name` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_scf_website`;
CREATE TABLE `field_scf_website` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_sitemap_ignore`;
CREATE TABLE `field_sitemap_ignore` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_sitemap_ignore` (`pages_id`, `data`) VALUES('1048', '1');
INSERT INTO `field_sitemap_ignore` (`pages_id`, `data`) VALUES('1049', '1');
INSERT INTO `field_sitemap_ignore` (`pages_id`, `data`) VALUES('1027', '1');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Not Found');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1015', 'Blog');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1016', 'View Blog Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1018', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1019', 'Blog Links');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1020', 'Posts');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1021', 'Categories');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Tags');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1023', 'Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1024', 'Widgets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1025', 'Authors');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1026', 'Archives');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1027', 'Settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1028', 'Example Post');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1029', 'Example Category');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1030', 'Example Tag');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1031', 'Always Show Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1032', 'Disable New Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1033', 'Disable Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1034', 'Recent Posts');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1035', 'Recent Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1057', 'Default');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1038', 'Recent Tweets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1056', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('41', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1055', 'Administer languages and static translation files');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1054', 'Copyright');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1053', 'links');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1046', 'About This Blog');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1047', 'Contact');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1048', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1049', 'Ajax');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1052', 'Links');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'Calendar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1058', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1059', 'RSS feed');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'blog-archives');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'blog-authors');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'blog-basic');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'blog-categories');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'blog-category');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', 'blog-comments');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('103', 'blog-links');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', 'blog-post');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', 'blog-posts');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'blog-recent-comments');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'blog-recent-posts');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'blog-recent-tweets');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'blog-tag');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('110', 'blog-tags');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('111', 'blog-widgets');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('112', 'blog-widget-basic');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('113', 'repeater_blog_links');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('114', 'blog-settings');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('115', 'blog-general-settings');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('116', 'blog-contact');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'blog-search');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('118', 'ajax');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'blog-calendar');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('120', 'blog-copyright');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('121', 'blog-rss');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('122', 'language');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '100', '10', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '99', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '112', '8', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '103', '2', '{\"label\":\"Total Comments to show in widget\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '111', '1', '{\"label\":\"Widget Description\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '103', '2', '{\"label\":\"Total Posts to show in widget\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '111', '1', '{\"label\":\"Widget Description\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '110', '1', '{\"label\":\"Twitter Screen Name\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '111', '1', '{\"label\":\"Widget Description\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '106', '0', '{\"columnWidth\":50,\"label\":\"Website Title\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '106', '1', '{\"description\":\"You can use this (e.g. in the masthead) as a title for your blog.\",\"label\":\"Blog Title\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '114', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '115', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '116', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '111', '5', '{\"description\":\"An optional sentence or two of text that you can use as your blog\'s tagline.\",\"label\":\"Blog Tagline\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '110', '6', '{\"description\":\"Insert your copyright notice here.\",\"label\":\"Copyright\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '92', '7', '{\"description\":\"This email address will receive contact form submissions.\",\"label\":\"E-Mail Address for Contact Form\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '103', '8', '{\"label\":\"Quantity of posts to show on Blog homepage\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '124', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '113', '10', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '123', '11', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '125', '12', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '111', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '108', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '105', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '103', '2', '{\"label\":\"Comments per page in Comments page\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '101', '3', '{\"description\":\"Comments are visible by default. Individual post\'s setting overrides what you specify here.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '102', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '125', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '125', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '111', '2', '{\"label\":\"Widget Description\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '103', '3', '{\"label\":\"Total Tweets to show in widget\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '125', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '107', '1', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '111', '2', '{\"label\":\"Widget Description\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '125', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '128', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '1', '0', '{\"label\":\"Display name (first and last name)\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '115', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '106', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '104', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '98', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '106', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '114', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '116', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '125', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '106', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '98', '6', '{\"label\":\"Biography\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '105', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '108', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '101', '9', '{\"description\":\"Comments are visible by default. This setting overrides the global setting.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '108', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '111', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '111', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '98', '1', '{\"description\":\"Any text\\/html you want to show above the contact form.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '125', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '125', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '125', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '111', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '125', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '125', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '125', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '126', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '127', '2', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeTextarea', 'blog_body', '0', 'Body', '{\"rows\":10,\"inputfieldClass\":\"InputfieldCKEditor\",\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypePage', 'blog_categories', '0', 'Categories', '{\"description\":\"Select one or more categories below and drag to sort them in order of relevance. If you want a category that doesn\'t already exist, create a new one.\",\"tags\":\"-blog\",\"parent_id\":1021,\"template_id\":47,\"labelFieldName\":\"title\",\"addable\":1,\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypeComments', 'blog_comments', '0', 'Comments', '{\"collapsed\":2,\"deleteSpamDays\":3,\"moderate\":2,\"tags\":\"-blog\",\"schemaVersion\":6,\"redirectAfterPost\":1,\"quietSave\":1,\"useNotify\":2,\"depth\":2,\"useWebsite\":1,\"dateFormat\":\"relative\",\"useVotes\":0,\"useStars\":1,\"sortNewest\":1,\"notificationEmail\":\"field:createdUser.email\",\"notifySpam\":1,\"fromEmail\":\"processwire@whaleshark.fritz.box\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypePage', 'blog_comments_view', '0', 'Comments visibility', '{\"tags\":\"-blog\",\"derefAsPage\":1,\"findPagesCode\":\"return $page->path == \\\"\\/comments\\/\\\" ? $pages->get(1023)->children(\\\"id!=1031\\\") : $pages->get(1023)->children();\",\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldSelect\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypeInteger', 'blog_comments_max', '1', 'Maximum comments allowed per post', '{\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeInteger', 'blog_quantity', '1', 'Quantity of items to show', '{\"tags\":\"-blog\",\"zeroNotEmpty\":0,\"collapsed\":0,\"inputType\":\"text\",\"size\":10,\"clone_field\":\"blog_numitems\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeDatetime', 'blog_date', '1', 'Date', '{\"description\":\"This field will be automatically filled with the current time and date when your post is published. Unpublishing your post will not change the date. You can do so manually.\",\"dateOutputFormat\":\"j F Y g:i a\",\"dateInputFormat\":\"j F Y\",\"timeInputFormat\":\"g:i a\",\"datepicker\":3,\"size\":30,\"defaultToday\":0,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeFile', 'blog_files', '0', 'Files', '{\"collapsed\":2,\"entityEncode\":1,\"extensions\":\"pdf doc docx xls xlsx gif jpg jpeg png mp3 wav\",\"tags\":\"-blog\",\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypeText', 'blog_headline', '0', 'Headline', '{\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"maxlength\":1024,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeURL', 'blog_href', '1', 'Website URL', '{\"maxlength\":1024,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeImage', 'blog_images', '0', 'Images', '{\"collapsed\":2,\"entityEncode\":1,\"extensions\":\"gif jpg jpeg png\",\"adminThumbs\":1,\"tags\":\"-blog\",\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeRepeater', 'blog_links', '0', 'Links', '{\"tags\":\"-blog\",\"parent_id\":1019,\"template_id\":59,\"repeaterReadyItems\":3,\"repeaterFields\":[106,107]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypeText', 'blog_note', '1', 'Note', '{\"textformatters\":[\"TextformatterEntities\"],\"maxlength\":1024,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypeTextarea', 'blog_summary', '1', 'Summary', '{\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"rows\":3,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypePage', 'blog_tags', '0', 'Tags', '{\"tags\":\"-blog\",\"parent_id\":1022,\"template_id\":55,\"addable\":1,\"derefAsPage\":0,\"labelFieldName\":\"title\",\"operator\":\"%=\",\"searchFields\":\"title\",\"inputfield\":\"InputfieldPageAutocomplete\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('113', 'FieldtypeInteger', 'blog_small', '1', 'Posts truncate length', '{\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('114', 'FieldtypeImage', 'blog_header_image', '0', 'Blog Header Image', '{\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":0,\"outputFormat\":2,\"defaultValuePage\":0,\"useTags\":0,\"inputfieldClass\":\"InputfieldImage\",\"overwrite\":1,\"descriptionRows\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"maxWidth\":1600,\"resizeServer\":1,\"clientQuality\":90,\"fileSchema\":6,\"maxHeight\":151,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeColorPicker', 'blog_header_fgcolor', '0', 'Blog Header Font Color', '{\"description\":\"Font color for header text overlayed on the title image\",\"default\":\"FFFFFF\",\"formatting\":1,\"columnWidth\":50,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypeColorPicker', 'blog_header_outlinecolor', '0', 'Blog Header Font Outline Color', '{\"description\":\"Outline color for header text overlayed on the title image\",\"default\":\"000000\",\"formatting\":1,\"columnWidth\":50,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeText', 'scf_name', '0', 'Your Name', '{\"tags\":\"-scf\",\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"stripTags\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('118', 'FieldtypeText', 'scf_email', '0', 'Your Email', '{\"tags\":\"-scf\",\"required\":1,\"requiredAttr\":1,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"stripTags\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('119', 'FieldtypeTextarea', 'scf_message', '0', 'Your Message', '{\"tags\":\"-scf\",\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"stripTags\":1,\"rows\":5,\"required\":1,\"requiredAttr\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('121', 'FieldtypeText', 'scf_website', '0', '', '{\"collapsed\":4,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"tags\":\"-scf\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeCheckbox', 'blog_post_sticky', '0', 'Blog Sticky Flag for Home', '{\"description\":\"The newest 5 entries with this flag plus the newest non-flagged entry will be shown on the home page.\",\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('123', 'FieldtypePage', 'blog_widgets', '0', 'Blog Widgets', '{\"description\":\"Select the widgets to show in the sidebar\",\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"parent_id\":1024,\"labelFieldName\":\"title\",\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('124', 'FieldtypeInteger', 'blog_numitems', '1', 'Quantity of items to show in lists', '{\"tags\":\"-blog\",\"zeroNotEmpty\":0,\"collapsed\":0,\"inputType\":\"text\",\"size\":10}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypeCheckbox', 'sitemap_ignore', '0', 'Hide page from XML sitemap', '{\"description\":\"Hide this page and its children from the XML sitemap\",\"collapsed\":0,\"tags\":\"-blog\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('127', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1056,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('2', 'FieldtypeNumber', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('46', 'ProcessPage', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"title\",\"email\",\"roles\"],\"maxAjaxQty\":25}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"admin_theme\",\"email\",\"pass\",\"title\",\"admin_theme\",\"language\"]}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":16,\"coreVersion\":\"3.0.95\"}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2018-03-12 15:09:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'ProcessRecentPages', '1', '', '2018-03-12 15:09:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'AdminThemeUikit', '10', '', '2018-03-12 15:09:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'ProcessLogger', '1', '', '2018-03-12 15:10:08');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'InputfieldIcon', '0', '', '2018-03-12 15:10:08');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', 'ProcessBlog', '1', '{\"blogFullyInstalled\":1,\"blogStyle\":\"3\",\"schedulePages\":\"\",\"commentsUse\":1,\"templateFilesInstall\":\"3\",\"demoJS\":\"\",\"demoCSS\":\"\",\"tagTemplatesFields\":\"-blog\",\"quickPostEditor\":1,\"blog\":\"\",\"blog-posts\":1020,\"blog-categories\":1021,\"blog-tags\":1022,\"blog-comments\":1023,\"blog-widgets\":1024,\"blog-authors\":1025,\"blog-archives\":1026,\"blog-settings\":1027,\"blog-asc\":1031,\"blog-dnc\":1032,\"blog-dc\":1033,\"blog-rposts\":1034,\"blog-rcomments\":1035,\"blog-broll\":1036,\"blog-tweets\":1038,\"blog-pauthor\":1039}', '2018-03-12 15:15:43');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', 'MarkupBlog', '1', '', '2018-03-12 15:15:43');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'BlogPublishDate', '3', '', '2018-03-12 15:15:43');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('166', 'FieldtypeComments', '1', '', '2018-03-12 15:17:10');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'InputfieldCommentsAdmin', '0', '', '2018-03-12 15:17:10');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'FieldtypeRepeater', '3', '{\"repeatersRootPageID\":1018}', '2018-03-12 15:17:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'InputfieldRepeater', '0', '', '2018-03-12 15:17:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'InputfieldPageAutocomplete', '0', '', '2018-03-12 15:43:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('171', 'FieldtypeColorPicker', '1', '', '2018-03-12 19:55:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'InputfieldColorPicker', '0', '', '2018-03-12 19:55:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'SimpleContactForm', '3', '{\"sendEmails\":1,\"emailSubject\":\"New Blog Contact Form Submission\",\"emailTo\":\"noreply@server.com\",\"emailServer\":\"noreply@server.com\",\"emailReplyTo\":\"\",\"saveMessages\":\"\",\"saveMessagesParent\":false,\"saveMessagesTemplate\":null,\"saveMessagesScheme\":[\"\"],\"allFields\":[\"scf_name\",\"scf_email\",\"scf_message\"],\"addFields\":\"\",\"redirectSamePage\":1,\"redirectPage\":0,\"emailMessage\":\"Hi!\\n\\nYou have received a new message:\\n\\nName: %scf_name%,\\nMail: %scf_email%,\\n\\nMessage: %scf_message%,\\n\\nDate: %date%\\n\\nByeBye\",\"antiSpamTimeMin\":1,\"antiSpamTimeMax\":600,\"antiSpamPerDay\":3,\"antiSpamExcludeIps\":\"127.0.0.1\"}', '2018-03-12 20:12:15');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('174', 'AdminThemeReno', '10', '{\"colors\":\"\",\"avatar_field_user\":\"\",\"userFields_user\":\"title\",\"notices\":\"fa-bell\",\"home\":\"fa-home\",\"signout\":\"fa-power-off\",\"page\":\"fa-file-text\",\"setup\":\"fa-wrench\",\"module\":\"fa-briefcase\",\"access\":\"fa-unlock\",\"blog\":\"fa-file-text-o\"}', '2018-03-13 07:02:44');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('175', 'MarkupSitemapXML', '3', '', '2018-03-14 13:16:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('176', 'MarkupCache', '3', '', '2018-03-14 13:16:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('177', 'LanguageSupport', '35', '{\"languagesPageID\":1056,\"defaultLanguagePageID\":1057,\"otherLanguagePageIDs\":[],\"languageTranslatorPageID\":1058}', '2018-03-14 13:28:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'ProcessLanguage', '1', '', '2018-03-14 13:28:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('179', 'ProcessLanguageTranslator', '1', '', '2018-03-14 13:28:48');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'backend', '1035', '2018-03-12 15:09:59', '40', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2018-03-12 15:10:12', '40', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2018-03-12 15:10:25', '40', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2018-03-12 15:10:23', '40', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '29', 'http404', '1035', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '3', '2018-03-12 15:09:26', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2018-03-14 15:07:35', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2018-03-14 13:28:48', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '2', '2018-03-12 15:09:26', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '41', '2018-03-12 15:09:26', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2018-03-12 15:09:26', '40', '2018-03-12 15:09:26', '40', '2018-03-12 15:09:26', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2018-03-12 15:09:26', '40', '2018-03-12 15:09:26', '40', '2018-03-12 15:09:26', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '3', '2', 'recent-pages', '1', '2018-03-12 15:09:59', '40', '2018-03-12 15:09:59', '40', '2018-03-12 15:09:59', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '31', '5', 'page-edit-recent', '1', '2018-03-12 15:09:59', '40', '2018-03-12 15:09:59', '40', '2018-03-12 15:09:59', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '22', '2', 'logs', '1', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-view', '1', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '31', '5', 'logs-edit', '1', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '40', '2018-03-12 15:10:08', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1015', '2', '2', 'blog', '1', '2018-03-12 15:15:43', '41', '2018-03-12 15:15:43', '41', '2018-03-12 15:15:43', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1016', '31', '5', 'blog', '1', '2018-03-12 15:15:43', '41', '2018-03-12 15:15:43', '41', '2018-03-12 15:15:43', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '30', '4', 'blog-author', '1', '2018-03-14 12:14:51', '41', '2018-03-12 15:17:27', '41', '2018-03-12 15:17:27', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1018', '2', '2', 'repeaters', '1036', '2018-03-12 15:17:27', '41', '2018-03-12 15:17:27', '41', '2018-03-12 15:17:27', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1019', '1018', '2', 'for-field-109', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '1', '51', 'posts', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1021', '1', '46', 'categories', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '1', '56', 'tags', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '1', '48', 'comments', '1', '2018-03-12 19:21:46', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1024', '1', '57', 'widgets', '1025', '2018-03-14 13:36:48', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1025', '1', '44', 'authors', '2049', '2018-03-14 15:06:24', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1026', '1', '43', 'archives', '2049', '2018-03-14 15:02:11', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1027', '1', '60', 'settings', '1025', '2018-03-14 14:33:44', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1028', '1020', '50', 'example-post', '1', '2018-03-14 16:43:42', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1029', '1021', '47', 'example-category', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1030', '1022', '55', 'example-tag', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1031', '1023', '45', 'always-show-comments', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1032', '1023', '45', 'disable-new-comments', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '1023', '45', 'disable-comments', '1', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1034', '1024', '53', 'recent-posts', '1', '2018-03-14 10:32:03', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1035', '1024', '52', 'recent-comments', '1', '2018-03-12 19:21:46', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1038', '1024', '54', 'recent-tweets', '1', '2018-03-12 19:21:46', '41', '2018-03-12 15:17:28', '41', '2018-03-12 15:17:28', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1055', '31', '5', 'lang-edit', '1', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1054', '1024', '66', 'copyright', '1', '2018-03-14 11:59:02', '41', '2018-03-14 11:59:00', '41', '2018-03-14 11:59:02', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1046', '1', '29', 'about', '1', '2018-03-12 20:07:08', '41', '2018-03-12 20:06:01', '41', '2018-03-12 20:06:01', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1047', '1', '62', 'contact', '1', '2018-03-14 13:13:06', '41', '2018-03-12 20:18:05', '41', '2018-03-12 20:18:05', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1048', '1', '63', 'search', '1', '2018-03-14 13:18:52', '41', '2018-03-12 22:11:34', '41', '2018-03-12 22:11:37', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1049', '1', '64', 'ajax', '1025', '2018-03-14 13:18:59', '41', '2018-03-13 06:28:25', '41', '2018-03-13 06:28:25', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1053', '1019', '2', 'for-page-1052', '17', '2018-03-14 11:57:36', '41', '2018-03-14 11:57:36', '41', '2018-03-14 11:57:36', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1051', '1024', '65', 'calendar', '1', '2018-03-14 10:23:39', '41', '2018-03-14 10:23:36', '41', '2018-03-14 10:23:39', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1058', '22', '2', 'language-translator', '1040', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1057', '1056', '68', 'default', '16', '2018-03-14 15:44:49', '41', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1056', '22', '2', 'languages', '16', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '41', '2018-03-14 13:28:48', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '1024', '49', 'links', '1', '2018-03-14 11:57:51', '41', '2018-03-14 11:57:36', '41', '2018-03-14 11:57:42', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1059', '1024', '67', 'rss-feed', '1', '2018-03-14 13:36:48', '41', '2018-03-14 13:36:37', '41', '2018-03-14 13:36:39', '4');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2018-03-12 15:09:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2018-03-12 15:09:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2018-03-12 15:10:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1014', '2', '2018-03-12 15:10:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1016', '2', '2018-03-12 15:15:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1017', '2', '2018-03-12 15:17:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1020', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1025', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1026', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1030', '56', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1031', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1032', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1033', '1', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1034', '57', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1035', '57', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1055', '2', '2018-03-14 13:28:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1038', '57', '2018-03-12 15:17:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1054', '57', '2018-03-14 11:59:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '57', '2018-03-14 11:57:37');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1046', '1', '2018-03-12 20:06:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1047', '1', '2018-03-12 20:18:05');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1048', '1', '2018-03-12 22:11:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1049', '1', '2018-03-13 06:28:25');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1051', '57', '2018-03-14 10:23:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1057', '2', '2018-03-14 13:28:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1059', '57', '2018-03-14 13:36:37');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1018', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1019', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1019', '1018');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '22');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1520862303,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1521038080,\"ns\":\"\\\\\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1521022442,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'blog-archives', '97', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Archives\",\"tags\":\"-blog\",\"modified\":1520864247}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'blog-authors', '98', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Authors\",\"tags\":\"-blog\",\"modified\":1521019870,\"noPrependTemplateFile\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'blog-basic', '99', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Basic\",\"tags\":\"-blog\",\"modified\":1520864248}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'blog-categories', '100', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"childTemplates\":[47],\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Categories\",\"tags\":\"-blog\",\"modified\":1521038080,\"ns\":\"\\\\\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'blog-category', '101', '0', '0', '{\"useRoles\":1,\"editRoles\":[1017],\"addRoles\":[1017],\"createRoles\":[1017],\"noChildren\":1,\"parentTemplates\":[46],\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Category\",\"tags\":\"-blog\",\"modified\":1521038080,\"ns\":\"\\\\\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', 'blog-comments', '102', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Comments (List)\",\"tags\":\"-blog\",\"modified\":1520864248}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('49', 'blog-links', '103', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Links\",\"tags\":\"-blog-widget\",\"modified\":1521028519}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', 'blog-post', '104', '0', '0', '{\"useRoles\":1,\"editRoles\":[1017],\"addRoles\":[1017],\"createRoles\":[1017],\"noChildren\":1,\"parentTemplates\":[51],\"allowChangeUser\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Post\",\"tags\":\"-blog\",\"modified\":1520915561,\"ns\":\"\\\\\",\"roles\":[37,1017]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', 'blog-posts', '105', '0', '0', '{\"noParents\":1,\"childTemplates\":[50],\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Posts\",\"tags\":\"-blog\",\"modified\":1521022272,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'blog-recent-comments', '106', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Recent Comments\",\"tags\":\"-blog-widget\",\"modified\":1521038080,\"noPrependTemplateFile\":1,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'blog-recent-posts', '107', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Recent Posts\",\"tags\":\"-blog-widget\",\"modified\":1521038080,\"noPrependTemplateFile\":1,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'blog-recent-tweets', '108', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Recent Tweets\",\"tags\":\"-blog-widget\",\"modified\":1521028519,\"noPrependTemplateFile\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'blog-tag', '109', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[56],\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Tag\",\"tags\":\"-blog\",\"modified\":1521023480,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'blog-tags', '110', '0', '0', '{\"useRoles\":1,\"editRoles\":[1017],\"addRoles\":[1017],\"createRoles\":[1017],\"noParents\":1,\"childTemplates\":[55],\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Tags\",\"tags\":\"-blog\",\"modified\":1521038080,\"ns\":\"\\\\\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('57', 'blog-widgets', '111', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widgets\",\"tags\":\"-blog\",\"modified\":1520864248}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('58', 'blog-widget-basic', '112', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Basic\",\"tags\":\"-blog\",\"modified\":1521019855,\"noPrependTemplateFile\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'repeater_blog_links', '113', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"compile\":3,\"tags\":\"-blog\",\"modified\":1520864248}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('60', 'blog-settings', '114', '0', '0', '{\"useRoles\":1,\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Settings\",\"tags\":\"-blog\",\"modified\":1521034377}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', 'blog-general-settings', '115', '0', '0', '{\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"tags\":\"-blog\",\"modified\":1521028422}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'blog-contact', '116', '0', '0', '{\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"tags\":\"-blog\",\"modified\":1521034889,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'blog-search', '117', '0', '0', '{\"noParents\":-1,\"allowPageNum\":1,\"slashUrls\":1,\"compile\":3,\"label\":\"Search Blog\",\"tags\":\"-blog\",\"modified\":1521038080,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('64', 'ajax', '118', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"tags\":\"-blog\",\"modified\":1521038937,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'blog-calendar', '119', '0', '0', '{\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Calendar\",\"tags\":\"-blog-widget\",\"modified\":1521029232,\"noPrependTemplateFile\":1,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('66', 'blog-copyright', '120', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: Copyright\",\"tags\":\"-blog-widget\",\"modified\":1521028519,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('67', 'blog-rss', '121', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"label\":\"Blog Widget: RSS Link\",\"tags\":\"-blog\",\"modified\":1521038080,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('68', 'language', '122', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"compile\":3,\"nameContentTab\":1,\"modified\":1521030528}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":43,"numCreateTables":49,"numInserts":595,"numSeconds":0}