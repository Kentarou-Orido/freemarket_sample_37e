# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# -*- coding: utf-8 -*-

# User.create!(
#   email: Faker::Internet.email,
#   nickname: Faker::Name.name,
#   family_name: Gimei.last.kanji,
#   first_name: Gimei.first.kanji,
#   family_name_kana: Gimei.last.katakana,
#   first_name_kana: Gimei.first.katakana,
#   birthday: Faker::Date.birthday(18, 65),
#   password: Faker::Number.number(6)
# )

# 50.times do
#   Item.create!(
#     name: Faker::Dessert.variety,
#     price: Faker::Number.number(6),
#     item_condition: Faker::Number.between(1, 3),
#     area: Faker::Number.between(1, 47),
#     shipping_method: 5,
#     text: "sample",
#     created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
#     updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
#     seller_id: 1,
#     delivery_date: Faker::Number.between(1, 3),
#     delivery_burden: Faker::Number.between(1, 2),
#     brand_id: Faker::Number.between(1, 4)
#   )
# end

50.times do
  CategoriesGroup.create!(
    item_id: Faker::Number.between(1, 50),
    category_id: Faker::Number.between(1, 4)
  )
end

# Category.create!(name: "レディース", item_id: 1)
# Category.create!(name: "メンズ", item_id: 2)
# Category.create!(name: "ベビー・キッズ", item_id: 3)
# Category.create!(name: "コスメ・香水・美容", item_id: 4)

# Brand.create!(name: "シャネル", item_id: 1)
# Brand.create!(name: "ルイヴィトン", item_id: 2)
# Brand.create!(name: "シュプリーム", item_id: 3)
# Brand.create!(name: "ナイキ", item_id: 4)

# require "csv"

# CSV.foreach('db/category.csv', encoding: 'Shift_JIS:UTF-8') do |row|
#   Category.create(:name => row[0], :ancestry => row[1])
# end

# 100.times do |n|
#   email = Faker::Internet.email
#   password = "password"
#   nickname = Faker::Pokemon.name
#   family_name = Faker::Name.last_name
#   first_name = Faker::Name.first_name
#   family_name_kana = Faker::Name.last_name
#   first_name_kana = Faker::Name.first_name
#   telephone = Faker::PhoneNumber.cell_phone
#   birthday = Faker::Date.birthday(18, 65)
#   User.create!(email: email, password: password, password_confirmation: password,nickname: nickname, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, telephone: telephone, birthday: birthday)
# end
