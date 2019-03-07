FactoryGirl.define do
  factory :address do
    id                "1"
    postcode          "1066118"
    prefectures       "東京都"
    municipality      "港区"
    street_number     "六本木6-10-1"
    building_name     "六本木ヒルズ森タワー"
    room_number       "18F"
    remarks           "ついたら電話"
    user_id           "1"

    trait :invalid do
      postcode nil
    end
  end
end
