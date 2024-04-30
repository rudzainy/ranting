class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def edit
    render partial: 'edit_group_name', locals: { group: @group }, layout: false
  end

  def update
    if @group.update(group_params)
      redirect_to links_path, notice: 'Group name updated successfully.'
    else
      render :edit
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
