class Image < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :item, optional: true

  validates_presence_of :item
end
