require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('view stylists page with no stylists', {:type => :feature}) do
  it('visits home page and ges to view stylists page') do
    visit('/')
    click_link('View Stylists')

    expect(page).to have_content('You have no stylists yet')
  end
end


describe('view stylists page with no stylists', {:type => :feature}) do
  it('visits home page and ges to view stylists page') do
    visit('/stylists')
    click_link('Add a Stylist')
    expect(page).to have_content("Add a Stylist")
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")
    expect(page).to have_content('Gary')
  end
end
