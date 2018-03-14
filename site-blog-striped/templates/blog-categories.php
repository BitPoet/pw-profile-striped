<?php include('blog-head.php'); ?>

<?php include('blog-header-image.php'); ?>

					<article class="box">
						<header>
							<h2><a href="#"><?= $page->title ?></a></h2>
						</header>
						<ul class="CategoryList">
<?php foreach($pages->find("template=blog-category, sort=title") as $category) { ?>
							<li>
								<a href="<?= $category->url ?>"><?= $category->title ?></a><br>
								<?= sprintf(_x("Number of blog posts: %d", "blog"), $pages->count("template=blog-post, blog_categories=$category")) ?>
							</li>
<?php } ?>
						</ul>
					</article>
				</div>
			</div>

<?php include('blog-sidebar.php'); ?>

<?php include('blog-footer.php'); ?>
