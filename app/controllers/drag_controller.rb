class DragController < ApplicationController

  def links
    @link = Link.find(drag_link_params[:id])
    @link.insert_at(drag_link_params[:position].to_i + 1) 
  end

  private

  def drag_link_params
    params.require(:resource).permit(:id, :position)
  end
end
