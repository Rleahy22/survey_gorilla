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

  @taken_surveys = Response.find_all_by_user_id(params[:id]).map { |response| response.question.survey }.uniq

  erb :user
end

get '/survey' do
  #lists all surveys
  @surveys = Survey.all
  erb :list_surveys
end

get '/survey/new' do
  erb :new_survey
end

post '/survey/create' do
  raise params[:question].to_json
end

get '/survey/:id' do
  #displays individual survey with questions
  @survey = Survey.find(params[:id])
  @questions = @survey.questions.all
  erb :survey
end

get '/survey/:id/take' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :take_survey
end

post '/user' do
  @user = User.find_or_create_by_username(params[:user][:username])
  session[:id] = @user.id
  redirect "/user/#{@user.id}"
end

post '/survey/:id/complete' do

  params[:responses].each do |question_id, choice_id|
    choice = Choice.find(choice_id)
    choice.count += 1
    choice.save
    current_user.responses.create(:body => Choice.find(choice_id).body, :question_id => question_id)
  end
  redirect '/'
end

get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions.all
  erb :results
end

