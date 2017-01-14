post '/questions/:id/answer' do
  current_user
  @answer = Answer.new(answer: params[:answer], question_id: params[:id], user_id: @current_user.id)
  @question = Question.find(params[:id])
  if @answer.save
    status 200
    if request.xhr?
      return params[:answer]
    else
      redirect '/questions'
    end
  else
    status 422
  end
end


post '/answers/:id/comment' do
  answer = Answer.find(params[:id])
  question = answer.question
  comment = answer.comments.new(comment: params[:comment], commentable_id: answer.id, commentable_type: answer, user_id: current_user.id)
  if request.xhr?
    if comment.save
      status 200
      erb :"partial/_answer", layout: false, locals: {answer: answer, comment: comment}
    else status
      status 422
    end
  else
    redirect :"/questions/#{question.id}"
  end
end
