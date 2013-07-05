users = []
10.times do
  users << User.create!(:username => Faker::Internet.user_name, :password => "password")
end

surveys = []
users.each do |user|
  (rand(1..5)).times do
    surveys << user.surveys.create!(:name => Faker::Lorem.word)
  end
end

questions = []
surveys.each do |survey|
  (rand(1..20)).times do
    questions << survey.questions.create!(:body => Faker::Lorem.sentence(20))
  end
end

questions.each do |question|
  (rand(2..6)).times do
    question.choices.create!(:body => Faker::Lorem.words(3))
  end
end

users.each do |user|
  user.surveys.each do |survey|
    survey.questions.each do |question|
      possible_answer = question.choices.sample.body
      question.responses.create!(:body => possible_answer, :user_id => user.id)
    end
  end
end
