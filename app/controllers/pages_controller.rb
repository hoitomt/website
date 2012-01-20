class PagesController < ApplicationController

  def about
    @title = "About Me"
  end

  def projects
    @title = "Projects"
  end

  def resume
    @title = "Resume"
    respond_to do |format|
      format.html
      format.pdf { doc_raptor_send }
    end
  end
  
  def doc_raptor_send(options = { })
    logger.info("Doc Raptor")
    default_options = { 
      :name             => controller_name,
      :document_type    => request.format.to_sym,
      :test             => ! Rails.env.production?,
    }
    options = default_options.merge(options)
    options[:document_content] ||= render_to_string
    ext = options[:document_type].to_sym
    
    response = DocRaptor.create(options)
    if response.code == 200
      logger.info("response is ok")
      send_data response, :filename => "#{options[:name]}.#{ext}", :type => ext
    else
      logger.info("response is not ok")
      render :inline => response.body, :status => response.code
    end
  end

end
