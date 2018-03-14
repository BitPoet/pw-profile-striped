
					<section class="box recent-comments">
						<header>
							<h2><?= _x("Recent Comments", "blog") ?></h2>
						</header>
						<ul>
<?php
	$fld = $fields->get('blog_comments');
	$reccomments = $fld->type->find($fld, "sort=-created, limit=" . ($page->blog_quantity ?: 3));
	foreach($reccomments as $comment) {
?>
							<li><?= $comment->cite ?> <?= _x("on", "blog") ?> <a href="<?= $comment->page->url ?>"><?= $comment->page->title ?></a><br> [<?= strftime('%m/%d/%Y', $comment->created) ?>]</li>
<?php
	}
?>
						</ul>
					</section>
