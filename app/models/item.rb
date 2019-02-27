class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments
  has_many :images
  has_many :categories
  has_many :brands

  enum size:{ xxs: 153, xs: 154, s: 2, m: 3, l: 4, xl: 5, xxl: 155, xxxl: 156, xxxxl: 157, free: 7}
  enum item_condition:{ new: 1, unused: 2, no_stain: 3, little_stain: 4, scrached: 5, bad: 6}
  enum delivery_burden:{ include: 2, arrival: 1}
  enum shipping_method:{ other: 5, merukari: 14, yumail: 6, letterpack: 8, normal: 9, kuroneko: 10, yupack: 11, clickpost: 13, yupaket: 7}
  enum area:{ hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7, ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14, nigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20, gifu: 21, shizuoka: 22, aichi: 23, mie: 24, shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30, tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35, tokushima: 36, kagawa: 37, ehime: 38, kochi: 39, fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47, other: 99}
  enum delivery_date:{ a_day: 1, two_day: 2, four_day: 3}
end
