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

  $("#comments-for-questions").submit(function(event) {
    event.preventDefault();
    var type = $(event.target).attr("method");
    var url = $(event.target).attr("action");
    var data = $(event.target).serialize();
    $.ajax({
      type: type,
      url: url,
      data: data
    }).success(function(response) {
      $("#question-comments").append(response);
      $(".comment").val('');
    })
  })


  $(".comments-for-answers").submit(function(event) {
    event.preventDefault();
    var type = $(event.target).attr("method");
    var url = $(event.target).attr("action");
    var data = $(event.target).serialize();
    $.ajax({
      type: type,
      url: url,
      data: data
    }).success(function(response) {
      $(event.target).parent().siblings().last().append(response);
      $(".comment").val('');
    }).fail(function(response) {

    })
  });

  $(".upvote-inline").submit(function(e){
    e.preventDefault();

    var url = $(e.target).attr("action");
    $.ajax({
      type: "post",
      url: url
    }).success(function(response){
      $("#vote-up").css("color", "purple");
      $("#votes-counter").text(response + " Votes");
    }).fail(function(error){
      console.log(error);
    });
  });

  $(".downvote-inline").submit(function(e){
    e.preventDefault();

    var url = $(e.target).attr("action");
    $.ajax({
      type: "post",
      url: url
    }).success(function(response){
      $("#vote-down").css("color", "purple");
      $("#votes-counter").text(response + " Votes");
    }).fail(function(error){
      console.log(error);
    });
  });

  $("#logo").mouseover(function(){
    this.src = '/images/Kernal_Panic_popcorn.jpg'
  }).mouseout(function(){
    this.src = '/images/Kernal_Panic_kernal.jpg'
  })
});
