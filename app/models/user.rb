class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :items
  has_many :addresses
  has_many :sns_credential
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> {where("buyer_id is not NULL")},foreign_key: "seller_id", class_name: "Item"
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :telephone, presence: true
  validates :telephone, uniqueness: true
  validates :password, :password_confirmation, length: { minimum: 6 }

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    unless snscredential
      user = where(email: auth.info.email).first_or_create do |user|
            user.nickname = auth.info.name
            user.email = auth.info.email
            user.family_name = auth.info.last_name
            user.first_name = auth.info.first_name
            user.password = 123456
            user.password_confirmation = 123456
          end
      user = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id,
          )
      return user
    else
      return snscredential
    end
  end
end
