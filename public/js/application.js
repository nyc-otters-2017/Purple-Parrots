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

  $("#comments-for-questions").on("submit", function(event) {
    event.preventDefault();
    var type = $(event.target).attr("method")
    var url = $(event.target).attr("action")
    var data = $(event.target).serialize();
    $.ajax({
      type: type,
      url: url,
      data: data
    }).success(function(response) {
      $("#question-comments").append(response);
    })
  })

  $("#comments-for-answers").on("submit", function(event) {
    event.preventDefault();
    var type = $(event.target).attr("method")
    var url = $(event.target).attr("action")
    var data = $(event.target).serialize();
    $.ajax({
      type: type,
      url: url,
      data: data
    }).success(function(response) {
      $("#answer-comments").append(response);
    })
  })

  $("#logo").mouseover(function(){
    this.src = '/images/Kernal_Panic_popcorn.jpg'
  }).mouseout(function(){
    this.src = '/images/Kernal_Panic_kernal.jpg'
  })
});
