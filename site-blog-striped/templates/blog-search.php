<?php include('blog-head.php'); ?>

<?php include('blog-header-image.php'); ?>

		<!-- Contact Form -->
					<article class="box">
						<header>
							<h2><a href="#"><?= $page->title ?></a></h2>
						</header>

						<section class="box search">
							<form method="get">
								<input type="text" class="text" name="search" placeholder="Search" value="<?= $input->get->search ?>" />
							</form>
						</section>
<?php

if($input->get->search)
{
					$selectors = array();
					if($input->get->search) {
						$searches = preg_split('/\s+/', $input->get->search);
						foreach($searches as $search) {
							$selectors[] = "blog_body|blog_summary|title%=" . $sanitizer->selectorValue($search);
						}
					}
					$selector = "template=blog-post, " . implode(", ", $selectors) . ", limit=" . $blogSettings->blog_numitems;
					$input->whitelist('search', $input->get->search);
					$results = $pages->find($selector);
?>				
					<ul class="SearchResults">
<?php
	if(! $results) {
?>
						<li><?= _x("No blog entries found matching your search", "blog") ?></li>
<?php
	} else {
		foreach($results as $result) {
?>
						<li><a href="<?= $result->url ?>"><?= $result->title ?></a> [<?= $result->blog_date ?>]<br><em><?= makeSummary($result->blog_body, 200) ?></em></li>
<?php
		}
	}
?>
					</ul>

<?= blogPager($results) ?>

<?php
}
?>

					</article>

				</div>
			</div>

<?php include('blog-sidebar.php'); ?>

<?php include('blog-footer.php'); ?>
