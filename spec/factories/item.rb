FactoryGirl.define do
  factory :item do
    id              1
    name            "商品"
<<<<<<< HEAD
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
=======
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
>>>>>>> bcfb742ed0fd34295fdc1a87e0cfda0e109e4b37
  end
end
