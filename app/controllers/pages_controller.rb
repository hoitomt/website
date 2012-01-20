class PagesController < ApplicationController

  def about
    @title = "About Me"
  end

  def projects
    @title = "Projects"
  end

  def resume
    @title = "Resume"
  end

end
