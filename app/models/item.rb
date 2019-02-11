class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images
  has_many :categories
  has_many :brands
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories
end
