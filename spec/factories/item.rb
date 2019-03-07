FactoryGirl.define do
  factory :item do
    id              "1"
    name            "商品"
    price           "1000"
    item_condition  0
    area            0
    shipping_method 0
    size            0
    text            0
    seller_id       "1"
    buyer_id        "0"
    delivery_burden 0
    delivery_date   0
  end
end
