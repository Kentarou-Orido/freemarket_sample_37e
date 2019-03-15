crumb :root do
  link "メルカリ", root_path
end

crumb :item do |item|
  link item.name, item_path
end

crumb :user do
  link "マイページ",user_path(current_user.id)
end

crumb :logouts do
  link "ログアウト", logout_path(current_user.id)
end

crumb :on_display do
  link "出品した商品 - 出品中",user_listing_index_path(current_user.id)
  parent :user
end

crumb :change_purchase do
  link "支払い方法"
  parent :user
end

crumb :identification do
  link "本人情報の登録"
  parent :user
end

crumb :profile do
  link "プロフィール"
  parent :user
end

crumb :edit do
  link "出品商品画面"
  parent :on_display
end
