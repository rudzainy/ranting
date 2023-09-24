class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :link_params, only: [:update]
  before_action :set_user, only: [:edit, :index]
  before_action :set_link, only: [:update, :edit]

  def index
    @should_render_navbar = true
    @links = current_user.links.order(position: :asc)
  end

  def edit; end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('links', partial: 'links/form', locals: {link: @link}) }
        format.html { redirect_to links_path, notice: "Link was successfully updated." }
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

  def set_link
    @link = Link.find(params[:id])
  
  rescue StandardError
    @link = nil
  end
end
