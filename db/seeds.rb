# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(
      email: email,
      name: name,
      password: password,
      password_confirmation: password,
      uid: n
  )
end

# Tag
fileT = File.open('db/tag.txt')
fileT.each_line do |line|
  Tag.create!(
    name: line
  )
end
fileT.close

# Question
fileQ = File.open('db/questions.txt')
fileQ.each_line do |line|
  user_id = Faker::Number.between(1, User.count)
  title = line
  content = Faker::Lorem.paragraphs.join
  Question.create!(
      user_id: user_id,
      title: title,
      content: content
  )
end
fileQ.close

# QuestionTag (1つのQuestionにつき最大5個)
(Question.count).times do |n|
  tag_num = Faker::Number.between(1, 5)
  # 1つのQuestionに対し同一のタグが紐づかないようにする
  tag_idx_array = (1..Tag.count).to_a.shuffle[0...tag_num]
  for tag_idx in tag_idx_array do
    QuestionTag.create!(
      question_id: n + 1,
      tag_id: tag_idx
    )
  end
end

# Favorite(1人のUserで最大15個のお気に入り)
(User.count).times do |n|
  favorite_num = Faker::Number.between(0, 15)
  # 1つのUserに対し同一のQuestionが紐づかないようにする
  q_idx_array = (1..Question.count).to_a.shuffle[0...favorite_num]
  for q_idx in q_idx_array do
     Favorite.create!(
       user_id: n + 1,
       question_id: q_idx
     )
  end
end
