class ContactsController < ApplicationController
  :after_filter
  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @title = "Contact Me"
    @contact = Contact.new

    respond_to do |format|
      format.html {
        render :layout => 'layouts/pages'
      }# new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        Thread.new{ContactMailer.contact_form(@contact).deliver}
        format.html { redirect_to(main_path, :notice => "#{@contact.name}, thank you for your message.
                                              I will follow up with you to discuss your needs") }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new", :layout => 'layouts/pages' }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

end
