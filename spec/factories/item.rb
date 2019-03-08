FactoryGirl.define do
  factory :item do
    id              1
    name            "商品"
    price           1000
    item_condition  1
    area            1
    shipping_method 2
    size            2
    text            "aaaaa"
    buyer_id        'NULL'
    delivery_date   1
    delivery_burden 1
  end
end
