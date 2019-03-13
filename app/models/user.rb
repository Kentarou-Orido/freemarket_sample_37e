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
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id,
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          family_name: auth.info.last_name,
          first_name: auth.info.first_name,
          password: "1234567",
          password_confirmation: "1234567"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
