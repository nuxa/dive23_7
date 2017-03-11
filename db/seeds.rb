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

# タグ
tags = ["ruby", "java", "php", "python", "ruby-on-rails", "postgresql",
        "mysql", "sql", "git", "github", "gem", "html", "javascript",
        "jquery", "ajax", "css", "bootstrap", "json", "http"]
for tag in tags do
  Tag.create!(
    name: tag
  )
end

100.times do |n|
  user_id = Faker::Number.between(1, 50)
  title_length = Faker::Number.between(10, 50)
  title = Faker::Lorem.characters(title_length)
  content = Faker::Lorem.paragraphs.join
  Question.create!(
      user_id: user_id,
      title: title,
      content: content
  )
  # Questionに紐づくタグを登録(1つのQuestionにつき最大5個)
  tag_num = Faker::Number.between(1, 5)
  # 1つのQuestionに対し同一のタグが紐づかないようにする
  tag_idx_array = (0...tags.length).to_a.shuffle[0...tag_num]
  for tag_idx in tag_idx_array do
    QuestionTag.create!(
      question_id: n+1,
      tag_id: tag_idx+1
    )
  end
end

200.times do |n|
  user_id = Faker::Number.between(1, 50)
  question_id = Faker::Number.between(1, 100)
  Favorite.create!(
      user_id: user_id,
      question_id: question_id
  )
end
