get '/questions' do
  @questions = Question.all.order(created_at: :desc)

  erb :'/questions/index'
  # this page should display posted questions
  # will probably need to change to the home page erb
end

get '/questions/new' do
  require_user
  # must be current_user to persist question once posted
  erb :'/questions/new'
  # this page should contain the question form

  # once the user submits the question form they should be
  # directed to a page which contains the posted question with
  # the form to submit answer and comments
end

post '/questions' do
  @question = Question.new(user_id: current_user.id, title: params[:title], question: params[:question] )
  if @question.save
    status 200
    redirect "/questions/#{@question.id}"
  else
    status 422
    redirect '/questions/new'
  end
  # this page should post the question
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @comments = @question.comments
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  current_user
  if @question.user.id == @current_user.id
    erb :'questions/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end


put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update( title: params[:title], question: params[:question] )

  erb :'/questions/show'
end


delete '/questions/:id' do
  @question = Question.find(params[:id])
  current_user
  if @question.user.id == @current_user.id
  question.delete
    if request.xhr?
      "#{@question.id}"
    else
      redirect "/questions/#{@question.id}"
    end
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:id/comment' do
  question = Question.find(params[:id])
  comment = question.comments.new(comment: params[:comment], commentable_id: question.id, commentable_type: question, user_id: current_user.id)
  if request.xhr?
    if comment.save
      status 200
      erb :"partial/_answer_comment", layout: false, locals: {comment: comment}
    else status
      status 422
    end
  else
    redirect :"/questions/#{params[:id]}"
  end
end

post '/questions/answers/:id/comment' do
  answer = Answer.find(params[:id])
  question = answer.question
  comment = answer.comments.new(comment: params[:comment], commentable_id: answer.id, commentable_type: answer, user_id: current_user.id)
  if request.xhr?
    if comment.save
      status 200
      erb :"partial/_answer_comment", layout: false, locals: {answer: answer, comment: comment}
    else status
      status 422
    end
  else
    redirect :"/questions/#{question.id}"
  end
end


post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @question_vote = @question.votes.create(votable_id: @question.id, votable_type: @question, user_id: current_user.id)
  if request.xhr?
    "#{@question.votes.count}"
  else
    redirect "/questions/#{params[:id]}"
  end
end


post '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  @delete_vote = @question.votes.last.delete
  if request.xhr?
    "#{@question.votes.count}"
  else
    redirect "/questions/#{params[:id]}"
  end
end
