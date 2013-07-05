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
  id = params[id]
  
  = Responses.where_user_id(id)

  @taken_surveys 

  @surveys = User.surveys
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


