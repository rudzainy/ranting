class StaticController < ApplicationController
  before_action :set_should_render_navbar

  def pricing
  end

  def licences_disclaimer
  end

  def contact
  end

  def about
  end

  private

  def set_should_render_navbar
    if user_signed_in? 
      @should_render_navbar = true
    end
  end
end
