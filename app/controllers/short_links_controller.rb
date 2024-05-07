class ShortLinksController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
    @should_render_navbar = true
    # Find all current_user's short_links
    @short_links = current_user.anonymous_short_links
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    link = Link.create!(
      url: url,
      category: 2
    )
    
    @short_link = ShortLink.new

    @shorten_link = ShortLink.create!(
      link: link,
      statistics_token: SecureRandom.urlsafe_base64(4),
      url_token: SecureRandom.urlsafe_base64(4)
    )
    
  end

  private

  def url
    params[:url]
  end
end
