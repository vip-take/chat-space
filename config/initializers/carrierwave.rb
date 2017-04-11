require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID_CHAT'],
      aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY_CHAT'],
      region:                 Settings.s3.bucket_region
    }
    case Rails.env
      when 'production', 'development'
        config.fog_directory  = Settings.s3.bucket_name
        config.fog_public     = false                                        # optional, defaults to true
        config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
    end
  end
end
