class ShortLinksController < ApplicationController
  impressionist actions: [:free]
  before_action :authenticate_user!, only: [:index]

  def index
    @should_render_navbar = true
    # Find all current_user's short_links
    @links = Link.all.where(category: 2, user_id: current_user.id)
    @short_link = ShortLink.new
  end

  def new
    @short_link = ShortLink.new
  end

  def free
    @short_link = ShortLink.new
  end

  def create
    if user_signed_in?
      link = current_user.links.create!(
        url: url,
        category: 2,
      )
    else
      link = Link.create!(
        url: url,
        category: 2
      )
    end
    
    @short_link = ShortLink.new

    @shorten_link = ShortLink.create!(
      link: link,
      statistics_token: SecureRandom.urlsafe_base64(4),
      url_token: SecureRandom.urlsafe_base64(4)
    )

    if user_signed_in?
      render turbo_stream: turbo_stream.prepend("short-links-container", partial: "short_links/table_row", locals: {link: link}, notice: "Link was successfully shorten.") 
    end
    
  end

  private

  def url
    params[:url]
  end
end
