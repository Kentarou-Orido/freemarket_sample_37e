class Categoriegroup < ApplicationRecord
  belongs_to :item
  belongs_to :categorie
end
