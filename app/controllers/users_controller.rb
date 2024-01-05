class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :index]

  def edit
    @should_render_navbar = true

    links = @user.links.where.not(url: 'https://').order(position: :asc)
    @free_links = links.where(category: "free")
    @social_links = links.where(category: "social")
    unless @free_links.empty?
      @group_name = @free_links.first.group.name 
    else
      @group_name = ""
    end
  end

  def show
    redirect_to links_path if @user.nil?

    @should_render_navbar_public = false
    impressionist(@user)
    links = @user.links.where.not(url: 'https://').order(position: :asc)
    @free_links = links.where(category: "free")
    @social_links = links.where(category: "social")
    unless @free_links.empty?
      @group_name = @free_links.first.group.name 
    else
      @group_name = ""
    end
    set_background_color
  end

  private

  def set_background_color
    @inject_background_color = "background-color: " + @user.background_color
  end
end
