$(document).ready(function() {
	listClickable('#phraseList tbody');
	listClickable('#list tr');
	storiesSortable();
	phraseTaggableInEmptyStory();
	phraseRemovableFromStory();
});

function listClickable(id) {
	// fancy color'd on hovor
	$(id).hover(
		function() {
			$(this).css('cursor', 'pointer')
			$(this).addClass('hover');
		},
		function() {
			$(this).removeClass('hover');
		}
	);	

	// clickable rows
	$(id).click(function() {
		var href = $(this).find('a').attr('href');
        if (href) {
            window.location = href;
        }
	});
}

function storiesSortable()
{
	$('#storiesList').sortable({
		axis: 'y', 
		cursor: 'move',
		opacity: 0.4,
		scroll: true,
		tolerance: 'pointer',
		update: function(){
			$.ajax({
				type: 'post', 
				data: $('#storiesList').sortable('serialize') + '&id=' + getStoryIDFromURL(), 
				dataType: 'script', 
				url: '/stories/order',
				complete: function(request) {
					$('#storiesList').effect('highlight', {color: '#F7BDA8'}, 1000);
				}
			})
		}
	});
}

function getStoryIDFromURL() {
	return /\/stories\/(\d+)/.exec(document.URL)[1]
}

function getPhraseIDFromHidden(startingFrom) {
	 return $('#phrase_id', startingFrom).attr('value')
}

function phraseTaggableInEmptyStory() {
	$('.taggable').click(function() {
		var phrase = $(this);
		$.ajax({
			type: 'post',
			data: 'story_id=' + getStoryIDFromURL() + '&phrase_id=' + getPhraseIDFromHidden(this),
			url: '/stories/tag',
			complete: function(request) {
				phrase.effect('highlight', {color: '#F7BDA8'}, 500);
			}
		});
	});
}

function phraseRemovableFromStory() {
	$('.removePhraseFromStory').click(function(event) {
		event.preventDefault();
		var href = this.href.split('?')[1];
		var table = $('#entry-' + /phrase_id=(\d+)/.exec(href)[1]);

		$.ajax({
			type: 'post',
			data: href,
			url: '/stories/remove',
			complete: function(request) {
				table.slideUp();
			}
		});
	});
}
