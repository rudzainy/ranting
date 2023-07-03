class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :link_params, only: [:update]
  before_action :set_user, only: [:show]

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links.where.not(url: '', title: '')
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  
  rescue StandardError
    @user = nil
  end
end
