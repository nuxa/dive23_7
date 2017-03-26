// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require tag-it
//= require twitter/bootstrap
//= require_tree .


$(document).ready(function(){
  var i, len, ref, results, tag;
  $('#question-tags').tagit({
    fieldName: 'question[tag_list]',
    singleField: true,
    availableTags: gon.available_tags,
    tagLimit:5
  });

  if (gon.question_tags != null) {
    ref = gon.question_tags;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tag = ref[i];
      results.push($('#question-tags').tagit('createTag', tag));
    }
    return results;
  }
})
