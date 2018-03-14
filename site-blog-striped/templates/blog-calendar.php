<?php

/**
 *
 * Output a calendar for the current month
 *
 * Highlights the current day and all days with posts.
 * Has links to a list of posts for a day if there are such.
 *
 */

/** Calculate calendar settings **/
$dayCols = [];

$curDT = new \DateTime();
$curDay = $curDT->format('w');
$curMonth = $curDT->format('m');
$curYear = $curDT->format('Y');

$startDT = clone $curDT;
if($curDay != 1) {
	$delta = new DateInterval('P' . ($curDay > 0 ? $curDay - 1 : 6) . 'D');
	$startDT->sub($delta);
}

$oneDay = new DateInterval("P1D");
for($i = 0; $i < 7; $i++) {
	$wDay = $startDT->format('l');
	$dayCols[] = [$wDay, substr($wDay,0,1), ($i == 5) ? 'saturday' : (($i == 6) ? 'sunday' : 'weekday')];
	$startDT->add($oneDay);
}

$offset = ($curDT->format("j") - $curDay + 6) % 7;
$daysInMonth = $curDT->format('t');

/* Retrieve a list of all posts in this month to highlight their publish dates in the calendar */
$mStart = DateTime::createFromFormat("Y-m-d H:i:s", sprintf("%d-%d-01 00:00:00", $curDT->format('Y'), $curDT->format('m')));
$mEnd   = DateTime::createFromFormat("Y-m-d H:i:s", sprintf("%d-%d-%02d 23:59:59", $curDT->format('Y'), $curDT->format('m'), $daysInMonth));
$selInMonth = "template=blog-post, blog_date>=" . $mStart->getTimestamp() . ", blog_date<=" . $mEnd->getTimestamp();
$monthPosts = $pages->find($selInMonth);

$daysFound = array();
foreach($monthPosts as $mPost) {
	$daysFound[date('j', $mPost->getUnformatted("blog_date"))]++;
}

$postsPage = $pages->get('/posts/');

?>
					<section class="box calendar">
						<div class="inner">
							<table>
								<caption><?= strftime("%b %Y") ?></caption>
								<thead>
									<tr>
<?php foreach($dayCols as $col) { ?>
										<th scope="col" title="<?= $col[0] ?>" class="<?= $col[2] ?>"><?= $col[1] ?></th>
<?php } ?>
									</tr>
								</thead>
								<tbody>
<?php
	for($i = 0; $i < (int)ceil(($daysInMonth + $offset) / 7); $i++)
	{
?>
									<tr>
<?php
		for($d = 1; $d < 8; $d++)
		{
			$realDay = $d + 7 * $i - $offset;
			if(($i == 0 && $d <= $offset) || $realDay > $daysInMonth)
			{
				/* Month doesn't start on Monday, add padding */
?>
										<td class="pad"><span>&nbsp;</span></td>
<?php
			} else {
				$tdClass = $realDay == $curDT->format("j") ? " today" : "";
					
				if($daysFound[$realDay]) {
?>
									<td class='withpost<?= $tdClass ?>'><a href='<?= $postsPage->url . $curYear . "-" . $curMonth . "-" . $realDay ?>'><?= $realDay ?></a></td>
<?php	
				} else {
?>
									<td class='<?= $tdClass ?>'><span><?= $realDay ?></span></td>
<?php
				}
			}
		}
?>
									</tr>
<?php
	}
?>
								</tbody>
							</table>
						</div>
					</section>
