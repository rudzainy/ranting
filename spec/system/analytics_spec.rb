require 'rails_helper'

RSpec.describe "Analytics UI", type: :system do
  driven_by :rack_test

  before do
    @user = User.create!(username: 'analyst', email: 'analyst@example.com', password: 'password', password_confirmation: 'password')
    @link1 = Link.create!(title: 'LinkOne', url: 'https://one.com', user: @user)
    2.times do
      Impression.create!(impressionable: @link1, user_id: @user.id,
                         controller_name: 'links', action_name: 'show',
                         request_hash: SecureRandom.hex, ip_address: '127.0.0.1', session_hash: SecureRandom.hex)
    end
  end

  it "displays analytics chart for logged-in user" do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit analytics_path
    expect(page).to have_content("Analytics for @#{@user.username}")
    expect(page).to have_selector('canvas')
  end
end
