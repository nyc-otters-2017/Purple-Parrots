get '/questions' do
  @questions = Question.all

  erb :'/questions/index'
  # this page should display posted questions
  # will probably need to change to the home page erb
end

get '/questions/new' do
  # may need current_user to persist question once posted
  erb :'/questions/new'
  # this page should contain the question form

  # once the user submits the question form they should be
  # directed to a page which contains the posted question with
  # the form to submit answer and comments
end

post '/questions' do
  @question = Question.create( title: params[:title], question: params[:question] )
  if @question.save
    status 200
    redirect "/questions/#{question.id}"
  else
    status 422
    redirect '/questions/new'
  end
  # this page should post the question
end

# get '/questions/:id/edit' do
#   question = Question.find(params[:id])
#
#   erb :'questions/edit'
# end

get '/questions/:id' do
  @question = Question.find(params[:id])

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
