require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    AWS_ACCESS_KEY_ID: Rails.application.secrets.AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY: Rails.application.secrets.AWS_SECRET_ACCESS_KEY,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'uploadfreemarketsample37e'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/uploadfreemarketsample37e'
end
