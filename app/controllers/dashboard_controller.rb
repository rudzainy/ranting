class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @should_render_navbar = true
    @links = @user.links.order(position: :asc)
  end

  def design
    @should_render_navbar = true
  end

  private

  def set_user
    @user = current_user
  
  rescue StandardError
    @user = nil
  end
end
