class PagesController < ApplicationController
  before_filter :is_production?

  def about
    @title = "About Me"
  end

  def projects
    @title = "Projects"
  end

  def resume
    @title = "Resume"
  end
  
  def about_pdf
    send_pdf_file("about")
  end
  
  def resume_pdf
    send_pdf_file("resume")
  end
  
  def send_pdf_file(file_name)
    send_file("#{Rails.root}/public/documents/#{file_name}.pdf", 
              :disposition => 'inline', 
              :type => 'application/pdf')
  end
  
  private
    def is_production?
      @is_production = false
      @is_production = true if Rails.env.production?
    end
end
