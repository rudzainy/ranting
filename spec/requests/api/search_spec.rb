require 'rails_helper'

RSpec.describe "API Search", type: :request do
  before do
    @user = User.create!(username: 'testuser', email: 't@example.com', password: 'password', password_confirmation: 'password')
    @link1 = Link.create!(title: 'FooLink', url: 'https://foo.com', user: @user)
    @link2 = Link.create!(title: 'BarLink', url: 'https://bar.com', user: @user)
  end

  it 'returns matching links for title query' do
    get '/api/search', params: { query: 'Foo' }
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json).to be_an(Array)
    expect(json.size).to eq(1)
    expect(json.first['title']).to eq('FooLink')
    expect(json.first['username']).to eq('testuser')
  end

  it 'returns matching links for url query' do
    get '/api/search', params: { query: 'bar.com' }
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json.map { |h| h['url'] }).to include('https://bar.com')
  end
end
