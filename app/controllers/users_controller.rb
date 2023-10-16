class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :index]

  def edit
    @should_render_navbar = true

    @links = @user.links.where.not(url: 'https://', title: '').order(position: :asc)
  end

  def show
    redirect_to links_path if @user.nil?

    @links = @user.links.where.not(url: 'https://', title: '').order(position: :asc)
  end
end
