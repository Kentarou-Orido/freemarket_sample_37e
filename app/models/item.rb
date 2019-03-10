class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand
  has_many :comments
  has_many :images
  has_many :categories_groups
  has_many :categories, through: :categories_groups

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :brand

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :item_condition, presence: true
  validates :area, presence: true
  validates :shipping_method, presence: true
  validates :delivery_burden, presence: true
  validates :delivery_date, presence: true

  enum size: %i[xxs xs s m l xl xxl xxxl xxxxl free]
  enum item_condition: %i[news unused no_stain little_stain scrached bad]
  enum delivery_burden: %i[include arrival]
  enum shipping_method: %i[other merukari yumail letterpack normal kuroneko yupack clickpost yupaket]
  enum area: %i[hokkaido aomori iwate miyagi akita yamagata fukushima ibaraki tochigi gunma saitama chiba tokyo kanagawa nigata toyama ishikawa fukui yamanashi nagano gifu shizuoka aichi mie shiga kyoto osaka hyogo nara wakayama tottori shimane okayama hiroshima yamaguchi tokushima kagawa ehime kochi fukuoka saga nagasaki kumamoto oita miyazaki kagoshima okinawa undecided]
  enum delivery_date: %i[a_day two_day four_day]
end
