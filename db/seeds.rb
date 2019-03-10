require "csv"


CSV.foreach('db/category.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Category.create(:name => row[0], :ancestry => row[1])
end

50.times do
  User.create!(
    email: Faker::Internet.free_email,
    nickname: Faker::Name.name,
    family_name: Gimei.last.kanji,
    first_name: Gimei.first.kanji,
    family_name_kana: Gimei.last.katakana,
    first_name_kana: Gimei.first.katakana,
    birthday: Faker::Date.birthday(18, 65),
    password: 123456,
    password_confirmation:123456,
    telephone: Faker::PhoneNumber.unique.phone_number
  )
end

50.times do
  address = Gimei.address
  Address.create!(
    postcode: 1112222,
    prefectures: address.prefecture.kanji,
    municipality: address.city.kanji,
    street_number: "10-20-30",
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    user_id:Faker::Number.unique.between(1, 50),
  )
end
Faker::UniqueGenerator.clear

Brand.create!(name: "シャネル")
Brand.create!(name: "ルイヴィトン")
Brand.create!(name: "シュプリーム")
Brand.create!(name: "ナイキ")

50.times do
  Item.create!(
    name: Faker::Dessert.variety,
    price: Faker::Number.between(100, 10000),
    item_condition: Faker::Number.between(0, 5),
    area: Faker::Number.between(0, 46),
    shipping_method: Faker::Number.between(0, 8),
    text: "sample",
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    seller_id: Faker::Number.unique.between(1, 50),
    delivery_date: Faker::Number.between(0, 2),
    delivery_burden: Faker::Number.between(0, 1),
    brand_id: Faker::Number.between(1, 4),
    size: Faker::Number.between(0, 9)
  )
end
Faker::UniqueGenerator.clear

50.times do
  CategoriesGroup.create!(
    item_id: Faker::Number.unique.between(1, 50),
    category_id: Faker::Number.between(1, 4)
  )
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
