FactoryGirl.define do
  factory :user do
<<<<<<< HEAD
    id                  "1"
    email               "merucari@gmail.com"
    password            "123456"
    encrypted_password  "123456"
    nickname            "aaaaa"
    family_name         "asaa"
    first_name          "aaa"
    family_name_kana    "aaaa"
    first_name_kana     "aaaa"
    telephone           "00000000000"
    birthday            "1992-11-23"
    icon                ""
    rate_good           "0"
    rate_normal         "0"
    rate_bad            "0"
=======
    id                    "1"
    email                 "merucari@gmail.com"
    password              "123456"
    password_confirmation "123456"
    nickname              "aaaaa"
    family_name           "asaa"
    first_name            "aaa"
    family_name_kana      "aaaa"
    first_name_kana       "aaaa"
    telephone             "00000000000"
    birthday              "1992-11-23"
    rate_good             "0"
    rate_normal           "0"
    rate_bad              "0"
>>>>>>> bcfb742ed0fd34295fdc1a87e0cfda0e109e4b37
  end
end
