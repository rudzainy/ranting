class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @should_render_navbar = true
    @links = current_user.links.order(position: :asc)
  end

  def design
    @should_render_navbar = true
  end
end
