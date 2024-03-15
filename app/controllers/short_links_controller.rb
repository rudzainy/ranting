class ShortLinksController < ApplicationController

  def new
    @short_links = ShortLink.new
  end

  def create
    link = Link.create(
      url: url,
      category: 2
    )

    short_link = ShortLink.create(
      link: link,
      statistics_token: SecureRandom.base64(8),
      url_token: SecureRandom.base64(8)
    )

    redirect_to new_short_link_path
  end

  private

  def url
    params[:short_link][:url]
  end
end
