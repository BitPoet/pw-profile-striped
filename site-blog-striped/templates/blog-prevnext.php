<?php

$sortorder = $chronological ? "" : "-";
$comparePrev = $chronological ? "<" : ">";
$compareNext = $chronological ? ">" : "<";

$prevSel = "template=blog-post, id!={$page->id}, blog_date$comparePrev$blogts, sort={$sortorder}blog_date";
$nextSel = "template=blog-post, id!={$page->id}, blog_date$compareNext$blogts, sort={$sortorder}blog_date";

$prev = $pages->findOne($prevSel);
$next = $pages->findOne($nextSel);

?>
							<p>
<?php if(! $prev instanceof NullPage) { ?>
								<a class="button prevlink" href="<?= $prev->url ?>"><?= _x("&lt; Previous Post", "blog") ?></a>
<?php }
	  if(! $next instanceof NullPage) { ?>
								<a class="button nextlink" href="<?= $next->url ?>"><?= _x("Next Post &gt;", "blog") ?></a>
<?php } ?>
							</p>
