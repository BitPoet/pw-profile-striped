<?php

$blogSettings = $pages->get('/settings/');

if($input->get->sortorder) {
	$sort = $sanitizer->text($input->get->sortorder);
	$chronological = $sort == "asc";
	$session->set("chronological", $chronological );
} else {
	$chronological = $session->get("chronological");
}

