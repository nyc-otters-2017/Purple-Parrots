get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.create( title: params[:title],
                      question: params[:question] )
  if @question.save
    status 200
    if request.xhr?
      erb :'/questions/_post_question'
    else
      redirect '/questions/new'
    end
  else
    status 422
  end

end

# get '/questions/:id/edit' do
#   question = Question.find(params[:id])
#
#   erb :'questions/edit'
# end

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
