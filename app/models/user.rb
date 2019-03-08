class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :addresses
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> {where("buyer_id is not NULL")},foreign_key: "seller_id", class_name: "Item"
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :telephone, presence: true
  validates :telephone, uniqueness: true
  validates :password, :password_confirmation, length: { minimum: 6 }
end
