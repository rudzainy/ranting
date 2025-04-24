class SearchController < ApplicationController
  # Renders search UI; AJAX via Stimulus to /api/search
  def index
    if params[:query].present?
      @results = Link.joins(:user)
                     .where("links.title ILIKE :q OR links.url ILIKE :q", q: "%#{params[:query]}%")
                     .limit(20)
                     .select("links.id, links.title, links.url, users.username AS username")
    end
  end
end
