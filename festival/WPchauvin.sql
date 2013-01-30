-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Client: smysql
-- Généré le: Mer 30 Janvier 2013 à 10:25
-- Version du serveur: 5.5.24-4-log
-- Version de PHP: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `WPchauvin`
--

-- --------------------------------------------------------

--
-- Structure de la table `fes_commentmeta`
--

CREATE TABLE IF NOT EXISTS `fes_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fes_comments`
--

CREATE TABLE IF NOT EXISTS `fes_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_comments`
--

INSERT INTO `fes_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'http://wordpress.org/', '', '2013-01-08 07:51:54', '2013-01-08 07:51:54', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fes_links`
--

CREATE TABLE IF NOT EXISTS `fes_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_custom_field_options`
--

CREATE TABLE IF NOT EXISTS `fes_mf_custom_field_options` (
  `custom_field_id` int(11) NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `default_option` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_custom_field_properties`
--

CREATE TABLE IF NOT EXISTS `fes_mf_custom_field_properties` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_mf_custom_field_properties`
--

INSERT INTO `fes_mf_custom_field_properties` (`custom_field_id`, `properties`) VALUES
(1, 'a:2:{s:4:"size";s:2:"25";s:17:"strict-max-length";s:1:"1";}');

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_module_groups`
--

CREATE TABLE IF NOT EXISTS `fes_mf_module_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duplicate` tinyint(1) NOT NULL,
  `expanded` tinyint(4) DEFAULT NULL,
  `at_right` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_mf_module_groups`
--

INSERT INTO `fes_mf_module_groups` (`id`, `panel_id`, `name`, `duplicate`, `expanded`, `at_right`) VALUES
(1, 1, '__default', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_panel_category`
--

CREATE TABLE IF NOT EXISTS `fes_mf_panel_category` (
  `panel_id` int(11) NOT NULL,
  `cat_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`panel_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fes_mf_panel_category`
--

INSERT INTO `fes_mf_panel_category` (`panel_id`, `cat_id`) VALUES
(1, 'films');

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_panel_custom_field`
--

CREATE TABLE IF NOT EXISTS `fes_mf_panel_custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `display_name` enum('true','false') COLLATE utf8_unicode_ci NOT NULL,
  `display_description` enum('true','false') COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `CSS` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_field` tinyint(4) DEFAULT NULL,
  `duplicate` tinyint(1) NOT NULL,
  `help_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_mf_panel_custom_field`
--

INSERT INTO `fes_mf_panel_custom_field` (`id`, `group_id`, `name`, `description`, `display_order`, `display_name`, `display_description`, `type`, `CSS`, `required_field`, `duplicate`, `help_text`) VALUES
(1, 1, 'test', 'Test', 0, 'true', 'true', 1, 'magicfields', 1, 1, 'Bienvenue sur l''aide');

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_panel_standard_field`
--

CREATE TABLE IF NOT EXISTS `fes_mf_panel_standard_field` (
  `panel_id` int(11) NOT NULL,
  `standard_field_id` int(11) NOT NULL,
  PRIMARY KEY (`panel_id`,`standard_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fes_mf_panel_standard_field`
--

INSERT INTO `fes_mf_panel_standard_field` (`panel_id`, `standard_field_id`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 14),
(1, 15),
(1, 16);

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_posttypes_taxonomies`
--

CREATE TABLE IF NOT EXISTS `fes_mf_posttypes_taxonomies` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT 'posttype',
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  `settings` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_post_meta`
--

CREATE TABLE IF NOT EXISTS `fes_mf_post_meta` (
  `id` int(11) NOT NULL,
  `group_count` int(11) NOT NULL,
  `field_count` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `field_name` text COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fes_mf_post_meta`
--

INSERT INTO `fes_mf_post_meta` (`id`, `group_count`, `field_count`, `post_id`, `field_name`, `order_id`) VALUES
(131, 1, 1, 86, 'test', 1),
(132, 1, 1, 47, 'test', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fes_mf_write_panels`
--

CREATE TABLE IF NOT EXISTS `fes_mf_write_panels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `single` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `capability_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expanded` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_mf_write_panels`
--

INSERT INTO `fes_mf_write_panels` (`id`, `name`, `single`, `description`, `display_order`, `capability_name`, `type`, `expanded`) VALUES
(1, 'Films', 0, NULL, 1, 'films', 'post', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fes_options`
--

CREATE TABLE IF NOT EXISTS `fes_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=276 ;

--
-- Contenu de la table `fes_options`
--

INSERT INTO `fes_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/~chauvin/festival', 'yes'),
(2, 'blogname', 'Festival LGBT', 'yes'),
(3, 'blogdescription', 'Les meilleurs films LGBT', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'simon.chauvin@etu.univ-orleans.fr', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '', 'yes'),
(10, 'comments_notify', '', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'closed', 'yes'),
(19, 'default_ping_status', 'closed', 'yes'),
(20, 'default_pingback_flag', '', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j F Y', 'yes'),
(23, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(24, 'links_updated_date_format', 'j F Y, G \\h i \\m\\i\\n', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '', 'yes'),
(29, 'moderation_notify', '', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:1:{i:0;s:21:"magic-fields/Main.php";}', 'yes'),
(36, 'home', 'http://localhost/~chauvin/festival', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '1', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:2:{i:0;s:79:"/mnt/home/chauvin/public_html/festival/wp-content/themes/twentytwelve/style.css";i:1;s:0:"";}', 'no'),
(44, 'template', 'twentytwelve', 'yes'),
(45, 'stylesheet', 'festival', 'yes'),
(46, 'comment_whitelist', '', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '22441', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '0', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:2:{i:2;a:3:{s:5:"title";s:9:"Programme";s:4:"text";s:718:"<ul style="font-size:10px;">\r\n<li><b>Vendredi 24 septembre : 20h00</b><br />\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.</li>\r\n<li><b>Samedi 25 septembre : 19h30</b><br />\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay & Lesbien – Loiret\r\nsur les interventions en milieu scolaire.</li>\r\n<li><b>Samedi 25 septembre : 21h45</b><br />\r\nFiction : Ander</li>\r\n<li><b>Dimanche 26 septembre : 16h00</b><br />\r\nFiction : El niño pez</li>\r\n<li><b>Dimanche 26 septembre : 18h00</b><br />\r\nFiction : I can’t think straight</li>\r\n</ul>\r\n";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '20', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'fes_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:64:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:4:"test";b:1;s:5:"films";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:6:"text-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1359575517;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1359618787;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1359619125;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:3:"3.5";s:12:"last_checked";i:1359537818;}', 'yes'),
(102, '_site_transient_update_plugins', 'O:8:"stdClass":1:{s:12:"last_checked";i:1359537848;}', 'yes'),
(105, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1359537879;}', 'yes'),
(106, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:34:"http://localhost/~chauvin/festival";s:4:"link";s:110:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/~chauvin/festival/";s:3:"url";s:143:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/~chauvin/festival/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:14:"Blog WordPress";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:46:"Autres actualités de WordPress (en français)";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(107, 'can_compress_scripts', '0', 'yes'),
(120, 'category_children', 'a:0:{}', 'yes'),
(126, 'theme_mods_twentytwelve', 'a:2:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1358779523;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:6:"text-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(127, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(161, 'recently_activated', 'a:0:{}', 'yes'),
(162, 'mf_custom_write_panel', 's:250:"a:8:{s:13:"condense-menu";i:0;s:25:"hide-non-standart-content";i:1;s:15:"hide-write-post";i:0;s:15:"hide-write-page";i:0;s:18:"hide-visual-editor";i:0;s:19:"prompt-editing-post";i:0;s:14:"assign-to-role";i:0;s:26:"default-custom-write-panel";s:0:"";}";', 'yes'),
(163, 'RC_CWP_BLOG_DB_VERSION', '8', 'yes'),
(164, 'RC_CWP_DB_VERSION', '8', 'yes'),
(165, 'MAGIC_FIELDS_fist_time', '1', 'yes'),
(205, 'current_theme', 'Festival', 'yes'),
(206, 'theme_mods_festival', 'a:8:{i:0;b:0;s:16:"header_textcolor";s:3:"444";s:16:"background_color";s:6:"e6e6e6";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}}', 'yes'),
(207, 'theme_switched', '', 'yes'),
(259, '_site_transient_timeout_wporg_theme_feature_list', '1359457628', 'yes'),
(260, '_site_transient_wporg_theme_feature_list', 'a:0:{}', 'yes'),
(264, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1359581072', 'no'),
(265, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p>', 'no'),
(266, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1359581072', 'no'),
(267, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(268, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1359581073', 'no'),
(269, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(270, '_site_transient_timeout_theme_roots', '1359539678', 'yes'),
(271, '_site_transient_theme_roots', 'a:4:{s:8:"festival";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(272, '_transient_timeout_plugin_slugs', '1359624284', 'no'),
(273, '_transient_plugin_slugs', 'a:3:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:21:"magic-fields/Main.php";}', 'no'),
(274, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1359581084', 'no'),
(275, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `fes_postmeta`
--

CREATE TABLE IF NOT EXISTS `fes_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=207 ;

--
-- Contenu de la table `fes_postmeta`
--

INSERT INTO `fes_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 2, '_edit_lock', '1359387255:1'),
(3, 2, '_edit_last', '1'),
(4, 6, '_edit_last', '1'),
(5, 6, '_edit_lock', '1359387231:1'),
(6, 6, '_wp_page_template', 'default'),
(7, 8, '_edit_last', '1'),
(8, 8, '_edit_lock', '1359387244:1'),
(9, 8, '_wp_page_template', 'default'),
(10, 15, '_menu_item_type', 'custom'),
(11, 15, '_menu_item_menu_item_parent', '0'),
(12, 15, '_menu_item_object_id', '15'),
(13, 15, '_menu_item_object', 'custom'),
(14, 15, '_menu_item_target', ''),
(15, 15, '_menu_item_classes', 'a:1:{i:0;s:8:"fg-rouge";}'),
(16, 15, '_menu_item_xfn', ''),
(17, 15, '_menu_item_url', 'http://localhost/~chauvin/festival'),
(19, 16, '_menu_item_type', 'taxonomy'),
(20, 16, '_menu_item_menu_item_parent', '0'),
(21, 16, '_menu_item_object_id', '1'),
(22, 16, '_menu_item_object', 'category'),
(23, 16, '_menu_item_target', ''),
(24, 16, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-bleu";}'),
(25, 16, '_menu_item_xfn', ''),
(26, 16, '_menu_item_url', ''),
(28, 17, '_menu_item_type', 'post_type'),
(29, 17, '_menu_item_menu_item_parent', '0'),
(30, 17, '_menu_item_object_id', '2'),
(31, 17, '_menu_item_object', 'page'),
(32, 17, '_menu_item_target', ''),
(33, 17, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-purple";}'),
(34, 17, '_menu_item_xfn', ''),
(35, 17, '_menu_item_url', ''),
(37, 18, '_menu_item_type', 'post_type'),
(38, 18, '_menu_item_menu_item_parent', '0'),
(39, 18, '_menu_item_object_id', '8'),
(40, 18, '_menu_item_object', 'page'),
(41, 18, '_menu_item_target', ''),
(42, 18, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-orange";}'),
(43, 18, '_menu_item_xfn', ''),
(44, 18, '_menu_item_url', ''),
(46, 19, '_menu_item_type', 'post_type'),
(47, 19, '_menu_item_menu_item_parent', '0'),
(48, 19, '_menu_item_object_id', '6'),
(49, 19, '_menu_item_object', 'page'),
(50, 19, '_menu_item_target', ''),
(51, 19, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-gris";}'),
(52, 19, '_menu_item_xfn', ''),
(53, 19, '_menu_item_url', ''),
(55, 20, '_edit_last', '1'),
(56, 20, '_edit_lock', '1359385263:1'),
(57, 20, '_wp_page_template', 'default'),
(58, 25, '_edit_last', '1'),
(59, 25, '_edit_lock', '1358242147:1'),
(62, 28, '_menu_item_type', 'taxonomy'),
(63, 28, '_menu_item_menu_item_parent', '0'),
(64, 28, '_menu_item_object_id', '2'),
(65, 28, '_menu_item_object', 'category'),
(66, 28, '_menu_item_target', ''),
(67, 28, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-vert";}'),
(68, 28, '_menu_item_xfn', ''),
(69, 28, '_menu_item_url', ''),
(72, 31, '_edit_last', '1'),
(73, 31, '_edit_lock', '1358242301:1'),
(75, 33, '_edit_last', '1'),
(76, 33, '_edit_lock', '1358242299:1'),
(78, 35, '_edit_last', '1'),
(79, 35, '_edit_lock', '1358242268:1'),
(81, 37, '_edit_last', '1'),
(82, 37, '_edit_lock', '1358242247:1'),
(84, 39, '_edit_last', '1'),
(85, 39, '_edit_lock', '1358242228:1'),
(87, 41, '_edit_last', '1'),
(88, 41, '_edit_lock', '1358242197:1'),
(90, 43, '_edit_last', '1'),
(91, 43, '_edit_lock', '1359387286:1'),
(93, 45, '_edit_last', '1'),
(94, 45, '_edit_lock', '1358242177:1'),
(96, 47, '_edit_last', '1'),
(97, 47, '_edit_lock', '1358242133:1'),
(99, 49, '_edit_last', '1'),
(100, 49, '_edit_lock', '1358242117:1'),
(102, 51, '_edit_last', '1'),
(103, 51, '_edit_lock', '1358242100:1'),
(110, 59, '_wp_attached_file', '2013/01/37_it_s_still_elementary.jpg'),
(111, 59, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:228;s:4:"file";s:36:"2013/01/37_it_s_still_elementary.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"37_it_s_still_elementary-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:36:"37_it_s_still_elementary-300x171.jpg";s:5:"width";i:300;s:6:"height";i:171;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(112, 59, '_wp_attachment_image_alt', 'It''s Still Elementary'),
(113, 45, '_thumbnail_id', '59'),
(122, 1, '_wp_trash_meta_status', 'publish'),
(123, 1, '_wp_trash_meta_time', '1358176448'),
(124, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(128, 86, '_edit_last', '1'),
(129, 86, '_edit_lock', '1358850205:1'),
(130, 86, '_mf_write_panel_id', '1'),
(131, 86, 'test', 'test'),
(133, 91, '_wp_attached_file', '2013/01/American-boy.png'),
(134, 91, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:500;s:4:"file";s:24:"2013/01/American-boy.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"American-boy-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:24:"American-boy-300x200.png";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"American-boy-624x416.png";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(135, 91, '_wp_attachment_image_alt', 'American boy'),
(136, 43, '_thumbnail_id', '91'),
(138, 93, '_wp_attached_file', '2013/01/ANDER1.jpg'),
(139, 93, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:422;s:4:"file";s:18:"2013/01/ANDER1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"ANDER1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"ANDER1-300x168.jpg";s:5:"width";i:300;s:6:"height";i:168;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"ANDER1-624x351.jpg";s:5:"width";i:624;s:6:"height";i:351;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(140, 93, '_wp_attachment_image_alt', 'ANDER1'),
(141, 47, '_thumbnail_id', '93'),
(143, 96, '_wp_attached_file', '2013/01/COWBOY-FOREVER.jpg'),
(144, 96, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:500;s:4:"file";s:26:"2013/01/COWBOY-FOREVER.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:5.5999999999999996;s:6:"credit";s:0:"";s:6:"camera";s:13:"Canon EOS 30D";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1153563697;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"110";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(145, 96, '_wp_attachment_image_alt', 'COWBOY FOREVER'),
(146, 41, '_thumbnail_id', '96'),
(148, 98, '_wp_attached_file', '2013/01/EL-NINO-PEZ-1.jpg'),
(149, 98, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:512;s:4:"file";s:25:"2013/01/EL-NINO-PEZ-1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-300x204.jpg";s:5:"width";i:300;s:6:"height";i:204;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-624x425.jpg";s:5:"width";i:624;s:6:"height";i:425;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(150, 98, '_wp_attachment_image_alt', 'EL NINO PEZ 1'),
(151, 49, '_thumbnail_id', '98'),
(153, 100, '_wp_attached_file', '2013/01/EN_COLO.jpg'),
(154, 100, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:491;s:4:"file";s:19:"2013/01/EN_COLO.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"EN_COLO-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"EN_COLO-300x196.jpg";s:5:"width";i:300;s:6:"height";i:196;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"EN_COLO-624x408.jpg";s:5:"width";i:624;s:6:"height";i:408;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.7999999999999998;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1243723185;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"48";s:3:"iso";s:4:"4000";s:13:"shutter_speed";s:5:"0.008";s:5:"title";s:0:"";}}'),
(155, 100, '_wp_attachment_image_alt', 'EN_COLO'),
(156, 31, '_thumbnail_id', '100'),
(159, 103, '_wp_attached_file', '2013/01/OMAR_.jpg'),
(160, 103, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:500;s:4:"file";s:17:"2013/01/OMAR_.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"OMAR_-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"OMAR_-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:17:"OMAR_-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:4;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1243445020;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"180";s:3:"iso";s:3:"800";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(161, 103, '_wp_attachment_image_alt', 'OMAR_'),
(162, 35, '_thumbnail_id', '103'),
(164, 105, '_wp_attached_file', '2013/01/Os-sapatos-de-Aristeu.jpg'),
(165, 105, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:500;s:4:"file";s:33:"2013/01/Os-sapatos-de-Aristeu.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"Os-sapatos-de-Aristeu-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:33:"Os-sapatos-de-Aristeu-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:33:"Os-sapatos-de-Aristeu-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:4;s:6:"credit";s:0:"";s:6:"camera";s:26:"Canon EOS DIGITAL REBEL XT";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1161573055;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"75";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(166, 105, '_wp_attachment_image_alt', 'Os sapatos de Aristeu'),
(167, 39, '_thumbnail_id', '105'),
(169, 107, '_wp_attached_file', '2013/01/PAULINE_1.jpg'),
(170, 107, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:500;s:4:"file";s:21:"2013/01/PAULINE_1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"PAULINE_1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:3.5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1242468669;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"50";s:3:"iso";s:3:"500";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";}}'),
(171, 107, '_wp_attachment_image_alt', 'PAULINE_1'),
(172, 33, '_thumbnail_id', '107'),
(175, 43, 'duree', '4 minutes'),
(176, 43, 'date', '2008'),
(178, 51, 'interpretation', 'Lisa Ray, Sheetal Sheth, Antonia Frering'),
(180, 49, 'interpretation', 'Inés Efron, Mariela Vitale, Pep Munne'),
(182, 47, 'interpretation', 'Josean Bengoetxea, Eriz Alberdi, Christian Esquive'),
(184, 45, 'duree', '01h20'),
(185, 45, 'realisation', 'Debra Chasnoff'),
(188, 41, 'date', '2006'),
(189, 41, 'duree', '26 minutes'),
(191, 39, 'duree', '17 minutes'),
(192, 39, 'sous-titre', 'VOSTF'),
(194, 37, 'date', '2006'),
(195, 37, 'duree', '10 minutes'),
(197, 35, 'date', '2009'),
(198, 35, 'duree', '9 minutes'),
(200, 33, 'duree', '7 minutes'),
(201, 33, 'date', '2009'),
(203, 31, 'date', '2009'),
(204, 31, 'duree', '8 minutes'),
(205, 86, '_wp_trash_meta_status', 'publish'),
(206, 86, '_wp_trash_meta_time', '1359537874');

-- --------------------------------------------------------

--
-- Structure de la table `fes_posts`
--

CREATE TABLE IF NOT EXISTS `fes_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- Contenu de la table `fes_posts`
--

INSERT INTO `fes_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-01-08 07:51:54', '2013-01-08 07:51:54', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'trash', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2013-01-14 16:14:08', '2013-01-14 15:14:08', '', 0, 'http://localhost/~chauvin/festival/?p=1', 0, 'films', '', 1),
(2, 1, '2013-01-08 07:51:54', '2013-01-08 07:51:54', '<p>Toutes les informations pratiques à propos du <strong>Festival LGBT</strong>.</p>\r\n<ul>\r\n	<li><b>Lieu du festival : </b> Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS</li>\r\n	<li><b>Tarifs :</b> \r\n<ul>\r\n	<li>Plein tarif : 7,50 €</li>\r\n	<li>Pass Festival : 25 € (5 séances)</li>\r\n	<li>Soirée courts métrages : 6 € (vendredi)</li>\r\n	<li>2 séances consécutives le samedi ou le dimanche : 12 €</li>\r\n</ul>\r\n</li>\r\n	<li><b>Cartes &amp; réductions acceptées :</b> <br />\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.</li>\r\n	<li><b>Equipe :</b> \r\n<ul>\r\n	<li><b>Direction artistique :</b>  Christel Guillard (Présidente de Ciné Mundi)</li>\r\n	<li><b>Programmation :</b>  Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)</li>\r\n	<li><b>Communication &amp; partenariats :</b>  Christel Guillard</li>\r\n	<li><b>Conception graphique :</b>  Yannis Bellair</li>\r\n	<li><b>Conception du site internet : </b> rccc</li>\r\n	<li><b>Impression : </b> Prevost Offset</li>\r\n</ul>\r\n</li>\r\n	<li>Contacts : <a href="mailto:festival.dunbordalautre@gmail.com" title="">festival.dunbordalautre@gmail.com</a> et <a href="http://www.festivaldunbordalautre.com" title="">www.festivaldunbordalautre.com</a></li>\r\n</ul>', 'Infos pratiques', '', 'publish', 'closed', 'closed', '', 'page-d-exemple', '', '', '2013-01-28 16:36:08', '2013-01-28 15:36:08', '', 0, 'http://localhost/~chauvin/festival/?page_id=2', 0, 'page', '', 0),
(4, 1, '2013-01-08 07:51:54', '2013-01-08 07:51:54', 'Voici un exemple de page. Elle est différente d&rsquo;un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/~chauvin/festival/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien&nbsp;!', 'Page d&rsquo;exemple', '', 'inherit', 'open', 'open', '', '2-revision', '', '', '2013-01-08 07:51:54', '2013-01-08 07:51:54', '', 2, 'http://localhost/~chauvin/festival/?p=4', 0, 'revision', '', 0),
(5, 1, '2013-01-14 16:37:47', '2013-01-14 15:37:47', '<p>Toutes les informations pratiques à propos du <strong>Festival LGBT</strong>.</p>\n<ul>\n	<li><b>Lieu du festival : </b> Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS</li>\n	<li><b>Tarifs :</b> \n<ul>\n	<li>Plein tarif : 7,50 €</li>\n	<li>Pass Festival : 25 € (5 séances)</li>\n	<li>Soirée courts métrages : 6 € (vendredi)</li>\n	<li>2 séances consécutives le samedi ou le dimanche : 12 €</li>\n</ul>\n</li>\n	<li><b>Cartes &amp; réductions acceptées :</b> <br />\nCartes DECOUVERTE &amp; PASSION,\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\ntous continents.</li>\n	<li>Equipe :\n<ul>\n	<li><b>Direction artistique :</b>  Christel Guillard (Présidente de Ciné Mundi)</li>\n	<li><b>Programmation :</b>  Christel Guillard en collaboration avec\nFrançoise Dahmane (Cinéma Les Carmes)</li>\n	<li><b>Communication &amp; partenariats :</b>  Christel Guillard</li>\n	<li><b>Conception graphique :</b>  Yannis Bellair</li>\n	<li><b>Conception du site internet : </b> rccc</li>\n	<li><b>Impression : </b> Prevost Offset</li>\n</ul>\n</li>\n	<li>Contacts : <a href="mailto:festival.dunbordalautre@gmail.com" title="">festival.dunbordalautre@gmail.com</a> et <a href="http://www.festivaldunbordalautre.com" title="">www.festivaldunbordalautre.com</a></li>\n</ul>', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '2-autosave', '', '', '2013-01-14 16:37:47', '2013-01-14 15:37:47', '', 2, 'http://localhost/~chauvin/festival/?p=5', 0, 'revision', '', 0),
(6, 1, '2013-01-08 08:59:25', '2013-01-08 07:59:25', '<p>Toute l''équipe du <b>Festival LGBT</b> tient à remercier tous ces organismes : </p>\r\n<ul>\r\n<li>La Région Centre</li>\r\n<li>La Mairie d''Orléans</li>\r\n<li>Le cinéma des Carmes</li>\r\n<li>Le Groupe Action Gay &amp; Lesbien - Loiret</li>\r\n<li>Citégay</li>\r\n<li>La dixième Muse</li>\r\n<li>Têtu</li>\r\n<li>Yagg.com</li>\r\n<li>France Bleu Orléans</li>\r\n<li>Bagdam Espace Lesbien ( Toulouse )</li>\r\n<li>Cineffable</li>\r\n<li>Le Festival Tous Courts ( Aix en Provence )</li>\r\n<li>Les VidéObstinées</li>\r\n</ul>\r\n', 'Remerciements', '', 'publish', 'closed', 'closed', '', 'remerciements', '', '', '2013-01-28 16:35:33', '2013-01-28 15:35:33', '', 0, 'http://localhost/~chauvin/festival/?page_id=6', 0, 'page', '', 0),
(7, 1, '2013-01-08 08:58:50', '2013-01-08 07:58:50', '', 'Remerciements', '', 'inherit', 'open', 'open', '', '6-revision', '', '', '2013-01-08 08:58:50', '2013-01-08 07:58:50', '', 6, 'http://localhost/~chauvin/festival/?p=7', 0, 'revision', '', 0),
(8, 1, '2013-01-08 08:59:36', '2013-01-08 07:59:36', '<p>Voici nos partenaires officiels : </p>\r\n<ul>\r\n<li>Région Centre</li>\r\n<li>Orléans</li>\r\n<li>Cinéma des Carmes</li>\r\n<li>GAGL</li>\r\n<li>Têtu</li>\r\n<li>La dixième MUSE</li>\r\n<li>CiteGay</li>\r\n<li>Yagg.com</li>\r\n<li>France Bleu</li>\r\n</ul>\r\n', 'Partenaires', '', 'publish', 'closed', 'closed', '', 'partenaires', '', '', '2013-01-28 16:35:57', '2013-01-28 15:35:57', '', 0, 'http://localhost/~chauvin/festival/?page_id=8', 0, 'page', '', 0),
(9, 1, '2013-01-08 08:59:33', '2013-01-08 07:59:33', '', 'Partenaires', '', 'inherit', 'open', 'open', '', '8-revision', '', '', '2013-01-08 08:59:33', '2013-01-08 07:59:33', '', 8, 'http://localhost/~chauvin/festival/?p=9', 0, 'revision', '', 0),
(10, 1, '2013-01-14 16:33:35', '2013-01-14 15:33:35', '<p>Voici nos partenaires officiels : </p>\n<ul>\n<li>Région Centre</li>\n<li>Orléans</li>\n<li>Cinéma des Carmes</li>\n<li>GAGL</li>\n<li>Têtu</li>\n<li>La dixième MUSE</li>\n<li>CiteGay</li>\n<li>Yagg.com</li>\n<li>France Bleu</li>\n</ul>\n', 'Partenaires', '', 'inherit', 'open', 'open', '', '8-autosave', '', '', '2013-01-14 16:33:35', '2013-01-14 15:33:35', '', 8, 'http://localhost/~chauvin/festival/?p=10', 0, 'revision', '', 0),
(11, 1, '2013-01-08 08:59:36', '2013-01-08 07:59:36', 'Partenaires', 'Partenaires', '', 'inherit', 'open', 'open', '', '8-revision-2', '', '', '2013-01-08 08:59:36', '2013-01-08 07:59:36', '', 8, 'http://localhost/~chauvin/festival/?p=11', 0, 'revision', '', 0),
(12, 1, '2013-01-08 08:55:16', '2013-01-08 07:55:16', 'Infos pratiques', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '2-revision-2', '', '', '2013-01-08 08:55:16', '2013-01-08 07:55:16', '', 2, 'http://localhost/~chauvin/festival/?p=12', 0, 'revision', '', 0),
(13, 1, '2013-01-08 09:02:00', '2013-01-08 08:02:00', 'Partenaires', 'Partenaires', '', 'inherit', 'open', 'open', '', '8-revision-3', '', '', '2013-01-08 09:02:00', '2013-01-08 08:02:00', '', 8, 'http://localhost/~chauvin/festival/?p=13', 0, 'revision', '', 0),
(14, 1, '2013-01-08 08:59:25', '2013-01-08 07:59:25', 'Remerciements', 'Remerciements', '', 'inherit', 'open', 'open', '', '6-revision-2', '', '', '2013-01-08 08:59:25', '2013-01-08 07:59:25', '', 6, 'http://localhost/~chauvin/festival/?p=14', 0, 'revision', '', 0),
(15, 1, '2013-01-08 09:12:26', '2013-01-08 08:12:26', '', 'Accueil', '', 'publish', 'open', 'open', '', 'accueil', '', '', '2013-01-21 16:11:21', '2013-01-21 15:11:21', '', 0, 'http://localhost/~chauvin/festival/?p=15', 1, 'nav_menu_item', '', 0),
(16, 1, '2013-01-08 09:12:26', '2013-01-08 08:12:26', 'Catégorie des films.', 'Films', 'Films', 'publish', 'open', 'open', '', 'films', '', '', '2013-01-21 16:11:21', '2013-01-21 15:11:21', '', 0, 'http://localhost/~chauvin/festival/?p=16', 2, 'nav_menu_item', '', 0),
(17, 1, '2013-01-08 09:13:39', '2013-01-08 08:13:39', ' ', '', 'Infos pratiques', 'publish', 'open', 'open', '', '17', '', '', '2013-01-21 16:11:21', '2013-01-21 15:11:21', '', 0, 'http://localhost/~chauvin/festival/?p=17', 4, 'nav_menu_item', '', 0),
(18, 1, '2013-01-08 09:13:40', '2013-01-08 08:13:40', ' ', '', 'Partenaires', 'publish', 'open', 'open', '', '18', '', '', '2013-01-21 16:11:21', '2013-01-21 15:11:21', '', 0, 'http://localhost/~chauvin/festival/?p=18', 5, 'nav_menu_item', '', 0),
(19, 1, '2013-01-08 09:13:40', '2013-01-08 08:13:40', ' ', '', 'Remerciements', 'publish', 'open', 'open', '', '19', '', '', '2013-01-21 16:11:22', '2013-01-21 15:11:22', '', 0, 'http://localhost/~chauvin/festival/?p=19', 6, 'nav_menu_item', '', 0),
(20, 1, '2013-01-08 09:15:12', '2013-01-08 08:15:12', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.\r\n\r\n\r\n', 'Edito', '', 'publish', 'closed', 'closed', '', 'edito', '', '', '2013-01-28 16:02:10', '2013-01-28 15:02:10', '', 0, 'http://localhost/~chauvin/festival/?page_id=20', 0, 'page', '', 0),
(21, 1, '2013-01-08 09:14:58', '2013-01-08 08:14:58', '', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision', '', '', '2013-01-08 09:14:58', '2013-01-08 08:14:58', '', 20, 'http://localhost/~chauvin/festival/?p=21', 0, 'revision', '', 0),
(23, 1, '2013-01-08 09:26:39', '2013-01-08 08:26:39', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.\nCette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\n\n&nbsp;\n\nBon festival !\nChristel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-autosave', '', '', '2013-01-08 09:26:39', '2013-01-08 08:26:39', '', 20, 'http://localhost/~chauvin/festival/?p=23', 0, 'revision', '', 0),
(24, 1, '2013-01-08 09:15:12', '2013-01-08 08:15:12', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une\r\nannée sabbatique, le Festival de films gays &amp; lesbiens revient sous\r\nune nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret,\r\nl’association culturelle Ciné Mundi axée sur le cinéma indépendant,\r\nlance en 2010 le festival de films LGBT D’un bord à l’autre sur un\r\nweek-end de trois jours, format similaire aux éditions précédentes.\r\nCette année, l’événement aura pour thème la sensibilisation des\r\njeunes à la lutte contre les discriminations liées à l’orientation\r\nsexuelle et au genre.\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma\r\nLes Carmes à Orléans.\r\nEn ouverture : une sélection de courts métrages dont trois ont été\r\nréalisés dans le cadre de Jeune et homo sous le regard des autres,\r\nconcours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays\r\nissues in school (C’est élémentaire - Parler de l’homosexualité à\r\nl’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes\r\npassions que le film d’animation Le baiser de la lune en France\r\n12\r\nen 2010. La projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un\r\nlong métrage espagnol mettant en scène une histoire d’amour entre\r\nun paysan basque et un immigré péruvien, El niño pez, un surprenant\r\nroad-movie lesbien version argentine et I can’t think straight, une\r\nsavoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\nChristel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-2', '', '', '2013-01-08 09:15:12', '2013-01-08 08:15:12', '', 20, 'http://localhost/~chauvin/festival/?p=24', 0, 'revision', '', 0),
(25, 1, '2013-01-14 15:48:42', '2013-01-14 14:48:42', '<h2>Intro</h2>\r\n\r\n<p style="text-align: justify;">Les 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune et homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en\r\nscène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le\r\nMinistère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le\r\nsoutien du groupe <b>Canal+</b>.</p>', 'Intro', '', 'publish', 'open', 'open', '', '4-1-intro', '', '', '2013-01-14 15:56:45', '2013-01-14 14:56:45', '', 0, 'http://localhost/~chauvin/festival/?p=25', 0, 'post', '', 0),
(26, 1, '2013-01-14 15:48:29', '2013-01-14 14:48:29', '', '4.1 Intro', '', 'inherit', 'open', 'open', '', '25-revision', '', '', '2013-01-14 15:48:29', '2013-01-14 14:48:29', '', 25, 'http://localhost/~chauvin/festival/?p=26', 0, 'revision', '', 0),
(27, 1, '2013-01-14 15:48:42', '2013-01-14 14:48:42', 'Intro', '4.1 Intro', '', 'inherit', 'open', 'open', '', '25-revision-2', '', '', '2013-01-14 15:48:42', '2013-01-14 14:48:42', '', 25, 'http://localhost/~chauvin/festival/?p=27', 0, 'revision', '', 0),
(28, 1, '2013-01-14 15:49:52', '2013-01-14 14:49:52', 'courts-metrages', 'Courts-métrage', 'Courts-métrage', 'publish', 'open', 'open', '', 'courts-metrage', '', '', '2013-01-21 16:11:21', '2013-01-21 15:11:21', '', 0, 'http://localhost/~chauvin/festival/?p=28', 3, 'nav_menu_item', '', 0),
(29, 1, '2013-01-14 15:50:00', '2013-01-14 14:50:00', 'Intro\n\n&nbsp;\n\nLes 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune\net homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en\nscène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le\nMinistère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le\nsoutien du groupe Canal+.', '4.1 Intro', '', 'inherit', 'open', 'open', '', '25-autosave', '', '', '2013-01-14 15:50:00', '2013-01-14 14:50:00', '', 25, 'http://localhost/~chauvin/festival/?p=29', 0, 'revision', '', 0),
(30, 1, '2013-01-14 15:48:58', '2013-01-14 14:48:58', 'Intro\r\n\r\n&nbsp;\r\n\r\nLes 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune\r\net homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en\r\nscène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le\r\nMinistère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le\r\nsoutien du groupe Canal+.', '4.1 Intro', '', 'inherit', 'open', 'open', '', '25-revision-3', '', '', '2013-01-14 15:48:58', '2013-01-14 14:48:58', '', 25, 'http://localhost/~chauvin/festival/?p=30', 0, 'revision', '', 0),
(31, 1, '2013-01-14 15:50:58', '2013-01-14 14:50:58', 'Lors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'publish', 'open', 'open', '', 'en-colo-pascal-alex-vincent-france', '', '', '2013-01-15 10:33:32', '2013-01-15 09:33:32', '', 0, 'http://localhost/~chauvin/festival/?p=31', 0, 'post', '', 0),
(32, 1, '2013-01-14 15:50:44', '2013-01-14 14:50:44', '', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '31-revision', '', '', '2013-01-14 15:50:44', '2013-01-14 14:50:44', '', 31, 'http://localhost/~chauvin/festival/?p=32', 0, 'revision', '', 0),
(33, 1, '2013-01-14 15:51:26', '2013-01-14 14:51:26', '<p>C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une  etite ville de province où tout le monde se connaît, la révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une  confidence.</p>\r\n', 'Pauline – Céline Sciamma- France – 2009', '', 'publish', 'open', 'open', '', 'pauline-celine-sciamma-france-2009', '', '', '2013-01-15 10:33:17', '2013-01-15 09:33:17', '', 0, 'http://localhost/~chauvin/festival/?p=33', 0, 'post', '', 0),
(34, 1, '2013-01-14 15:51:11', '2013-01-14 14:51:11', '', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '33-revision', '', '', '2013-01-14 15:51:11', '2013-01-14 14:51:11', '', 33, 'http://localhost/~chauvin/festival/?p=34', 0, 'revision', '', 0),
(35, 1, '2013-01-14 15:51:41', '2013-01-14 14:51:41', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui\r\nl’aime mais où la pression est telle qu’il ne peut vraiment assouvir,\r\nni même révéler, son amour pour Arthur. Jusqu’au\r\njour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'publish', 'open', 'open', '', 'omar-sebastien-gabriel-france-2009-9-minutes', '', '', '2013-01-15 10:33:00', '2013-01-15 09:33:00', '', 0, 'http://localhost/~chauvin/festival/?p=35', 0, 'post', '', 0),
(36, 1, '2013-01-14 15:51:35', '2013-01-14 14:51:35', '', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '35-revision', '', '', '2013-01-14 15:51:35', '2013-01-14 14:51:35', '', 35, 'http://localhost/~chauvin/festival/?p=36', 0, 'revision', '', 0),
(37, 1, '2013-01-14 15:52:08', '2013-01-14 14:52:08', '<p>Une boulangerie banale sur une route de campagne. Derrière le comptoir, Odile, s’ennuie.<br />\r\nUn jour, une horde de motards stoppe devant la boutique. Le passé va faire irruption dans sa vie...</p>', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'publish', 'open', 'open', '', 'odile-benedicte-delgehier-france-2006-10-minutes', '', '', '2013-01-15 10:32:38', '2013-01-15 09:32:38', '', 0, 'http://localhost/~chauvin/festival/?p=37', 0, 'post', '', 0),
(38, 1, '2013-01-14 15:51:53', '2013-01-14 14:51:53', '', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '37-revision', '', '', '2013-01-14 15:51:53', '2013-01-14 14:51:53', '', 37, 'http://localhost/~chauvin/festival/?p=38', 0, 'revision', '', 0),
(39, 1, '2013-01-14 15:52:20', '2013-01-14 14:52:20', '<p>Le corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'publish', 'open', 'open', '', 'os-sapatos-de-aristeu-rene-guerra-luiz-bresil-2008', '', '', '2013-01-15 10:32:16', '2013-01-15 09:32:16', '', 0, 'http://localhost/~chauvin/festival/?p=39', 0, 'post', '', 0),
(40, 1, '2013-01-14 15:52:13', '2013-01-14 14:52:13', '', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '39-revision', '', '', '2013-01-14 15:52:13', '2013-01-14 14:52:13', '', 39, 'http://localhost/~chauvin/festival/?p=40', 0, 'revision', '', 0),
(41, 1, '2013-01-14 15:52:39', '2013-01-14 14:52:39', '<h2>Cowbow Forever</h2>\r\n\r\n<p>Au cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'publish', 'open', 'open', '', 'cowboy-forever-jean-baptiste-erreca-france', '', '', '2013-01-15 10:31:49', '2013-01-15 09:31:49', '', 0, 'http://localhost/~chauvin/festival/?p=41', 0, 'post', '', 0),
(42, 1, '2013-01-14 15:52:31', '2013-01-14 14:52:31', '', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '41-revision', '', '', '2013-01-14 15:52:31', '2013-01-14 14:52:31', '', 41, 'http://localhost/~chauvin/festival/?p=42', 0, 'revision', '', 0),
(43, 1, '2013-01-14 15:52:56', '2013-01-14 14:52:56', '\r\n<p>Comment jouer du genre en chanson ? <br />\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'publish', 'open', 'open', '', 'american-boy-patricia-colette-france', '', '', '2013-01-15 10:31:31', '2013-01-15 09:31:31', '', 0, 'http://localhost/~chauvin/festival/?p=43', 0, 'post', '', 0),
(44, 1, '2013-01-14 15:52:48', '2013-01-14 14:52:48', '', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '43-revision', '', '', '2013-01-14 15:52:48', '2013-01-14 14:52:48', '', 43, 'http://localhost/~chauvin/festival/?p=44', 0, 'revision', '', 0),
(45, 1, '2013-01-14 15:53:22', '2013-01-14 14:53:22', '<h2>(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire</h2>\r\n\r\n<p>Premier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques  méricaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix.<br />\r\nUn excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. </p>\r\n\r\n<p>Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association <i>G.A.G.L 45</i> qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>', 'It’s elementary, talking about gays issues in school', '', 'publish', 'open', 'open', '', 'its-elementary-talking-about-gays-issues-in-school', '', '', '2013-01-15 10:31:23', '2013-01-15 09:31:23', '', 0, 'http://localhost/~chauvin/festival/?p=45', 0, 'post', '', 0),
(46, 1, '2013-01-14 15:53:07', '2013-01-14 14:53:07', '', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision', '', '', '2013-01-14 15:53:07', '2013-01-14 14:53:07', '', 45, 'http://localhost/~chauvin/festival/?p=46', 0, 'revision', '', 0),
(47, 1, '2013-01-14 15:53:43', '2013-01-14 14:53:43', '<h2>Espagne - 2009 - 02h08 - VOSTF</h2>\r\n\r\n<p>Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. <br />\r\nPour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...</p>\r\n\r\n<p>Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.</p>\r\n\r\n<h3>3 prix reçus !</h3>\r\n<ul>\r\n<li>Prix C.I.C.A.E – Festival International de Berlin (2009)</li>\r\n<li>Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)</li>\r\n<li>Grand prix du jury – Festival Cinehorizontes (2009)</li>\r\n</ul>', 'Ander - Réalisé par Roberto Castón', '', 'publish', 'open', 'open', '', 'ander-realise-par-roberto-caston', '', '', '2013-01-15 10:30:45', '2013-01-15 09:30:45', '', 0, 'http://localhost/~chauvin/festival/?p=47', 0, 'post', '', 0),
(48, 1, '2013-01-14 15:53:32', '2013-01-14 14:53:32', '', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-revision', '', '', '2013-01-14 15:53:32', '2013-01-14 14:53:32', '', 47, 'http://localhost/~chauvin/festival/?p=48', 0, 'revision', '', 0),
(49, 1, '2013-01-14 15:54:04', '2013-01-14 14:54:04', '<h2>Argentine - 2008 - 01h36 - VOSTF</h2>\r\n\r\n\r\n<p>Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. <br />\r\nMais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.</p>\r\n<p>Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.</p>', 'El nino pez - Réalisé par Lucía Puenzo', '', 'publish', 'open', 'open', '', 'el-nino-pez-realise-par-lucia-puenzo', '', '', '2013-01-15 10:30:28', '2013-01-15 09:30:28', '', 0, 'http://localhost/~chauvin/festival/?p=49', 0, 'post', '', 0),
(50, 1, '2013-01-14 15:53:52', '2013-01-14 14:53:52', '', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '49-revision', '', '', '2013-01-14 15:53:52', '2013-01-14 14:53:52', '', 49, 'http://localhost/~chauvin/festival/?p=50', 0, 'revision', '', 0),
(51, 1, '2013-01-14 15:54:23', '2013-01-14 14:54:23', '<h2>Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF</h2>\r\n\r\n<p>Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.<br />\r\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. </p>\r\n<p>Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.<br/>\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)</p>', 'Can''t think straight - Réalisé par Shamim Sarif', '', 'publish', 'open', 'open', '', 'cant-think-straight-realise-par-shamim-sarif', '', '', '2013-01-15 10:30:03', '2013-01-15 09:30:03', '', 0, 'http://localhost/~chauvin/festival/?p=51', 0, 'post', '', 0),
(52, 1, '2013-01-14 15:54:12', '2013-01-14 14:54:12', '', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '51-revision', '', '', '2013-01-14 15:54:12', '2013-01-14 14:54:12', '', 51, 'http://localhost/~chauvin/festival/?p=52', 0, 'revision', '', 0),
(53, 1, '2013-01-14 15:54:23', '2013-01-14 14:54:23', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune\r\nPalestinienne installée à Londres, tombe amoureuse de Leyla,\r\nune jeune Britannique d’origine indienne.\r\nTout les oppose : Tala est chrétienne et affirmée, Leyla\r\nmusulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit\r\npassionnée. Mais le poids des cultures, la pression familiale\r\net le sens du devoir mettront à l’épreuve leur relation et les\r\nforceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les\r\ndeux talentueuses actrices (que l’on retrouve également dans\r\nson autre film The world unseen) est un pur joyau digne des\r\ncomédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '51-revision-2', '', '', '2013-01-14 15:54:23', '2013-01-14 14:54:23', '', 51, 'http://localhost/~chauvin/festival/?p=53', 0, 'revision', '', 0),
(54, 1, '2013-01-14 15:54:04', '2013-01-14 14:54:04', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\r\ndépressif et d’une mère toxicomane, est follement amoureuse\r\nde Guayi, jeune et jolie domestique paraguayenne au service\r\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\r\nprojettent de s’enfuir dans le village d’origine de Guayi, au\r\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\r\ns’exprimer sans contrainte leur désir fusionnel. Mais un\r\ndrame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\r\nd’adapter elle-même son propre roman écrit huit ans\r\nauparavant où deux jeunes femmes aux physiques opposés et\r\nde classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\r\nentraîne dans un Thelma et Louise lesbien à travers une\r\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '49-revision-2', '', '', '2013-01-14 15:54:04', '2013-01-14 14:54:04', '', 49, 'http://localhost/~chauvin/festival/?p=54', 0, 'revision', '', 0),
(55, 1, '2013-01-14 15:53:43', '2013-01-14 14:53:43', 'Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi,\r\nChristian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine\r\npassée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme\r\nfamiliale. Alors qu’Arantxa doit bientôt se marier et laisser Ander\r\ns’occuper seul de leur mère, celui-ci se casse une jambe.\r\nPour l’assister dans ses tâches, sa famille embauche José, un\r\njeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et\r\nsurtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto\r\nCastón met en scène cette histoire d’amour entre deux hommes\r\nvivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir,\r\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie\r\nla complexité des rapports humains d’une grande intensité, a\r\nremporté l’adhésion du public dans tous les festivals où il a été\r\nprojeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-revision-2', '', '', '2013-01-14 15:53:43', '2013-01-14 14:53:43', '', 47, 'http://localhost/~chauvin/festival/?p=55', 0, 'revision', '', 0),
(56, 1, '2013-01-14 15:50:30', '2013-01-14 14:50:30', 'Intro\r\n\r\n&nbsp;\r\n\r\nLes 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune\r\net homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en\r\nscène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le\r\nMinistère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le\r\nsoutien du groupe Canal+.', 'Intro', '', 'inherit', 'open', 'open', '', '25-revision-4', '', '', '2013-01-14 15:50:30', '2013-01-14 14:50:30', '', 25, 'http://localhost/~chauvin/festival/?p=56', 0, 'revision', '', 0),
(57, 1, '2013-01-14 15:53:22', '2013-01-14 14:53:22', '(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée\r\naux enfants dans les écoles publiques américaines, It’s\r\nelementary suit les interventions des enseignants dans les\r\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\r\ntour des écoles américaines et a gagné de nombreux prix.\r\nUn excellent support didactique à montrer à tous les élèves\r\net leurs professeurs lorsque l’on appartient au monde de\r\nl’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de\r\nl’ultra-droite chrétienne intégriste et homophobe pour\r\nempêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\r\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision-2', '', '', '2013-01-14 15:53:22', '2013-01-14 14:53:22', '', 45, 'http://localhost/~chauvin/festival/?p=57', 0, 'revision', '', 0),
(58, 1, '2013-01-14 16:07:46', '2013-01-14 15:07:46', '<h2>(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire</h2>\n<ul>\n<li>Durée 01h20</li>\n<li>Réalisation : Debra Chasnoff</li>\n</ul>\n<p>Premier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques  méricaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix.<br />\nUn excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. </p>\n\n<p>Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\nLa projection sera suivie d’un débat avec l’association\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-autosave', '', '', '2013-01-14 16:07:46', '2013-01-14 15:07:46', '', 45, 'http://localhost/~chauvin/festival/?p=58', 0, 'revision', '', 0),
(59, 1, '2013-01-14 16:02:58', '2013-01-14 15:02:58', 'It''s Still Elementary', 'It''s Still Elementary', 'It''s Still Elementary', 'inherit', 'open', 'open', '', '37_it_s_still_elementary', '', '', '2013-01-14 16:02:58', '2013-01-14 15:02:58', '', 45, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/37_it_s_still_elementary.jpg', 0, 'attachment', 'image/jpeg', 0),
(60, 1, '2013-01-14 16:01:50', '2013-01-14 15:01:50', '(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire\r\n\r\nDurée 01h20 -\r\n\r\nRéalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée\r\naux enfants dans les écoles publiques américaines, It’s\r\nelementary suit les interventions des enseignants dans les\r\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\r\ntour des écoles américaines et a gagné de nombreux prix.\r\nUn excellent support didactique à montrer à tous les élèves\r\net leurs professeurs lorsque l’on appartient au monde de\r\nl’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de\r\nl’ultra-droite chrétienne intégriste et homophobe pour\r\nempêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\r\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision-3', '', '', '2013-01-14 16:01:50', '2013-01-14 15:01:50', '', 45, 'http://localhost/~chauvin/festival/?p=60', 0, 'revision', '', 0),
(62, 1, '2013-01-14 16:03:12', '2013-01-14 15:03:12', '(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire\r\n\r\nDurée 01h20 -\r\n\r\nRéalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée\r\naux enfants dans les écoles publiques américaines, It’s\r\nelementary suit les interventions des enseignants dans les\r\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\r\ntour des écoles américaines et a gagné de nombreux prix.\r\nUn excellent support didactique à montrer à tous les élèves\r\net leurs professeurs lorsque l’on appartient au monde de\r\nl’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de\r\nl’ultra-droite chrétienne intégriste et homophobe pour\r\nempêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\r\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision-4', '', '', '2013-01-14 16:03:12', '2013-01-14 15:03:12', '', 45, 'http://localhost/~chauvin/festival/?p=62', 0, 'revision', '', 0),
(63, 1, '2013-01-14 15:55:19', '2013-01-14 14:55:19', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune\r\nPalestinienne installée à Londres, tombe amoureuse de Leyla,\r\nune jeune Britannique d’origine indienne.\r\nTout les oppose : Tala est chrétienne et affirmée, Leyla\r\nmusulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit\r\npassionnée. Mais le poids des cultures, la pression familiale\r\net le sens du devoir mettront à l’épreuve leur relation et les\r\nforceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les\r\ndeux talentueuses actrices (que l’on retrouve également dans\r\nson autre film The world unseen) est un pur joyau digne des\r\ncomédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'Can''t think straight - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '51-revision-3', '', '', '2013-01-14 15:55:19', '2013-01-14 14:55:19', '', 51, 'http://localhost/~chauvin/festival/?p=63', 0, 'revision', '', 0),
(64, 1, '2013-01-14 15:52:56', '2013-01-14 14:52:56', '2008 - 4 minutes\r\nComment jouer du genre en chanson ?\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous\r\nsera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '43-revision-2', '', '', '2013-01-14 15:52:56', '2013-01-14 14:52:56', '', 43, 'http://localhost/~chauvin/festival/?p=64', 0, 'revision', '', 0),
(65, 1, '2013-01-14 15:55:45', '2013-01-14 14:55:45', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\r\ndépressif et d’une mère toxicomane, est follement amoureuse\r\nde Guayi, jeune et jolie domestique paraguayenne au service\r\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\r\nprojettent de s’enfuir dans le village d’origine de Guayi, au\r\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\r\ns’exprimer sans contrainte leur désir fusionnel. Mais un\r\ndrame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\r\nd’adapter elle-même son propre roman écrit huit ans\r\nauparavant où deux jeunes femmes aux physiques opposés et\r\nde classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\r\nentraîne dans un Thelma et Louise lesbien à travers une\r\nArgentine inconnue et troublante.', 'El nino pez - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '49-revision-3', '', '', '2013-01-14 15:55:45', '2013-01-14 14:55:45', '', 49, 'http://localhost/~chauvin/festival/?p=65', 0, 'revision', '', 0),
(66, 1, '2013-01-14 16:12:52', '2013-01-14 15:12:52', '<h2>Espagne - 2009 - 02h08 - VOSTF</h2>\n\n<ul>\n<li>Interprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive</li>\n</ul>\n\n<p>Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. <br />\nPour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\ntemps de filmer...</p>\n\n<p>Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.</p>\n\n<h\nPrix C.I.C.A.E – Festival International de Berlin (2009)\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\nGrand prix du jury – Festival Cinehorizontes (2009)', 'Ander - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-autosave', '', '', '2013-01-14 16:12:52', '2013-01-14 15:12:52', '', 47, 'http://localhost/~chauvin/festival/?p=66', 0, 'revision', '', 0),
(67, 1, '2013-01-14 15:55:57', '2013-01-14 14:55:57', 'Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi,\r\nChristian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine\r\npassée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme\r\nfamiliale. Alors qu’Arantxa doit bientôt se marier et laisser Ander\r\ns’occuper seul de leur mère, celui-ci se casse une jambe.\r\nPour l’assister dans ses tâches, sa famille embauche José, un\r\njeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et\r\nsurtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto\r\nCastón met en scène cette histoire d’amour entre deux hommes\r\nvivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir,\r\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie\r\nla complexité des rapports humains d’une grande intensité, a\r\nremporté l’adhésion du public dans tous les festivals où il a été\r\nprojeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)', 'Ander - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-revision-3', '', '', '2013-01-14 15:55:57', '2013-01-14 14:55:57', '', 47, 'http://localhost/~chauvin/festival/?p=67', 0, 'revision', '', 0);
INSERT INTO `fes_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(68, 1, '2013-01-08 07:51:54', '2013-01-08 07:51:54', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'inherit', 'open', 'open', '', '1-revision', '', '', '2013-01-08 07:51:54', '2013-01-08 07:51:54', '', 1, 'http://localhost/~chauvin/festival/?p=68', 0, 'revision', '', 0),
(69, 1, '2013-01-08 09:25:38', '2013-01-08 08:25:38', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.\r\nCette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\n\r\n&nbsp;\r\n\r\nBon festival !\r\nChristel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-3', '', '', '2013-01-08 09:25:38', '2013-01-08 08:25:38', '', 20, 'http://localhost/~chauvin/festival/?p=69', 0, 'revision', '', 0),
(70, 1, '2013-01-14 15:52:39', '2013-01-14 14:52:39', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '41-revision-2', '', '', '2013-01-14 15:52:39', '2013-01-14 14:52:39', '', 41, 'http://localhost/~chauvin/festival/?p=70', 0, 'revision', '', 0),
(71, 1, '2013-01-14 15:52:20', '2013-01-14 14:52:20', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '39-revision-2', '', '', '2013-01-14 15:52:20', '2013-01-14 14:52:20', '', 39, 'http://localhost/~chauvin/festival/?p=71', 0, 'revision', '', 0),
(72, 1, '2013-01-14 15:52:08', '2013-01-14 14:52:08', 'Une boulangerie banale sur une route de\r\ncampagne. Derrière le comptoir, Odile, s’ennuie.\r\nUn jour, une horde de motards stoppe devant\r\nla boutique. Le passé va faire irruption dans\r\nsa vie...', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '37-revision-2', '', '', '2013-01-14 15:52:08', '2013-01-14 14:52:08', '', 37, 'http://localhost/~chauvin/festival/?p=72', 0, 'revision', '', 0),
(73, 1, '2013-01-14 16:15:23', '2013-01-14 15:15:23', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-4', '', '', '2013-01-14 16:15:23', '2013-01-14 15:15:23', '', 20, 'http://localhost/~chauvin/festival/?p=73', 0, 'revision', '', 0),
(74, 1, '2013-01-14 16:18:22', '2013-01-14 15:18:22', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<p style="text-align: justify;>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p style="text-align: justify;>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n\r\n<p style="text-align: justify;>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-5', '', '', '2013-01-14 16:18:22', '2013-01-14 15:18:22', '', 20, 'http://localhost/~chauvin/festival/?p=74', 0, 'revision', '', 0),
(75, 1, '2013-01-14 16:18:47', '2013-01-14 15:18:47', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<p style="text-align: justify;>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p style="text-align: justify;>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p style="text-align: justify;>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-6', '', '', '2013-01-14 16:18:47', '2013-01-14 15:18:47', '', 20, 'http://localhost/~chauvin/festival/?p=75', 0, 'revision', '', 0),
(76, 1, '2013-01-14 16:19:25', '2013-01-14 15:19:25', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<p style="text-align: justify;>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p style="text-align: justify;>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p style="text-align: justify;>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-7', '', '', '2013-01-14 16:19:25', '2013-01-14 15:19:25', '', 20, 'http://localhost/~chauvin/festival/?p=76', 0, 'revision', '', 0),
(77, 1, '2013-01-14 16:32:14', '2013-01-14 15:32:14', '<p>Toute l''équipe du <b>Festival LGBT</b> tient à remercier tous ces organismes : </p>\n<ul>\n<li>La Région Centre\n<li>La Mairie d''Orléans\n<li>Le cinéma des Carmes\n<li>Le Groupe Action Gay &amp; Lesbien - Loiret\n<li>Citégay\n<li>La dixième Muse\n<li>Têtu\n<li>Yagg.com\n<li>France Bleu Orléans\n<li>Bagdam Espace Lesbien ( Toulouse )\n<li>Cineffable\n<li>Le Festival Tous Courts ( Aix en Provence )\n<li>Les VidéObstinées</li>\n</ul>\n&nbsp;\n\n&nbsp;', 'Remerciements', '', 'inherit', 'open', 'open', '', '6-autosave', '', '', '2013-01-14 16:32:14', '2013-01-14 15:32:14', '', 6, 'http://localhost/~chauvin/festival/?p=77', 0, 'revision', '', 0),
(78, 1, '2013-01-08 09:03:51', '2013-01-08 08:03:51', 'Remerciements\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n- La Région Centre\r\n- La Mairie d''Orléans\r\n- Le cinéma des Carmes\r\n- Le Groupe Action Gay &amp; Lesbien - Loiret\r\n- Citégay\r\n- La dixième Muse\r\n- Têtu\r\n- Yagg.com\r\n- France Bleu Orléans\r\n- Bagdam Espace Lesbien ( Toulouse )\r\n- Cineffable\r\n- Le Festival Tous Courts ( Aix en Provence )\r\n- Les VidéObstinées\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Remerciements', '', 'inherit', 'open', 'open', '', '6-revision-3', '', '', '2013-01-08 09:03:51', '2013-01-08 08:03:51', '', 6, 'http://localhost/~chauvin/festival/?p=78', 0, 'revision', '', 0),
(79, 1, '2013-01-08 09:03:27', '2013-01-08 08:03:27', 'Partenaires\r\n\r\n&nbsp;\r\n\r\nRégion Centre\r\n- Orléans\r\n- Cinéma des Carmes\r\n- GAGL\r\n- Têtu\r\n- La dixième MUSE\r\n- CiteGay\r\n- Yagg.com\r\n- France Bleu\r\n\r\n&nbsp;', 'Partenaires', '', 'inherit', 'open', 'open', '', '8-revision-4', '', '', '2013-01-08 09:03:27', '2013-01-08 08:03:27', '', 8, 'http://localhost/~chauvin/festival/?p=79', 0, 'revision', '', 0),
(80, 1, '2013-01-08 09:03:09', '2013-01-08 08:03:09', 'Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '2-revision-3', '', '', '2013-01-08 09:03:09', '2013-01-08 08:03:09', '', 2, 'http://localhost/~chauvin/festival/?p=80', 0, 'revision', '', 0),
(81, 1, '2013-01-14 16:36:28', '2013-01-14 15:36:28', '<ul>\r\n	<li><b>Lieu du festival : </b> Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS</li>\r\n	<li><b>Tarifs :</b> \r\n<ul>\r\n	<li>Plein tarif : 7,50 €</li>\r\n	<li>Pass Festival : 25 € (5 séances)</li>\r\n	<li>Soirée courts métrages : 6 € (vendredi)</li>\r\n	<li>2 séances consécutives le samedi ou le dimanche : 12 €</li>\r\n</ul>\r\n</li>\r\n	<li><b>Cartes &amp; réductions acceptées :</b> <br />\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.</li>\r\n	<li>Equipe :\r\n<ul>\r\n	<li><b>Direction artistique :</b>  Christel Guillard (Présidente de Ciné Mundi)</li>\r\n	<li><b>Programmation :</b>  Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)</li>\r\n	<li><b>Communication &amp; partenariats :</b>  Christel Guillard</li>\r\n	<li><b>Conception graphique :</b>  Yannis Bellair</li>\r\n	<li><b>Conception du site internet : </b> rccc</li>\r\n	<li><b>Impression : </b> Prevost Offset</li>\r\n</ul>\r\n</li>\r\n	<li>Contacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com</li>\r\n</ul>', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '2-revision-4', '', '', '2013-01-14 16:36:28', '2013-01-14 15:36:28', '', 2, 'http://localhost/~chauvin/festival/?p=81', 0, 'revision', '', 0),
(82, 1, '2013-01-14 16:37:50', '2013-01-14 15:37:50', '<p>Toutes les informations pratiques à propos du <strong>Festival LGBT</strong>.</p>\r\n<ul>\r\n	<li><b>Lieu du festival : </b> Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS</li>\r\n	<li><b>Tarifs :</b> \r\n<ul>\r\n	<li>Plein tarif : 7,50 €</li>\r\n	<li>Pass Festival : 25 € (5 séances)</li>\r\n	<li>Soirée courts métrages : 6 € (vendredi)</li>\r\n	<li>2 séances consécutives le samedi ou le dimanche : 12 €</li>\r\n</ul>\r\n</li>\r\n	<li><b>Cartes &amp; réductions acceptées :</b> <br />\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.</li>\r\n	<li>Equipe :\r\n<ul>\r\n	<li><b>Direction artistique :</b>  Christel Guillard (Présidente de Ciné Mundi)</li>\r\n	<li><b>Programmation :</b>  Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)</li>\r\n	<li><b>Communication &amp; partenariats :</b>  Christel Guillard</li>\r\n	<li><b>Conception graphique :</b>  Yannis Bellair</li>\r\n	<li><b>Conception du site internet : </b> rccc</li>\r\n	<li><b>Impression : </b> Prevost Offset</li>\r\n</ul>\r\n</li>\r\n	<li>Contacts : <a href="mailto:festival.dunbordalautre@gmail.com" title="">festival.dunbordalautre@gmail.com</a> et <a href="http://www.festivaldunbordalautre.com" title="">www.festivaldunbordalautre.com</a></li>\r\n</ul>', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '2-revision-5', '', '', '2013-01-14 16:37:50', '2013-01-14 15:37:50', '', 2, 'http://localhost/~chauvin/festival/?p=82', 0, 'revision', '', 0),
(83, 1, '2013-01-14 16:19:55', '2013-01-14 15:19:55', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-8', '', '', '2013-01-14 16:19:55', '2013-01-14 15:19:55', '', 20, 'http://localhost/~chauvin/festival/?p=83', 0, 'revision', '', 0),
(84, 1, '2013-01-14 16:40:13', '2013-01-14 15:40:13', '<h1>Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '20-revision-9', '', '', '2013-01-14 16:40:13', '2013-01-14 15:40:13', '', 20, 'http://localhost/~chauvin/festival/?p=84', 0, 'revision', '', 0),
(86, 1, '2013-01-14 16:52:15', '2013-01-14 15:52:15', 'test', 'test', '', 'trash', 'open', 'open', '', 'test', '', '', '2013-01-30 10:24:34', '2013-01-30 09:24:34', '', 0, 'http://localhost/~chauvin/festival/?p=86', 0, 'post', '', 0),
(87, 1, '2013-01-14 16:52:02', '2013-01-14 15:52:02', '', 'test', '', 'inherit', 'open', 'open', '', '86-revision', '', '', '2013-01-14 16:52:02', '2013-01-14 15:52:02', '', 86, 'http://localhost/~chauvin/festival/?p=87', 0, 'revision', '', 0),
(91, 1, '2013-01-15 10:18:02', '2013-01-15 09:18:02', 'American boy', 'American boy', 'American boy', 'inherit', 'open', 'open', '', 'american-boy', '', '', '2013-01-15 10:18:02', '2013-01-15 09:18:02', '', 43, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/American-boy.png', 0, 'attachment', 'image/png', 0),
(92, 1, '2013-01-14 16:10:11', '2013-01-14 15:10:11', '<ul>\r\n<li>Date : 2008</li>\r\n<li>Durée : 4 minutes</li>\r\n</ul>\r\n<p>Comment jouer du genre en chanson ? <br />\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '43-revision-3', '', '', '2013-01-14 16:10:11', '2013-01-14 15:10:11', '', 43, 'http://localhost/~chauvin/festival/?p=92', 0, 'revision', '', 0),
(93, 1, '2013-01-15 10:18:31', '2013-01-15 09:18:31', 'ANDER1', 'ANDER1', 'ANDER1', 'inherit', 'open', 'open', '', 'ander1', '', '', '2013-01-15 10:18:31', '2013-01-15 09:18:31', '', 47, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/ANDER1.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2013-01-14 16:13:15', '2013-01-14 15:13:15', '<h2>Espagne - 2009 - 02h08 - VOSTF</h2>\r\n\r\n<ul>\r\n<li>Interprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive</li>\r\n</ul>\r\n\r\n<p>Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. <br />\r\nPour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...</p>\r\n\r\n<p>Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.</p>\r\n\r\n<h3>3 prix reçus !</h3>\r\n<ul>\r\n<li>Prix C.I.C.A.E – Festival International de Berlin (2009)</li>\r\n<li>Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)</li>\r\n<li>Grand prix du jury – Festival Cinehorizontes (2009)</li>\r\n</ul>', 'Ander - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-revision-4', '', '', '2013-01-14 16:13:15', '2013-01-14 15:13:15', '', 47, 'http://localhost/~chauvin/festival/?p=94', 0, 'revision', '', 0),
(96, 1, '2013-01-15 10:19:12', '2013-01-15 09:19:12', 'COWBOY FOREVER', 'COWBOY FOREVER', 'COWBOY FOREVER', 'inherit', 'open', 'open', '', 'cowboy-forever', '', '', '2013-01-15 10:19:12', '2013-01-15 09:19:12', '', 41, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/COWBOY-FOREVER.jpg', 0, 'attachment', 'image/jpeg', 0),
(97, 1, '2013-01-14 16:16:27', '2013-01-14 15:16:27', '<h2>Cowbow Forever</h2>\r\n\r\n<ul>\r\n<li>Date : 2006</li>\r\n<li>Durée : 26 minutes</li>\r\n</ul>\r\n\r\n<p>Au cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '41-revision-3', '', '', '2013-01-14 16:16:27', '2013-01-14 15:16:27', '', 41, 'http://localhost/~chauvin/festival/?p=97', 0, 'revision', '', 0),
(98, 1, '2013-01-15 10:19:41', '2013-01-15 09:19:41', 'EL NINO PEZ 1', 'EL NINO PEZ 1', 'EL NINO PEZ 1', 'inherit', 'open', 'open', '', 'el-nino-pez-1', '', '', '2013-01-15 10:19:41', '2013-01-15 09:19:41', '', 49, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/EL-NINO-PEZ-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(99, 1, '2013-01-14 16:11:34', '2013-01-14 15:11:34', '<h2>Argentine - 2008 - 01h36 - VOSTF</h2>\r\n<ul>\r\n<li>Interprétation : Inés Efron, Mariela Vitale, Pep Munne</li>\r\n</ul>\r\n\r\n<p>Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. <br />\r\nMais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.</p>\r\n<p>Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.</p>', 'El nino pez - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '49-revision-4', '', '', '2013-01-14 16:11:34', '2013-01-14 15:11:34', '', 49, 'http://localhost/~chauvin/festival/?p=99', 0, 'revision', '', 0),
(100, 1, '2013-01-15 10:20:11', '2013-01-15 09:20:11', 'EN_COLO', 'EN_COLO', 'EN_COLO', 'inherit', 'open', 'open', '', 'en_colo', '', '', '2013-01-15 10:20:11', '2013-01-15 09:20:11', '', 31, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/EN_COLO.jpg', 0, 'attachment', 'image/jpeg', 0),
(101, 1, '2013-01-14 15:50:58', '2013-01-14 14:50:58', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '31-revision-2', '', '', '2013-01-14 15:50:58', '2013-01-14 14:50:58', '', 31, 'http://localhost/~chauvin/festival/?p=101', 0, 'revision', '', 0),
(102, 1, '2013-01-14 16:07:58', '2013-01-14 15:07:58', '<h2>(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire</h2>\r\n<ul>\r\n<li>Durée 01h20</li>\r\n<li>Réalisation : Debra Chasnoff</li>\r\n</ul>\r\n<p>Premier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques  méricaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix.<br />\r\nUn excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. </p>\r\n\r\n<p>Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association <i>G.A.G.L 45</i> qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision-5', '', '', '2013-01-14 16:07:58', '2013-01-14 15:07:58', '', 45, 'http://localhost/~chauvin/festival/?p=102', 0, 'revision', '', 0),
(103, 1, '2013-01-15 10:21:54', '2013-01-15 09:21:54', 'OMAR_', 'OMAR_', 'OMAR_', 'inherit', 'open', 'open', '', 'omar_', '', '', '2013-01-15 10:21:54', '2013-01-15 09:21:54', '', 35, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/OMAR_.jpg', 0, 'attachment', 'image/jpeg', 0),
(104, 1, '2013-01-14 15:51:41', '2013-01-14 14:51:41', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui\r\nl’aime mais où la pression est telle qu’il ne peut vraiment assouvir,\r\nni même révéler, son amour pour Arthur. Jusqu’au\r\njour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '35-revision-2', '', '', '2013-01-14 15:51:41', '2013-01-14 14:51:41', '', 35, 'http://localhost/~chauvin/festival/?p=104', 0, 'revision', '', 0),
(105, 1, '2013-01-15 10:22:23', '2013-01-15 09:22:23', 'Os sapatos de Aristeu', 'Os sapatos de Aristeu', 'Os sapatos de Aristeu', 'inherit', 'open', 'open', '', 'os-sapatos-de-aristeu', '', '', '2013-01-15 10:22:23', '2013-01-15 09:22:23', '', 39, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/Os-sapatos-de-Aristeu.jpg', 0, 'attachment', 'image/jpeg', 0),
(106, 1, '2013-01-14 16:17:12', '2013-01-14 15:17:12', '<ul>\r\n<li>Durée : 17 minutes</li>\r\n<li>Langue : VOSTF</li>\r\n</ul>\r\n\r\n<p>Le corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '39-revision-3', '', '', '2013-01-14 16:17:12', '2013-01-14 15:17:12', '', 39, 'http://localhost/~chauvin/festival/?p=106', 0, 'revision', '', 0),
(107, 1, '2013-01-15 10:22:49', '2013-01-15 09:22:49', 'PAULINE_1', 'PAULINE_1', 'PAULINE_1', 'inherit', 'open', 'open', '', 'pauline_1', '', '', '2013-01-15 10:22:49', '2013-01-15 09:22:49', '', 33, 'http://localhost/~chauvin/festival/wp-content/uploads/2013/01/PAULINE_1.jpg', 0, 'attachment', 'image/jpeg', 0),
(108, 1, '2013-01-14 15:51:26', '2013-01-14 14:51:26', '7 minutes.\r\n\r\nC’est la mise en scène d’une jeune fille, qui se raconte\r\nface à la caméra : l’enfance joyeuse dans une petite\r\nville de province où tout le monde se connaît, la révélation\r\npublique et infamante de son homosexualité par un ami de ses\r\nparents, le silence des témoins, la douleur de la solitude, la\r\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\r\nfille, à la caméra, au spectateur. Comme une confidence.\r\n\r\n&nbsp;', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '33-revision-2', '', '', '2013-01-14 15:51:26', '2013-01-14 14:51:26', '', 33, 'http://localhost/~chauvin/festival/?p=108', 0, 'revision', '', 0),
(109, 1, '2013-01-15 10:22:58', '2013-01-15 09:22:58', '7 minutes.\r\n\r\nC’est la mise en scène d’une jeune fille, qui se raconte\r\nface à la caméra : l’enfance joyeuse dans une petite\r\nville de province où tout le monde se connaît, la révélation\r\npublique et infamante de son homosexualité par un ami de ses\r\nparents, le silence des témoins, la douleur de la solitude, la\r\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\r\nfille, à la caméra, au spectateur. Comme une confidence.\r\n\r\n&nbsp;', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '33-revision-3', '', '', '2013-01-15 10:22:58', '2013-01-15 09:22:58', '', 33, 'http://localhost/~chauvin/festival/?p=109', 0, 'revision', '', 0),
(110, 1, '2013-01-15 10:18:13', '2013-01-15 09:18:13', '<ul>\r\n<li>Date : 2008</li>\r\n<li>Durée : 4 minutes</li>\r\n</ul>\r\n<p>Comment jouer du genre en chanson ? <br />\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '43-revision-4', '', '', '2013-01-15 10:18:13', '2013-01-15 09:18:13', '', 43, 'http://localhost/~chauvin/festival/?p=110', 0, 'revision', '', 0),
(112, 1, '2013-01-14 16:09:12', '2013-01-14 15:09:12', '<h2>Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF</h2>\r\n<ul>\r\n<li>Interprétation : Lisa Ray, Sheetal Sheth, Antonia Frering</li>\r\n</ul>\r\n\r\n<p>Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.<br />\r\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. </p>\r\n<p>Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.<br/>\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)</p>', 'Can''t think straight - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '51-revision-4', '', '', '2013-01-14 16:09:12', '2013-01-14 15:09:12', '', 51, 'http://localhost/~chauvin/festival/?p=112', 0, 'revision', '', 0),
(113, 1, '2013-01-15 10:19:49', '2013-01-15 09:19:49', '<h2>Argentine - 2008 - 01h36 - VOSTF</h2>\r\n<ul>\r\n<li>Interprétation : Inés Efron, Mariela Vitale, Pep Munne</li>\r\n</ul>\r\n\r\n<p>Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. <br />\r\nMais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.</p>\r\n<p>Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.</p>', 'El nino pez - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '49-revision-5', '', '', '2013-01-15 10:19:49', '2013-01-15 09:19:49', '', 49, 'http://localhost/~chauvin/festival/?p=113', 0, 'revision', '', 0),
(114, 1, '2013-01-15 10:18:45', '2013-01-15 09:18:45', '<h2>Espagne - 2009 - 02h08 - VOSTF</h2>\r\n\r\n<ul>\r\n<li>Interprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive</li>\r\n</ul>\r\n\r\n<p>Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. <br />\r\nPour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...</p>\r\n\r\n<p>Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.</p>\r\n\r\n<h3>3 prix reçus !</h3>\r\n<ul>\r\n<li>Prix C.I.C.A.E – Festival International de Berlin (2009)</li>\r\n<li>Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)</li>\r\n<li>Grand prix du jury – Festival Cinehorizontes (2009)</li>\r\n</ul>', 'Ander - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '47-revision-5', '', '', '2013-01-15 10:18:45', '2013-01-15 09:18:45', '', 47, 'http://localhost/~chauvin/festival/?p=114', 0, 'revision', '', 0),
(115, 1, '2013-01-15 10:21:24', '2013-01-15 09:21:24', '<h2>(C’est élémentaire - Parler de l’homosexualité à l’école) Etats-Unis - 1996 - Documentaire</h2>\r\n<ul>\r\n<li>Durée 01h20</li>\r\n<li>Réalisation : Debra Chasnoff</li>\r\n</ul>\r\n<p>Premier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques  méricaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix.<br />\r\nUn excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. </p>\r\n\r\n<p>Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association <i>G.A.G.L 45</i> qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '45-revision-6', '', '', '2013-01-15 10:21:24', '2013-01-15 09:21:24', '', 45, 'http://localhost/~chauvin/festival/?p=115', 0, 'revision', '', 0),
(116, 1, '2013-01-15 10:26:56', '2013-01-15 09:26:56', '<ul>\r\n<li>Date : 2008</li>\r\n<li>Durée : 4 minutes</li>\r\n</ul>\r\n<p>Comment jouer du genre en chanson ? <br />\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '43-revision-5', '', '', '2013-01-15 10:26:56', '2013-01-15 09:26:56', '', 43, 'http://localhost/~chauvin/festival/?p=116', 0, 'revision', '', 0),
(117, 1, '2013-01-15 10:19:21', '2013-01-15 09:19:21', '<h2>Cowbow Forever</h2>\r\n\r\n<ul>\r\n<li>Date : 2006</li>\r\n<li>Durée : 26 minutes</li>\r\n</ul>\r\n\r\n<p>Au cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '41-revision-4', '', '', '2013-01-15 10:19:21', '2013-01-15 09:19:21', '', 41, 'http://localhost/~chauvin/festival/?p=117', 0, 'revision', '', 0),
(118, 1, '2013-01-15 10:22:32', '2013-01-15 09:22:32', '<ul>\r\n<li>Durée : 17 minutes</li>\r\n<li>Langue : VOSTF</li>\r\n</ul>\r\n\r\n<p>Le corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '39-revision-4', '', '', '2013-01-15 10:22:32', '2013-01-15 09:22:32', '', 39, 'http://localhost/~chauvin/festival/?p=118', 0, 'revision', '', 0),
(119, 1, '2013-01-14 16:17:31', '2013-01-14 15:17:31', '<p>Une boulangerie banale sur une route de campagne. Derrière le comptoir, Odile, s’ennuie.<br />\r\nUn jour, une horde de motards stoppe devant la boutique. Le passé va faire irruption dans sa vie...</p>', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '37-revision-3', '', '', '2013-01-14 16:17:31', '2013-01-14 15:17:31', '', 37, 'http://localhost/~chauvin/festival/?p=119', 0, 'revision', '', 0),
(120, 1, '2013-01-15 10:22:03', '2013-01-15 09:22:03', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui\r\nl’aime mais où la pression est telle qu’il ne peut vraiment assouvir,\r\nni même révéler, son amour pour Arthur. Jusqu’au\r\njour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '35-revision-3', '', '', '2013-01-15 10:22:03', '2013-01-15 09:22:03', '', 35, 'http://localhost/~chauvin/festival/?p=120', 0, 'revision', '', 0),
(121, 1, '2013-01-15 10:23:52', '2013-01-15 09:23:52', '<ul>\r\n<li>Durée : 7 minutes</li>\r\n</ul>\r\n\r\n<p>C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une  etite ville de province où tout le monde se connaît, la révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une  confidence.</p>\r\n', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '33-revision-4', '', '', '2013-01-15 10:23:52', '2013-01-15 09:23:52', '', 33, 'http://localhost/~chauvin/festival/?p=121', 0, 'revision', '', 0),
(122, 1, '2013-01-15 10:20:20', '2013-01-15 09:20:20', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '31-revision-3', '', '', '2013-01-15 10:20:20', '2013-01-15 09:20:20', '', 31, 'http://localhost/~chauvin/festival/?p=122', 0, 'revision', '', 0),
(123, 1, '2013-01-14 16:40:31', '2013-01-14 15:40:31', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-10', '', '', '2013-01-14 16:40:31', '2013-01-14 15:40:31', '', 20, 'http://localhost/~chauvin/festival/?p=123', 0, 'revision', '', 0);
INSERT INTO `fes_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(124, 1, '2013-01-21 16:48:41', '2013-01-21 15:48:41', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-11', '', '', '2013-01-21 16:48:41', '2013-01-21 15:48:41', '', 20, 'http://localhost/~chauvin/festival/?p=124', 0, 'revision', '', 0),
(125, 1, '2013-01-21 16:49:24', '2013-01-21 15:49:24', '<ul class="rslides">\r\n  <li><img src="http://responsive-slides.viljamis.com/1.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/2.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/3.jpg" alt=""></li>\r\n</ul>\r\n<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-12', '', '', '2013-01-21 16:49:24', '2013-01-21 15:49:24', '', 20, 'http://localhost/~chauvin/festival/?p=125', 0, 'revision', '', 0),
(126, 1, '2013-01-21 16:51:48', '2013-01-21 15:51:48', '<ul class="slideshow">\r\n  <li><img src="http://responsive-slides.viljamis.com/1.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/2.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/3.jpg" alt=""></li>\r\n</ul>\r\n<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-13', '', '', '2013-01-21 16:51:48', '2013-01-21 15:51:48', '', 20, 'http://localhost/~chauvin/festival/?p=126', 0, 'revision', '', 0),
(128, 1, '2013-01-21 17:00:41', '2013-01-21 16:00:41', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-14', '', '', '2013-01-21 17:00:41', '2013-01-21 16:00:41', '', 20, 'http://localhost/~chauvin/festival/?p=128', 0, 'revision', '', 0),
(129, 1, '2013-01-22 10:31:43', '2013-01-22 09:31:43', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.\r\n\r\n<ul class="rslides">\r\n  <li><img src="http://responsive-slides.viljamis.com/1.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/2.jpg" alt=""></li>\r\n  <li><img src="http://responsive-slides.viljamis.com/3.jpg" alt=""></li>\r\n</ul>\r\n', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-15', '', '', '2013-01-22 10:31:43', '2013-01-22 09:31:43', '', 20, 'http://localhost/~chauvin/festival/?p=129', 0, 'revision', '', 0),
(130, 1, '2013-01-25 11:10:48', '2013-01-25 10:10:48', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.\r\n\r\n\r\n<ul class="slideshow">\r\n    <?php print getSlideItem(); ?>\r\n</ul>', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-16', '', '', '2013-01-25 11:10:48', '2013-01-25 10:10:48', '', 20, 'http://localhost/~chauvin/festival/?p=130', 0, 'revision', '', 0),
(131, 1, '2013-01-28 16:01:29', '2013-01-28 15:01:29', '<h1 style="text-align: center;">Bienvenue sur Festival LGBT</h1>\r\n\r\n<div style="text-align: justify;">\r\n<p>Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le  Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire  aux éditions précédentes.</p>\r\n\r\n\r\n<p>Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les  discriminations liées à l’orientation sexuelle et au genre. Au programme de ce  rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n\r\n\r\n<p>En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les  Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander,  un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.</p>\r\n</div>\r\n\r\nBon festival !\r\n<b>Christel Guillard</b>, coordinatrice générale.\r\n\r\n\r\n<ul class="slideshow">\r\n    <?php echo getSlideItem(); ?>\r\n</ul>', 'Edito', '', 'inherit', 'closed', 'closed', '', '20-revision-17', '', '', '2013-01-28 16:01:29', '2013-01-28 15:01:29', '', 20, 'http://localhost/~chauvin/festival/?p=131', 0, 'revision', '', 0),
(132, 1, '2013-01-14 16:32:25', '2013-01-14 15:32:25', '<p>Toute l''équipe du <b>Festival LGBT</b> tient à remercier tous ces organismes : </p>\r\n<ul>\r\n<li>La Région Centre</li>\r\n<li>La Mairie d''Orléans</li>\r\n<li>Le cinéma des Carmes</li>\r\n<li>Le Groupe Action Gay &amp; Lesbien - Loiret</li>\r\n<li>Citégay</li>\r\n<li>La dixième Muse</li>\r\n<li>Têtu</li>\r\n<li>Yagg.com</li>\r\n<li>France Bleu Orléans</li>\r\n<li>Bagdam Espace Lesbien ( Toulouse )</li>\r\n<li>Cineffable</li>\r\n<li>Le Festival Tous Courts ( Aix en Provence )</li>\r\n<li>Les VidéObstinées</li>\r\n</ul>\r\n', 'Remerciements', '', 'inherit', 'closed', 'closed', '', '6-revision-4', '', '', '2013-01-14 16:32:25', '2013-01-14 15:32:25', '', 6, 'http://localhost/~chauvin/festival/?p=132', 0, 'revision', '', 0),
(133, 1, '2013-01-14 16:33:37', '2013-01-14 15:33:37', '<p>Voici nos partenaires officiels : </p>\r\n<ul>\r\n<li>Région Centre</li>\r\n<li>Orléans</li>\r\n<li>Cinéma des Carmes</li>\r\n<li>GAGL</li>\r\n<li>Têtu</li>\r\n<li>La dixième MUSE</li>\r\n<li>CiteGay</li>\r\n<li>Yagg.com</li>\r\n<li>France Bleu</li>\r\n</ul>\r\n', 'Partenaires', '', 'inherit', 'closed', 'closed', '', '8-revision-5', '', '', '2013-01-14 16:33:37', '2013-01-14 15:33:37', '', 8, 'http://localhost/~chauvin/festival/?p=133', 0, 'revision', '', 0),
(134, 1, '2013-01-14 16:38:10', '2013-01-14 15:38:10', '<p>Toutes les informations pratiques à propos du <strong>Festival LGBT</strong>.</p>\r\n<ul>\r\n	<li><b>Lieu du festival : </b> Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS</li>\r\n	<li><b>Tarifs :</b> \r\n<ul>\r\n	<li>Plein tarif : 7,50 €</li>\r\n	<li>Pass Festival : 25 € (5 séances)</li>\r\n	<li>Soirée courts métrages : 6 € (vendredi)</li>\r\n	<li>2 séances consécutives le samedi ou le dimanche : 12 €</li>\r\n</ul>\r\n</li>\r\n	<li><b>Cartes &amp; réductions acceptées :</b> <br />\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.</li>\r\n	<li><b>Equipe :</b> \r\n<ul>\r\n	<li><b>Direction artistique :</b>  Christel Guillard (Présidente de Ciné Mundi)</li>\r\n	<li><b>Programmation :</b>  Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)</li>\r\n	<li><b>Communication &amp; partenariats :</b>  Christel Guillard</li>\r\n	<li><b>Conception graphique :</b>  Yannis Bellair</li>\r\n	<li><b>Conception du site internet : </b> rccc</li>\r\n	<li><b>Impression : </b> Prevost Offset</li>\r\n</ul>\r\n</li>\r\n	<li>Contacts : <a href="mailto:festival.dunbordalautre@gmail.com" title="">festival.dunbordalautre@gmail.com</a> et <a href="http://www.festivaldunbordalautre.com" title="">www.festivaldunbordalautre.com</a></li>\r\n</ul>', 'Infos pratiques', '', 'inherit', 'closed', 'closed', '', '2-revision-6', '', '', '2013-01-14 16:38:10', '2013-01-14 15:38:10', '', 2, 'http://localhost/~chauvin/festival/?p=134', 0, 'revision', '', 0),
(135, 1, '2013-01-14 16:52:15', '2013-01-14 15:52:15', 'test', 'test', '', 'inherit', 'closed', 'closed', '', '86-revision-2', '', '', '2013-01-14 16:52:15', '2013-01-14 15:52:15', '', 86, 'http://localhost/~chauvin/festival/?p=135', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `fes_terms`
--

CREATE TABLE IF NOT EXISTS `fes_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `fes_terms`
--

INSERT INTO `fes_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'films', 'films', 0),
(2, 'courts-metrages', 'courts-metrages', 0),
(3, 'navigation', 'navigation', 0),
(4, 'can''t think straight', 'cant-think-straight', 0),
(5, 'shamim sarif', 'shamim-sarif', 0),
(6, 'el nino pez', 'el-nino-pez', 0),
(7, 'Lucía Puenzo', 'lucia-puenzo', 0),
(8, 'film Lucía Puenzo', 'film-lucia-puenzo', 0),
(9, 'ander film', 'ander-film', 0),
(10, 'post-format-image', 'post-format-image', 0);

-- --------------------------------------------------------

--
-- Structure de la table `fes_term_relationships`
--

CREATE TABLE IF NOT EXISTS `fes_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fes_term_relationships`
--

INSERT INTO `fes_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 3, 0),
(16, 3, 0),
(17, 3, 0),
(18, 3, 0),
(19, 3, 0),
(25, 2, 0),
(28, 3, 0),
(31, 2, 0),
(33, 2, 0),
(35, 2, 0),
(37, 2, 0),
(39, 2, 0),
(41, 2, 0),
(43, 2, 0),
(45, 1, 0),
(45, 10, 0),
(47, 1, 0),
(47, 9, 0),
(49, 1, 0),
(49, 6, 0),
(49, 7, 0),
(49, 8, 0),
(51, 1, 0),
(51, 4, 0),
(51, 5, 0),
(86, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fes_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `fes_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `fes_term_taxonomy`
--

INSERT INTO `fes_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', 'Catégorie des films.', 0, 4),
(2, 2, 'category', 'courts-metrages', 0, 8),
(3, 3, 'nav_menu', '', 0, 6),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'post_tag', '', 0, 1),
(8, 8, 'post_tag', '', 0, 1),
(9, 9, 'post_tag', '', 0, 1),
(10, 10, 'post_format', '', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fes_usermeta`
--

CREATE TABLE IF NOT EXISTS `fes_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `fes_usermeta`
--

INSERT INTO `fes_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'simon'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'fes_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'fes_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(13, 1, 'show_welcome_panel', '0'),
(14, 1, 'fes_dashboard_quick_press_last_post_id', '127'),
(15, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:"link-target";i:1;s:3:"xfn";i:2;s:11:"description";}'),
(16, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(17, 1, 'nav_menu_recently_edited', '3'),
(18, 1, 'fes_user-settings', 'editor=html&libraryContent=browse'),
(19, 1, 'fes_user-settings-time', '1358176074'),
(20, 1, 'closedpostboxes_post', 'a:0:{}'),
(21, 1, 'metaboxhidden_post', 'a:7:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:16:"commentstatusdiv";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";i:6;s:12:"revisionsdiv";}'),
(22, 1, 'closedpostboxes_page', 'a:0:{}'),
(23, 1, 'metaboxhidden_page', 'a:5:{i:0;s:10:"postcustom";i:1;s:11:"commentsdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";i:4;s:12:"revisionsdiv";}');

-- --------------------------------------------------------

--
-- Structure de la table `fes_users`
--

CREATE TABLE IF NOT EXISTS `fes_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fes_users`
--

INSERT INTO `fes_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'simon', '$P$BZeJ76AlfOY/4ZLs20yw/FWGh2MFUx.', 'simon', 'simon.chauvin@etu.univ-orleans.fr', '', '2013-01-08 07:51:52', '', 0, 'simon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
