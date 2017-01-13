$(document).ready(function(){

  $("#answer-form").submit(function(e) {
    e.preventDefault();

    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      url: url
    }).success(function(response) {
      console.log("hi")
      // $(".show-question").append(response);
    }).fail(function(error) {
      console.log(error)
    });
  });



});
