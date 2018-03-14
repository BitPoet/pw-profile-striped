<?php include('blog-head.php'); ?>

<?php include('blog-header-image.php'); ?>

		<!-- Contact Form -->
					<article class="box">
						<header>
							<h2><a href="#"><?= $page->title ?></a></h2>
						</header>

					<div><?= $page->blog_body ?></div>

					<?= $modules->get('SimpleContactForm')->render(array(
						"emailTo"		=>	$blogSettings->email
					)) ?>

					</article>

				</div>
			</div>

<?php include('blog-sidebar.php'); ?>

<?php include('blog-footer.php'); ?>
