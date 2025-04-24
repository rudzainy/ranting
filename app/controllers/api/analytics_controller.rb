module Api
  class AnalyticsController < ApplicationController
    skip_before_action :authenticate_user!, raise: false

    def show
      user = User.friendly.find(params[:id])
      link_ids = user.links.pluck(:id)
      counts = Impression.where(impressionable_type: 'Link', impressionable_id: link_ids)
                         .group(:impressionable_id).count

      data = user.links.map do |link|
        { id: link.id, title: link.title, clicks: counts[link.id] || 0 }
      end

      render json: data
    end
  end
end
