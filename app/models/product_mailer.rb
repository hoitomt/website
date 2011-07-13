class ProductMailer < ActionMailer::Base
  
  def inquire(product, message )
    subject     'Question regarding ' + product.name
    content_type  "text/html"
    recipients  'mike.hoitomt@gmail.com'
    from        message.email
    reply_to    message.email
    sent_on     Time.now
    
    body       :greeting => 'Hi,',
               :product => product,
               :message => message
  end

end
