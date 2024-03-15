class ShortLinkRedirectsController < ApplicationController

  def show
    short_link = ShortLink.find_by_url_token(params[:url_token])
    link = short_link.link
    impressionist(short_link)
    redirect_to(link.url, allow_other_host: true)
  end
end
