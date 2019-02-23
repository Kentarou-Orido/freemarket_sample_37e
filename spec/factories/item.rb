FactoryGirl.define do
  factory :item do
    id              "1"
    name            "商品"
    price           "1000"
    user_id         "1"
    trade_status    "1"
    item_condition  "1"
    postage         "1"
    area            "1"
    shipping_method "1"
    size            "1"
    text            "1"
    seller_id       "1"
    buyer_id        "0"
  end
end
