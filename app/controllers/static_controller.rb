class StaticController < ApplicationController
  before_action :set_should_render_navbar

  def index
  end

  def membership
  end

  def licences_disclaimer
  end

  def contact
  end

  def about
  end

  def use_cases
  end

  def faq 
  end

  def mailing_list

    path = "./db/mailing_list.txt"
    File.open(path, "a") do |f|
      f.write(params[:email_address])
      f.write "\n"
    end
    render turbo_stream: turbo_stream.replace("mailing_list_form", partial: "static/mailing_list_form") 
  end

  private

  def set_should_render_navbar
    if user_signed_in?
      @should_render_navbar = true
    end
  end
end
