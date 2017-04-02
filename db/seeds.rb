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

# Question
fileQ = File.open('db/questions.txt')
fileQ.each_line do |line|
  user_id = Faker::Number.between(1, User.count)
  title = line
  content = Faker::Lorem.paragraphs.join
  q= Question.new(
      user_id: user_id,
      title: title,
      content: content
  )

fileT = File.open('db/tag.txt')
tagsArray = []
fileT.each_line do |line|
  tagsArray.push(line)
end
fileT.close

  tag_num = Faker::Number.between(1, 5)
  t_array = tagsArray.to_a.shuffle[0...tag_num]
  q.tag_list = t_array.join(',')
  q.save
end

fileQ.close

# Favorite(1人のUserあたり最大15件のお気に入り)
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
  # 質問に対する貢献度(1人Userあたり最大8件)
  q_contribute_num = Faker::Number.between(0, 8)
  q_idx_array = (1..Question.count).to_a.shuffle[0...q_contribute_num]
  for q_idx in q_idx_array do
     Contribute.create!(
       user_id: n + 1,
       point_q: q_idx
     )
  end
  # 回答に対する貢献度(1人Userあたり最大8件)
  a_contribute_num = Faker::Number.between(0, 8)
  a_idx_array = (1..Answer.count).to_a.shuffle[0...a_contribute_num]
  for a_idx in a_idx_array do
     Contribute.create!(
       user_id: n + 1,
       point_a: a_idx
     )
  end
end
