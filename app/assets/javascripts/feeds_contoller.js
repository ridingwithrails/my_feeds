// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$.getJSON("/feeds.json", function(data) {
		for (i=0; i<data.length; i++) {
			var story = $.parseJSON(data[i]);
			var storyContent = "<div class='story'><h2><a href='" + story.url + "'>" + story.title + "</a></h2><div class='summary'>" + story.summary + "</div></div>";
			$("#stories").append(storyContent);
		}
	});

});