module Api
  class SearchController < ApplicationController
    skip_before_action :authenticate_user!, raise: false

    def index
      query = params[:query].to_s
      results = Link.joins(:user)
                    .where("links.title ILIKE :q OR links.url ILIKE :q", q: "%#{query}%")
                    .limit(20)
                    .select("links.id, links.title, links.url, users.username AS username")

      render json: results.map { |l| { id: l.id, title: l.title, url: l.url, username: l.username } }
    end
  end
end
