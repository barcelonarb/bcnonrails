// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
	$("#datetime").datetimepicker({showOn: 'button', buttonImage: '/images/calendar.gif', buttonImageOnly: true });
});

$(document).ready( function(){
  $('#new_user').append( '<input type="hidden" id="ruby_creator" name="ruby_creator" value="Yukihiro Matsumoto">');
})
