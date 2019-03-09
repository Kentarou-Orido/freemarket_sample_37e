FactoryGirl.define do
  factory :user do
    email  Faker::Internet.email
    password              Faker::Internet.password(8)
    password_confirmation { password }
    nickname  Faker::Pokemon.name
    family_name  Faker::Name.last_name
    first_name  Faker::Name.first_name
    family_name_kana  Faker::Name.last_name
    first_name_kana  Faker::Name.first_name
    telephone  Faker::PhoneNumber.cell_phone
    birthday  Faker::Date.birthday(18, 65)
    rate_good             "0"
    rate_normal           "0"
    rate_bad              "0"

  end
end
