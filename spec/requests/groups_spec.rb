require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/groups/update"
      expect(response).to have_http_status(:success)
    end
  end

end
