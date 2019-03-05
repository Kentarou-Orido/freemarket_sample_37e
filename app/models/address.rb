class Address < ApplicationRecord
  belongs_to :user
  validates :postcode, :prefectures, :municipality, :street_number, presence: true
end
