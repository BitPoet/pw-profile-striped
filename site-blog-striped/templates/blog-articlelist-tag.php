<?php

/**
 *
 * Output a list of articles having to the chosen tag
 *
 */

$sortorder = $session->chronological ? "" : "-";

$blogposts = $pages->find("template=blog-post, blog_tags=$page, sort={$sortorder}created, limit=" . $blogSettings->blog_numitems);

foreach($blogposts as $blogpost)
{
		$blogts = $blogpost->getUnformatted("blog_date");
?>
						<article class="box post post-excerpt">
							<header>
								<h2><a href="#"><?= $blogpost->title ?></a></h2>
							</header>
							<div class="info">
								<?= blogDate($blogts); ?>

								<ul class="stats">
									<li><a href="#" class="icon fa-comment" title="<?= sprintf(_x("%d comments", "blog"), $blogpost->blog_comments->count) ?>"><?= $blogpost->blog_comments->count ?></a></li>
									<li><a href="#" title="<?= sprintf(_x("%0.1f stars", "blog"), $blogpost->blog_comments->stars(true)) ?>"><?= $blogpost->blog_comments->renderStars() ?></a></li>
								</ul>

							</div>
							
<?php if($blogpost->blog_images->count) {
								$img = $blogpost->blog_images->first;
								$thumb = $img->size(100, 100);
?>
							<p><img src="<?= $thumb->url ?>" alt="<?= str_replace('"', '&quot;', $thumb->description) ?>" /></p>
<?php } ?>

							<?= $blogpost->blog_summary ?: ("<p>" . makeSummary($blogpost->blog_body, 500) . "</p>") ?>

							<p><em><?= sprintf(_x("This blog entry has %d comments", "blog"), $blogpost->blog_comments->count) ?></em></p>

							<p><a class="button morelink" href="<?= $blogpost->url ?>"><?= _x("Read full blog entry", "blog") ?></a></p>
							
						</article>
<?php
}

echo blogPager($blogposts);
