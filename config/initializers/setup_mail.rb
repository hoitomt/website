ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "hoitomt.com",  
  :user_name            => "mike.hoitomt",  
  :password             => "ajlanger",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}