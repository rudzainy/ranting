include Recaptcha::Adapters::ViewMethods
include Recaptcha::Adapters::ControllerMethods

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
    redirect_to "/"
    # unless user_signed_in?
    #   @show_checkbox_recaptcha = true
    # end
    # @short_link = ShortLink.new
  end

  def create
    if user_signed_in?
      link = current_user.links.create!(
        url: url,
        category: 2,
      )
    
      @short_link = ShortLink.new
  
      @shorten_link = ShortLink.create!(
        link: link,
        statistics_token: SecureRandom.urlsafe_base64(4),
        url_token: SecureRandom.urlsafe_base64(4)
      )
      
      render turbo_stream: turbo_stream.prepend("short-links-container", partial: "short_links/table_row", locals: {link: link}, notice: "Link was successfully shorten.") 
    else
      success = verify_recaptcha(action: 'free_shortlinks', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_SITE_KEY'])
      checkbox_success = verify_recaptcha unless success
      if success || checkbox_success
        link = Link.create!(
          url: url,
          category: 2
        )
        if link
          @short_link = ShortLink.new
  
          @shorten_link = ShortLink.create!(
            link: link,
            statistics_token: SecureRandom.urlsafe_base64(4),
            url_token: SecureRandom.urlsafe_base64(4)
          )
        end
      else
        if !success
          @show_checkbox_recaptcha = true
        end
        render 'free'
      end
    end
  end

  private

  def url
    params[:url]
  end
end
