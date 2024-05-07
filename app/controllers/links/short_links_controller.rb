class Links::ShortLinksController < ApplicationController

  def create
    link = Link.find(params[:link_id])

    ShortLink.create(
      link: link,
      statistics_token: SecureRandom.urlsafe_base64(4),
      url_token: SecureRandom.urlsafe_base64(4)
    )

    redirect_to links_path
  end
end
