$(function(){

  $( ".ui.form.reply" ).hide();
    $( ".reply_button" ).click(function() {
      $("#comment-"+$(this).attr("id")).toggle("normal");
    });

});
