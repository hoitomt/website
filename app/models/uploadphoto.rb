class Uploadphoto < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :medium => "300x300>" },
                    :convert_options => { :all => '-auto-orient' },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    :path => "upload_photo/:id/:filename"
end
