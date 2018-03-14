		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="<?= $pages->get('/')->url ?>"><?= _x("HOME", "blog") ?></a></h1>

				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="<?= $pages->findOne("template=blog-post, sort=-blog_date")->url ?>"><?= _x("Latest Post", "blog") ?></a></li>
							<li><a href="<?= $pages->get('/posts/')->url ?>"><?= _x("All Posts", "blog") ?></a></li>
							<li><a href="<?= $pages->get('/categories/')->url ?>"><?= _x("Categories", "blog") ?></a></li>
							<?=
								$page->parent->name == "categories" ?
								"<li class='CurrentCategory'><a href='#'>{$page->title}</a></li>" :
								""
								?>
							<li><a href="<?= $pages->get('/tags/')->url ?>"><?= _x("Tags", "blog") ?></a></li>
							<?=
								$page->parent->name == "tags" ?
								"<li class='CurrentTag'><a href='#'>{$page->title}</a></li>" :
								""
								?>
							<li><a href="<?= $pages->get('/about/')->url ?>"><?= _x("About", "blog") ?></a></li>
							<li><a href="<?= $pages->get('/contact/')->url ?>"><?= $pages->get('/contact/')->title ?></a></li>
						</ul>
					</nav>

				<!-- Search -->
					<section class="box search">
						<form method="get" action="<?= $pages->get('/search/')->url ?>">
							<input type="text" class="text" name="search" placeholder="Search" />
						</form>
					</section>

				<!-- Sort -->
					<section class="box text-style1">
						<div class="inner">
							<p><?= sprintf(
									html_entity_decode(_x("Lists are sorted by date <strong>%s</strong> (%s)", "blog")),
									$session->chronological ? "ascending" : "descending",
									$session->chronological ? "oldest to newest" : "newest first"
								) ?></p>
							<button id="toggle_sort" data-newsort="<?= $chronological ? "desc" : "asc" ?>" data-target="<?= $pages->get('/ajax/')->url ?>"><?= _x("Toggle list sort", "blog") ?></button>
						</div>
					</section>

<?php

foreach($blogSettings->blog_widgets as $widget) { ?>

				<!-- <?= $widget->title ?> -->
					<?php
	echo $widget->render();
}

?>

<?php //include('blog-copyright.php'); ?>

			</div>
