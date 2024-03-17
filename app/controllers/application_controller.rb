class ApplicationController < ActionController::Base

  helper_method :turbo_frame_request?, :turbo_frame_request_id

  before_action :set_should_render_navbar
  before_action :set_should_render_navbar_public
  before_action :set_hacker_variables
  before_action :turbo_frame_request_variant

  private

  def set_user
    @user = User.friendly.find(params[:id]) || User.find(params[:id])

  rescue StandardError
    @user = nil
  end

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

  def set_hacker_variables
    if user_signed_in? && current_user.username == "rudzainy"
      @hacker_variables = []
      @hacker_variables[0] = User.count
      @hacker_variables[1] = Link.count
    else
      @hacker_variables = false
    end
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
