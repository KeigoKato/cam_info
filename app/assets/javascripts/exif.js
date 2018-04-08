$(document).on('turbolinks:load', function() {
  $('#check_dataTime').change(function() {
    var val = $("#check_dataTime").prop("checked");
    // if (val == false) {
    //   $("#text_dataTime").val("");
    // }
  });
});
