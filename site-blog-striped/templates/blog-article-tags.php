							<p>
								<span>Tags:<span> <?php
	echo implode(" | ", array_map(function($tag) { return "<span><a href='{$tag->url}'>{$tag->title}</a></span>"; }, $page->blog_tags->getArray()));
?>
							</p>
