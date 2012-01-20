class PagesController < ApplicationController

  def about
    @title = "About Me"
    send_pdf_file(about.pdf) if Rails.env.production?
  end

  def projects
    @title = "Projects"
  end

  def resume
    @title = "Resume"
    send_pdf_file(resume.pdf) if Rails.env.production?
  end
  
  def send_pdf_file(file_name)
    send_file("#{Rails.root}/public/documents/#{file_name}", 
              :disposition => 'inline', 
              :type => 'application/pdf')
  end
end
