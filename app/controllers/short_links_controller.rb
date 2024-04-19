class ShortLinksController < ApplicationController

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
      statistics_token: SecureRandom.base64(8),
      url_token: SecureRandom.base64(8)
    )
    
  end

  private

  def url
    params[:url]
  end
end
