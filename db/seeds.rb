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

50.times do
  Item.create!(
    name: Faker::Dessert.variety,
    price: Faker::Number.number(6),
    item_condition: Faker::Number.between(0, 2),
    area: Faker::Number.between(0, 46),
    shipping_method: Faker::Number.between(0, 8),
    text: "sample",
    size: Faker::Number.between(0, 9),
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    delivery_date: Faker::Number.between(0, 2),
    delivery_burden: Faker::Number.between(0, 1),
    brand_id: Faker::Number.between(0, 3)
  )

  CategoriesGroup.create!(
    item_id: Faker::Number.between(0, 49),
    category_id: Faker::Number.between(0, 3)
  )

end

Category.create!(name: "レディース", item_id: 1)
Category.create!(name: "メンズ", item_id: 2)
Category.create!(name: "ベビー・キッズ", item_id: 3)
Category.create!(name: "コスメ・香水・美容", item_id: 4)

Brand.create!(name: "シャネル", item_id: 1)
Brand.create!(name: "ルイヴィトン", item_id: 2)
Brand.create!(name: "シュプリーム", item_id: 3)
Brand.create!(name: "ナイキ", item_id: 4)
