# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# メインのサンプルユーザーを1人作成する
User.create!(name: "管理者",
             email: "admin@example.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             guest: false,
             activated_at: Time.zone.now)
User.create!(name: "ゲスト",
             email: "guest@example.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             guest: true,
             activated_at: Time.zone.now)
# 追加のユーザーをまとめて生成する
3.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               guest: false,
               activated_at: Time.zone.now)
end
# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(word_count: 8)
  title = Faker::Lorem.sentence(word_count: 3)
  users.each { |user| user.microposts.create!(title: title, content: content) }
end
