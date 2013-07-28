CarrierWave.configure do |config|
  if Rails.env.production?  
    config.storage = :fog
    config.cache_dir = "uploads"
    config.root = Rails.root.join('tmp')
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      =>  ENV['S3_ID'],
      :aws_secret_access_key  =>  ENV['S3_KEY'],
      :region                 => 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    # config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
    # config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage = :file
    config.cache_dir = "uploads"
  end
end