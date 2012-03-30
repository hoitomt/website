class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :photo, 
                    :styles => { :medium => "300x300>", :large => "600x600>" },
                    :convert_options => { :all => '-auto-orient' },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    :path => "/:id/:style/:filename"
  validates_presence_of :category_id
end
