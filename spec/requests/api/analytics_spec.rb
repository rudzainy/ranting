require 'rails_helper'

RSpec.describe "API Analytics", type: :request do
  before do
    @user = User.create!(username: 'analyst', email: 'analyst@example.com', password: 'password', password_confirmation: 'password')
    @link1 = Link.create!(title: 'LinkOne', url: 'https://one.com', user: @user)
    @link2 = Link.create!(title: 'LinkTwo', url: 'https://two.com', user: @user)
    # Create impressions for link1 and link2
    3.times do
      Impression.create!(impressionable: @link1, user_id: @user.id,
                         controller_name: 'links', action_name: 'show',
                         request_hash: SecureRandom.hex, ip_address: '127.0.0.1', session_hash: SecureRandom.hex)
    end
    1.times do
      Impression.create!(impressionable: @link2, user_id: @user.id,
                         controller_name: 'links', action_name: 'show',
                         request_hash: SecureRandom.hex, ip_address: '127.0.0.2', session_hash: SecureRandom.hex)
    end
  end

  it 'returns click counts for each link' do
    get "/api/analytics/#{@user.username}"
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json).to be_an(Array)
    entry1 = json.find { |e| e['id'] == @link1.id }
    entry2 = json.find { |e| e['id'] == @link2.id }
    expect(entry1['clicks']).to eq(3)
    expect(entry2['clicks']).to eq(1)
  end
end
