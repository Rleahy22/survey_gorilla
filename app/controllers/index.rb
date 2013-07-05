get '/' do
  #landing page, can login or signup here
  erb :index
end

get '/login' do
  #gives user the option to login or signup
  erb :login
end

get '/user/:id' do
  #lists surveys user has created
  #gives option to create new survey
  #lists surveys user has taken

  @surveys = User.surveys

  @taken_surveys = Responses.where_user_id(params[:id]).map {|response| response.question.survey }.uniq

  erb :user
end

get '/survey' do
  #lists all surveys
  @surveys = Survey.all
  erb :list_surveys
end

get '/survey/:id' do
  #displays individual survey with questions
  @survey = Survey.find(params[id])
  @questions = @survey.questions.all
  erb :survey
end

get '/survey/:id/take' do
  
  erb :take_survey
end


post '/user' do
  @user = User.find_or_create_by_username(params[:user][:username])
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect '/user/<% @user.id %>'
  else
    redirect_to '/'
  end

end
