class AnalyticsController < ApplicationController
  # Renders analytics UI; chart via Stimulus to /api/analytics/:id
  def index
  end

  # Records a click impression via non-blocking AJAX
  skip_before_action :authenticate_user!, only: :create
  def create
    Impression.create!(
      impressionable_type: 'Link',
      impressionable_id: params.require(:link_id),
      user_id: current_user&.id
    )
    head :ok
  end
end
