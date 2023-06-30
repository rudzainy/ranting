class ApplicationController < ActionController::Base
  before_action :set_should_render_navbar
  before_action :set_hacker_variable

  def set_should_render_navbar
    @should_render_navbar = false
  end

  def set_hacker_variable
    if user_signed_in? && current_user.username == "rudzainy"
        @hacker_variable = User.count
    else
        @hacker_variable = false
    end
  end
end
