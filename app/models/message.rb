class Message < ActiveRecord::Base

  validates_presence_of :name, :email, :message
  validates_format_of :email, :if => "!email.empty?", :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Please provide a valid email address"
 
  
end