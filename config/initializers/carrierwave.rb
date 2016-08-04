require 'carrierwave/orm/activerecord'

if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
elsif Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end