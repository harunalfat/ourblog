class AboutController < ApplicationController
  def index
    render locals: { about_content: about_content }
  end

  private

  def about_content
    @about_content ||= StaticContents.find_by(type: 'about')
  end
end
