class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments
  has_many :images
  has_many :categories_groups
  has_many :categories, through: :categories_groups
  has_many :brands
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories

  enum size: %i[xxs xs s m l xl xxl xxxl xxxxl free]
  # enum size:{ xxs: 153, xs: 154, s: 2, m: 3, l: 4, xl: 5, xxl: 155, xxxl: 156, xxxxl: 157, free: 7}
  enum item_condition: %i[news unused no_stain little_stain scrached bad]
  enum delivery_burden: %i[include arrival]
  enum shipping_method: %i[other merukari yumail letterpack normal kuroneko yupack clickpost yupaket]
  enum area: %i[hokkaido aomori iwate miyagi akita yamagata fukushima ibaraki tochigi gunma saitama chiba tokyo kanagawa nigata toyama ishikawa fukui yamanashi nagano gifu shizuoka aichi mie shiga kyoto osaka hyogo nara wakayama tottori shimane okayama hiroshima yamaguchi tokushima kagawa ehime kochi fukuoka saga nagasaki kumamoto oita miyazaki kagoshima okinawa undecided]
  enum delivery_date: %i[a_day two_day four_day]
end
