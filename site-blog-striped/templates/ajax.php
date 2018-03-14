<?php

if(! $config->ajax) {
	echo "<p></p>";
	return;
}

header("Content-type: application/json");

if($input->get->sortorder) {
	echo json_encode(array(
		"newsort"		=>	$chronological ? "desc" : "asc",
		"html"			=>	sprintf(
			html_entity_decode(__("Lists are sorted by date <strong>%s</strong> (%s)", "blog")),
			$chronological ? "ascending" : "descending",
			$chronological ? "oldest to newest" : "newest first"
		)
	));
	return;
}
