# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
if Category.count == 0
  Category.create!(:name => "Jewelry")
  Category.create!(:name => "Clothing")
  Category.create!(:name => "Other")
end