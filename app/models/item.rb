class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments
  has_many :images
  has_many :categories
  has_many :brands
end
