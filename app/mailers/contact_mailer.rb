class ContactMailer < ActionMailer::Base
  
  def contact_form(contact)
    @contact = contact
    mail(:to => 'mike.hoitomt@gmail.com',
         :from => contact.email,
         :subject => 'You have a new contact from Hoitomt.com')
  end
  
end
