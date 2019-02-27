# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|nickname|string|null:false|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|encrypted_password|string|null:false, unique: true|
|telephone|string|null:false, unique: true|
|birthday|data|null:false, unique: true|
|icon|string|unique: true|
|email|string|null:false|
|rate_good|integer|default: “0”|
|rate_normal|integer|default: “0”|
|rate_bad|integer|default: “0”|

## Association
- has_many:items
- has_many:addresses
- has_many:buyed_items,foreign_key:'buyer_id', class_name:'Item'
- has_many:saling_items, -> {'where('buyer_id NULL')'}, foreign_key:'saler_id', class_name:'Item'
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|name|string|null:false|
|price|integer|null:false|
|buyer_id|references|null:false, foreign_key: true|
|seller_id|references|null:false, foreign_key: true|
|item_condition|integer|null:false|
|area|sting|null:false|
|shipping_method|integer|null:false|
|delivery_date|string|null:false|
|delivery_burden|string|null:false|
|size|string||
|text|text|null:false|
|seller_id|references|foreign_key|
|buyer_id|references|foreign_key|
|brand_id|references|null:false, foreign_key: true|
|category_id|references|null:false, foreign_key: true|

## Association
- belongs_to:user
- belongs_tp:seller,class_name:'User'
- belongs_tp:buyer,class_name:'User'
- has_many:comments
- has_many:images
- has_many:categories, through:categoriegroups
- has_many:brands

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|user_id|references|null:false, foreign_key: true|
|name|string|null:false|
|card_number|integer|null:false|
|expiration_date|date|null:false|
|security_code|integer|null:false|

## Association
 - belongs_to:user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null:false|
|prefectures|string|null:false|
|municipality|string|null:false|
|street_number|string|null:false|
|building_name|string||
|room_number|integer||
|remarks|text||
|user_id|references|null:false, foreign_key: true|

## Association
- belongs_to:user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|name|string|null:false|
|ancestry|integer||

## Association
- has_many :item, through:categoriegroups

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|
|text|text|null:false|

## Association
- belongs_to:item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|item_id|references|null:false, foreign_key: true|
|image_url|string|null:false|

## Association
- belongs_to:item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|item_id|references|null:false, foreign_key: true|
|name|string||

## Association
- belongs_to:item

## categories_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|categorie_id|references|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :categorie

## マイグレートに際して、カラム関係の変更点(by 織戸)

### itemsテーブルに関して
buyer_idカラムとbrandカラムを削除

### addressesテーブルに関して
room_numberカラムとremarksカラムとuser_idカラムの追加

### usersテーブルに関して
telephoneカラムにnull: falseオプションとユニークオプション追加
