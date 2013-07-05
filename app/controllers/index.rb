get '/' do
  #landing page, can login or signup here
  erb :index
end

get '/login' do
  #gives user the option to login or signup
  
end

get '/user/:id' do
  #lists surveys user has created
  #gives option to create new survey
  #lists surveys user has taken
  @surveys = User.surveys
end

get '/survey' do
  #lists all surveys
  
end

get '/survey/:id' do
  #displays individual survey with questions

end

