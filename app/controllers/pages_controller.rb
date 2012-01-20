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
      if Rails.env.development?
        logger.info("Development")
      end
      @is_production = false
      @is_production = true if Rails.env.production?
      logger.info("Is Production: #{@is_production}")
    end
end
