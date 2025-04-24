require 'rails_helper'

RSpec.describe "Search UI", type: :system do
  driven_by :rack_test
  before do
    @user = User.create!(username: 'searcher', email: 'searcher@example.com', password: 'password', password_confirmation: 'password')
    @link1 = Link.create!(title: 'FooSearch', url: 'https://foo.com', user: @user)
    @link2 = Link.create!(title: 'BarSearch', url: 'https://bar.com', user: @user)
  end

  it "displays results when querying" do
    visit search_path(query: 'Foo')
    expect(page).to have_text('FooSearch')

    visit search_path(query: 'Baz')
    expect(page).to have_text('No results found.')
  end
end
