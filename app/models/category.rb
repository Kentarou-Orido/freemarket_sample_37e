class Category < ApplicationRecord
  has_ancestry
  has_many :items, through: :categories_groups
  has_many :categories_groups
end
