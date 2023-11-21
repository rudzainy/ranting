class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :index]

  def edit
    @should_render_navbar = true

    @links = @user.links.where.not(url: 'https://', title: '').order(position: :asc)
  end

  def show
    redirect_to links_path if @user.nil?

    impressionist(@user)
    @links = @user.links.where.not(url: 'https://', title: '').order(position: :asc)
    set_background_color
  end

  private

  def set_background_color
    @inject_background_color = "background-color: " + @user.background_color
  end
end
