class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :link_params, only: [:update]
  before_action :set_user, only: [:edit, :index]
  before_action :set_link, only: [:update, :edit, :show]

  def index
    @should_render_navbar = true
    # @groups = Group.includes(:links)
    @free_links = current_user.links.where(category: "free").order(position: :asc)
    @social_links = current_user.links.where(category: "social").order(position: :asc)

    unless @free_links.empty?
      @group = @free_links.first.group
    else
      @group = ""
    end
  end

  def edit; end

  def show
    impressionist(@link)
    redirect_to(@link.url, allow_other_host: true)
  end

  def update
    respond_to do |format|
      if @link.update(link_params)

        @edit_link_id = "edit_link_#{@link.id}"
        
        format.turbo_stream do
          if mobile_device?
            render turbo_stream: turbo_stream.replace("edit_link_mobile_#{@link.id}", partial: "links/table_row_mobile", locals: {link: @link}, notice: "Link was successfully updated.") 
          else 
            render turbo_stream: turbo_stream.replace("link_#{@link.id}", partial: "links/table_row", locals: {link: @link}, notice: "Link was successfully updated.") 
          end
        end
        format.html { redirect_to user_path(current_user), notice: "Link was successfully updated." }
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
    params.require(:link).permit(:title, :url, :icon, :category, :image, :css_class)
  end

  def set_link
    @link = Link.find(params[:id])

  rescue StandardError
    @link = nil
  end
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
end
