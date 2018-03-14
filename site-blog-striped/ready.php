<?php


function monthSnippet($date) {
	$m = date("F", $date);
	return "<span class='month'>" . substr($m, 0, 3) . "<span>" . substr($m, 3) . "</span></span>";
}


function blogPager($blogposts) {
	$pager = $blogposts->renderPager(array(
		"nextItemLabel"			=>	_("Next Page &gt;"),
		"nextItemClass"			=>	"next",
		"previousItemLabel"		=>	_("&lt; Previous Page"),
		"previousItemClass"		=>	"previous",
		"listMarkup"			=>	"{out}",
		"itemMarkup"			=>	"{class}|{out}",
		"linkMarkup"			=>	"{url}|{out}##",
		"currentLinkMarkup"		=>	"{url}|{out}##",
		"currentItemClass"		=>	"current",
		"separatorItemLabel"	=>	"#|&hellip;##",
		"numPageLinks"			=>	2
	));

	$prev = "";
	$next = "";
	$pagerlist = [];

	$entries = explode('##', $pager);

	foreach($entries as $entry) {
		if(! $entry) continue;
		list($class, $url, $label) = explode('|', $entry);
		if(strpos($class, "previous") !== FALSE) {
			$prev = "<a href='$url' class='button previous'>$label</a>";
		} elseif(strpos($class, "next") !== FALSE) {
			$next = "<a href='$url' class='button next'>$label</a>";
		} else {
			if($label == "...") $pagerlist[] = "<span>&hellip;</span>";
			else {
				$cls = (strpos($class, "current") !== FALSE) ? " class='active'" : "";
				$pagerlist[] = "<a$cls href='{$url}'>$label</a>";
			}
		}
	}

	return "
							<div class='pagination'>
								$prev
								<div class='pages'>
									" . implode("\n\t\t\t", $pagerlist) . "
								</div>
								$next
							</div>
	";
}


function makeSummary($text, $maxlength = 0) {
	$blogSettings = wire('pages')->get('/settings/');
	if($maxlength == 0) $maxlength = $blogSettings->blog_small;
	
	$startlength = strlen($text);
	
	// truncate to max length and remove punctuation at the end
	$text = rtrim(substr(strip_tags($text), 0, $maxlength+1), '.!?,;');
	
	// check if we've truncated to a spot that needs further truncation
	if(strlen($text) >= $maxlength) {
		// truncate to last word 
		$text = substr($text, 0, strrpos($text, ' ')); 
	}

	$text = trim($text); 

	if(strlen($text) < $startlength) $text .= "...";
	return $text;
}


function blogDate($blogts) {
	return "
								<span class='date'>". monthSnippet($blogts) . "
								<span class='day'>" . date('d', $blogts) . "</span>
								<span class='year'><span>, </span>" . date('Y', $blogts)  . "</span></span>
";
}
