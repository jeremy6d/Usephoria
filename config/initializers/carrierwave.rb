CarrierWave.configure do |config|
  config.storage = :file
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"
end