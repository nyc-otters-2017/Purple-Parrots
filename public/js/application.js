$(document).ready(function(){

  $(".post-question").submit(function(e) {
    e.preventDefault();

    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      url: url
    }).success(function(response) {

    }).fail(function(error) {

    });
  });



});
