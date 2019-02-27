class Category < ApplicationRecord
  has_ancestry
  belongs_to :item

  # enum category1:{ ladies: 1, mens: 2, baby: 3, interia: 4, book: 5, toy: 1328, cosmetic: 6, camera: 7, sports: 8, handmade: 9, tickets: 1027, cars: 1318, other: 10}
  # enum category2:{ tops: 11, jacket_outer: 12, pants: 13, skirt: 14, onepiece: 15, shoes: 16, roomwear: 17, legwear: 18, hat: 19, bag: 20, accessory: 21, hair_accessory: 22, small_article: 23, watch: 24, wig: 25, yukata_kimono: 26, suits_formal: 27, maternity: 28, other: 29, }
  # enum category3:{ short_tshirt: 119, middle_tshirt: 120, short_blouse: 121, middle_blouse: 122, polo_shirt: 123, camisole: 124, tank_top: 125, halter_neck: 126, sweater: 127, tunic: 128, cardigan: 129, ensemble: 130, best: 131, parker: 132, trainer: 133, pair_top: 134, jersey: 135, tops_other: 136,}
end
