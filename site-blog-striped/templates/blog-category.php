<?php include('blog-head.php'); ?>

<?php include('blog-header-image.php'); ?>

					<article class="box">
						<header>
							<h2><a href="#"><?= $page->title ?></a></h2>
						</header>
						<?= sprintf(_x("All blog entries in category '%s'", "blog"), $page->title) ?>
					</article>

					<!-- Posts -->
<?php include('blog-articlelist-category.php'); ?>

				</div>
			</div>

<?php include('blog-sidebar.php'); ?>

<?php include('blog-footer.php'); ?>
