<?php include('blog-head.php'); ?>

<?php include('blog-header-image.php'); ?>

		<!-- Contact Form -->
					<article class="box">
						<header>
							<h2><a href="#"><?= $blogSettings->blog_headline ?></a></h2>
							<h1><?= $blogSettings->blog_summary ?></h1>
						</header>

						<div class="HomeCards">
<?php
	$cards = $pages->find("template=blog-post, blog_post_sticky=1, sort=-blog_post_sticky, sort=-blog_date, limit=" . $blogSettings->blog_quantity);
	$cards->prepend($pages->find("template=blog-post, blog_post_sticky!=1, sort=-blog_date, limit=" . $blogSettings->blog_quantity));
	$cards = $cards->slice(0, $blogSettings->blog_quantity);
	
	foreach($cards as $card) {
		
		if($card->blog_images) $img = $card->blog_images->first();
?>
							<div class="HomeCard">
								
								<?= $img ? "<img class='HomeCardImage' src='{$img->url}'>" : "<p class='HomeCardBlank'>&nbsp;</p>" ?>
								
								<h3 class='HomeCardTitle'><?= $card->title ?></h3>
								
								<p><em><?= sprintf(
									_x("Posted on %s", "blog"),
									strftime(_x("%m/%d/%Y", "blog"), $card->getUnformatted("blog_date"))
								) ?></em></p>
								
								<p><?= makeSummary($card->blog_body, 400) ?></p>
								
								<p><a class="button morelink" href="<?= $card->url ?>"><?= _x("Read full blog entry", "blog") ?></a></p>
								
							</div>
<?php	
	}
	
	// Fill up blank columns in last row with empty cards so
	// the last card doesn't accidentally slide to the right
	if($cards->count % 3 != 0) {
		
		for($i = 0; $i < 3 - ($cards->count % 3); $i++) {
?>
							<div class="HomeCard">
							</div>
<?php
		}
	}
?>

						</div>

					</article>

				</div>
			</div>

<?php include('blog-sidebar.php'); ?>

<?php include('blog-footer.php'); ?>
