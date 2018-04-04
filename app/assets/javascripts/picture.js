$(document).on('turbolinks:load', function(){
  $('#picture-tags').tagit({
    placeholderText: "タグを追加しよう",
    fieldName: "picture[tag_list]",
    availableTags: gon.available_tags,
    singleField: true
  });
  if (gon.picture_tags) {
    for (let tag in gon.picture_tags) {
      $("#picture-tags").tagit("createTag", gon.picture_tags[tag]);
    }
  }
});
