FactoryGirl.define do
  factory :item do
    name            Faker::Dessert.variety
    price           Faker::Number.number(6)
    item_condition  Faker::Number.between(0, 2)
    area            Faker::Number.between(0, 46)
    shipping_method Faker::Number.between(0, 8)
    size            Faker::Number.between(0, 9)
    text            "aaaaa"
    buyer_id        'nil'
    created_at  Faker::Time.between(DateTime.now - 1, DateTime.now)
    updated_at  Faker::Time.between(DateTime.now - 1, DateTime.now)
    delivery_date  Faker::Number.between(0, 2)
    delivery_burden  Faker::Number.between(0, 1)
    brand
    after(:create) do |item|
        create_list(:category, 3, items: [item])
    end
  end
end
