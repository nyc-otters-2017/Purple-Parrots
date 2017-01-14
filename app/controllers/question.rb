get '/questions' do
  @questions = Question.all

  erb :'/questions/index'
  # this page should display posted questions
  # will probably need to change to the home page erb
end

get '/questions/new' do
  # must be current_user to persist question once posted
  erb :'/questions/new'
  # this page should contain the question form

  # once the user submits the question form they should be
  # directed to a page which contains the posted question with
  # the form to submit answer and comments
end

post '/questions' do
  @question = Question.new( title: params[:title], question: params[:question] )
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
  @question_comments = Comment.where({commentable_type: 'Question'})
  @answer_comments = Comment.where({commentable_type: 'Answer'})

  @answers = @question.answers
  # @answer = Answer.find_by(question_id: @question)
  # @answer_count = @answer.count
  @comments = @question.comments

  erb :'/questions/show'
end


get '/questions/:id/edit' do
  # must be current_user to locate specific user's question - need user_id
  @question = Question.find(params[:id])

  erb :'questions/edit'
end


put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update( title: params[:title], question: params[:question] )

  erb :'/questions/show'
end


delete '/questions/:id' do
  # id of question must match the id of the user deleting
  # need logic/helper for this
  question = Question.find(params[:id])
  question.delete
  if request.xhr?
    "#{question.id}"
  else
    redirect '/questions/new'
  end
end

post '/questions/:id/comment' do
  question = Question.find(params[:id])
  @question_comment = question.comments.create(comment: params[:comment], commentable_id: question.id, commentable_type: question, user_id: current_user.id)
  if request.xhr?
    erb :"partial/_question_comment", layout: false
  else
    redirect :"/questions/#{params[:id]}"
  end
end

post '/questions/answers/:id/comment' do
  answer = Answer.find(params[:id])
  @answer_comment = answer.comments.create(comment: params[:comment], commentable_id: answer.id, commentable_type: answer, user_id: current_user.id)
  if request.xhr?
    erb :"partial/_answer_comment", layout: false
  else
    redirect :"/questions/#{params[:id]}"
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
