class Product < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "300x300>" }
end
