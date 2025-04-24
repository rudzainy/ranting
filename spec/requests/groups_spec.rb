require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /groups/:id/edit" do
    before do
      @user = User.create!(username: 'testuser', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @group = Group.create!(name: 'TestGroup', created_by: @user)
    end

    it "returns http success" do
      get edit_group_path(@group)
      expect(response).to have_http_status(:success)
    end
  end

end
