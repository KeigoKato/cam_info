$(function(){
  $(document).on('turbolinks:load', function(){
    $('#picture-tags').tagit({
      placeholderText: "タグを追加しよう",
      fieldName: "picture[tag_list]",
      singleField: true
    });
    if (gon.picture_tags){
      for (let tag in gon.available_tags){
        $("#picture_tags").tagit("createTag", tag)
      }
    }
  });
});
