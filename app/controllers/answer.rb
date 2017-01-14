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
