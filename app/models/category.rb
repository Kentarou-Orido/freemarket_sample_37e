class Category < ApplicationRecord
  has_ancestry
  has_many :items, through: :categoriegroups
  has_many :categoriegroups
end
