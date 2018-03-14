<?php

/**
 *
 * Output a single blog post with full body and images
 *
 */

$blogts = $page->getUnformatted("blog_date");
?>
						<article class="box post">
							<header>
								<h2><a href="#"><?= $page->title ?></a></h2>
							</header>
							<div class="info">
								<?= blogDate($blogts); ?>

								<ul class="stats">
									<li><a href="#" class="icon fa-comment" title="<?= sprintf(_x("%d comments", "blog"), $page->blog_comments->count) ?>"><?= $page->blog_comments->count ?></a></li>
									<li><a href="#" title="<?= sprintf(_x("%0.1f stars", "blog"), $page->blog_comments->stars(true)) ?>"><?= $page->blog_comments->renderStars() ?></a></li>
								</ul>

							</div>
							
							<div class='BlogBody'>
								<?= $page->blog_body ?>
							</div>
							
							<?php include("blog-article-tags.php"); ?>

							<?php include("blog-prevnext.php"); ?>

							<p><?= $page->blog_comments->count > 0 ? $page->blog_comments->render() : "" ?></p>

							<p><?= $page->blog_comments->renderForm(array(
								"headline"		=>	"<h3 class='icon fa-plus' title='" .
												_x("Click to leave a comment", "blog") .
												"'> " . _x("Post a Comment", "blog") . "</h3>"
							)) ?></p>

						</article>
