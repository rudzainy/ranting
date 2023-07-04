class ApplicationController < ActionController::Base

  helper_method :turbo_frame_request?, :turbo_frame_request_id

  before_action :set_should_render_navbar
  before_action :set_should_render_navbar_public
  before_action :set_hacker_variable
  before_action :turbo_frame_request_variant

  private 

  def set_should_render_navbar
    @should_render_navbar = false
  end

  def set_should_render_navbar_public
    if !user_signed_in? 
      if params[:controller] == "links"
        @should_render_navbar_public = false
      else
        @should_render_navbar_public = true
      end
    end
  end

  def set_hacker_variable
    if user_signed_in? && current_user.username == "rudzainy"
        @hacker_variable = User.count
    else
        @hacker_variable = false
    end
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
