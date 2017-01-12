get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  question = Question.create( title: params[:title],
                      question: params[:question] )
  if question.save
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
