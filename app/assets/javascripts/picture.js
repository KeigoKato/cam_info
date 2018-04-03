$(function(){
  $(document).on('turbolinks:load', function(){
    $('#picture-tags').tagit({
      placeholderText: "タグを追加しよう",
      fieldName: "picture[tag-list]",
      singleField: true
    });
  });
});
