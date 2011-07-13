class Product < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :medium => "300x300>" },
     :storage => :s3,
     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
     :path => "/:id/:filename"
end
