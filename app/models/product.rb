class Product < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category_id
end
