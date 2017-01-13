$(document).ready(function(){

  $("#answer-form").submit(function(e) {
    e.preventDefault();

    var url = $(e.target).attr("action");
    var data = $(e.target).serialize();
    debugger
    $.ajax({
      method: "post",
      url: url,
      data: data
    }).success(function(response) {
      // debugger
      console.log("hi")
      // $(".show-question").append(response);
    }).fail(function(error) {
      console.log(error)
    });
  });



});
