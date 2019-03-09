# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    item_id         item
    image_url       File.open("#{Rails.root}/public/images/no_image.jpg")
  end
end
