$(document).ready(function(){

  $("#answer-form").on("submit", function(e) {
    e.preventDefault();

    var url = $(e.target).attr("action");
    var data = $(e.target).serialize();
    $.ajax({
      type: "post",
      url: url,
      data: data
    }).success(function(response) {
      $(".answer-container").append(response);
    }).fail(function(error) {
      console.log(error)
    });
  });



});
