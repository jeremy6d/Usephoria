CarrierWave.configure do |config|
  config.storage = :file
  config.cache_dir = "uploads"
end