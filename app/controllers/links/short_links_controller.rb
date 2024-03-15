class Links::ShortLinksController < ApplicationController

  def create
    link = Link.find(params[:link_id])

    ShortLink.create(
      link: link,
      statistics_token: SecureRandom.base64(8),
      url_token: SecureRandom.base64(8)
    )

    redirect_to links_path
  end
end
