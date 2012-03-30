APP_CONFIG = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]

ENV['S3_UPLOADER_BUCKET'] = APP_CONFIG['bucket']
ENV['S3_UPLOADER_ACCESS_KEY'] = APP_CONFIG['access_key_id']
ENV['S3_UPLOADER_SECRET_ACCESS_KEY'] = APP_CONFIG['secret_access_key']