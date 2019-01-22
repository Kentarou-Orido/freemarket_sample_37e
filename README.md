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
|password|string|null:false, unique: true|
|telephone|string||
|birthday|data|null:false, unique: true|
|icon|string|unique: true|

## Association
- has_many:items
- has_many:addresses

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|name|string|null:false|
|price|integer|null:false|
|user_id|references|null:false, foreign_key: true|
|buyer_id|references|null:false, foreign_key: true|
|brand|sting||
|status|integer|null:false|
|condition|integer|null:false|
|postage|string|null:false|
|area|sting|null:false|
|shipping_method|integer|null:false|
|size|string||
|text|text|null:false|

## Association
- belongs_to:user
- has_many:comments
- has_many:images
- has_many:categories
- has_many:brands

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|user_id|references|null:false, foreign_key: true|
|name|string|null:false|
|card_number|integer|null:false|
|expiration_data|data|null:false|
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

## Association
- belongs_to:user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|name|string|null:false|
|ancestry|integer||

## Association
- belongs_to:item

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
