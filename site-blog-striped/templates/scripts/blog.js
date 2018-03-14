$(document).ready(function() {

	$('nav li a').each(function(idx, el) {
		if($(el).attr('href') == window.location.pathname) {
			$(el).parent().addClass('current');
		}
	});
	
	$('div.CommentForm_new > h3').click(function(evt) {
		var $h3 = $(evt.target);
		var $frm = $h3.next();
		if($frm.is(':visible')) {
			$frm.slideUp();
		} else {
			$frm.slideDown();
		}
	});
	
	$('#toggle_sort').click(function(evt) {
		var $btn = $(evt.target);
		var $p = $btn.prev();
		$.get(
			$btn.data('target'),
			{sortorder: $btn.data('newsort')},
			function(data) {
				$btn.data('newsort', data.newsort);
				$p.html(data.html);
				window.location.reload();
			}
		);
	});
});
