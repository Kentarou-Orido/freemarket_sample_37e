require "csv"

CSV.foreach('db/category.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Category.create(:name => row[0], :ancestry => row[1])
end


100.times do |n|
  email = Faker::Internet.email
  password = "password"
  nickname = Faker::Pokemon.name
  family_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  family_name_kana = Faker::Name.last_name
  first_name_kana = Faker::Name.first_name
  telephone = Faker::PhoneNumber.cell_phone
  birthday = Faker::Date.birthday(18, 65)
  User.create!(email: email, password: password, password_confirmation: password,nickname: nickname, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, telephone: telephone, birthday: birthday)
end
