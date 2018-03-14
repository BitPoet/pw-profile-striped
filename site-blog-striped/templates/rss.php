<?php
header("Content-type: application/xml+rss");
?><?xml version="1.0" encoding="utf-8"?>

<rss version="2.0">

<?php
	$posts = $pages->find("template=blog-post, sort=-blog_date, limit=10");
	$newest = $posts->first();
?>

	<channel>
		<title><?= $blogSettings->blog_headline ?></title>
		<link><?= $pages->get('/')->httpUrl ?></link>
		<description><?= $blogSettings->blog_summary ?></description>
		<language>en_US</language>
		<copyright><?= $blogSettings->blog_note ?></copyright>
		<pubDate><?= date('r', $newest->getUnformatted("blog_date")) ?></pubDate>
		<image>
			<url><?= $blogSettings->blog_header_image->httpUrl ?></url>
			<title><?= $blogSettings->blog_headline ?></title>
			<link><?= $pages->get("/posts/")->httpUrl ?></link>
		</image>

<?php foreach($posts as $post) { ?>

		<item>
			<title><?= $post->title ?></title>
			<description><?= $post->blog_summary ?></description>
			<link><?= $post->httpUrl ?></link>
			<author><?= $post->createdUser->title ?: $post->createdUser->name ?>, <?= $post->createdUser->email ?></author>
			<guid><?= $pages->get('/posts')->url . $post->id ?></guid>
			<pubDate><?= date('r', $post->getUnformatted('blog_date')) ?></pubDate>
		</item>

<?php } ?>

	</channel>
</rss>
