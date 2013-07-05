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
  @user = User.find(params[:id])
  @surveys = @user.surveys

  @taken_surveys = Response.find_all_by_user_id(params[:id]).map {|response| response.question.survey }.uniq

  erb :user
end

get '/survey' do
  #lists all surveys
  @surveys = Survey.all
  erb :list_surveys
end

get '/survey/:id' do
  #displays individual survey with questions
  @survey = Survey.find(params[:id])
  @questions = @survey.questions.all
  erb :survey
end

get '/survey/:id/take' do
  
  erb :take_survey
end


