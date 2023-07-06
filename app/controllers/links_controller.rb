class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :link_params, only: [:update]
  before_action :set_user, only: [:show, :edit]
  before_action :set_link, only: [:update, :edit]

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links.where.not(url: 'https://', title: '').order(position: :asc)
  end

  def edit; end

  def update
    

    respond_to do |format|
      if @link.update(link_params)
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('links', partial: 'links/form', locals: {link: @link}) }
        format.html { redirect_to dashboard_path, notice: "Link was successfully updated." }
        format.json { render :show, status: :created, location: @link }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_user
    @user = User.friendly.find(params[:id]) || User.find(params[:id])

  rescue StandardError
    @user = nil
  end

  def set_link
    @link = Link.find(params[:id])
  
  rescue StandardError
    @link = nil
  end
end
