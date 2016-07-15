require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('view stylists page', {:type => :feature}) do
  it('visits home page and ges to view stylists page') do
    visit('/')
    click_link('View Stylists')

    expect(page).to have_content('Stylists')
    expect(page).to have_content('You have no stylists yet')
  end
end
