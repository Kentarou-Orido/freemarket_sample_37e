FactoryGirl.define do
  factory :item do
    id              1
    name            "商品"
    price           1000
    item_condition  1
    area            1
    shipping_method 14
    size            2
    text            "1"
    user_id         1
    trade_status    1
    seller_id       1
    buyer_id        'NULL'
    delivery_date   1
    delivery_burden 1
    brand_id        1
  end
end
