require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('The View Stylists Path', {:type => :feature}) do
  it('visits home page and ges to view stylists page') do
    visit('/')
    click_link('View Stylists')

    expect(page).to have_content('You have no stylists yet')
  end
end

describe('The Add stylist Path', {:type => :feature}) do
  it('Adds a Stylist') do
    visit('/stylists')
    click_link('Add a Stylist')
    expect(page).to have_content("Add a Stylist")
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")

    expect(page).to have_content('Gary')
  end
end

describe('The view stylist details Path', {:type => :feature}) do
  it('Adds a Stylist') do
    visit('/stylists')
    click_link('Add a Stylist')
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")
    expect(page).to have_content('Gary')
    click_link('Gary')
    expect(page).to have_content('Clients:')
  end
end

describe('The update stylist Path', {:type => :feature}) do
  it('Adds a Stylist') do
    visit('/stylists')
    click_link('Add a Stylist')
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")
    expect(page).to have_content('Gary')
    click_link('Gary')
    fill_in("name", :with => 'Rony')
    click_button('Update')
    expect(page).to have_content('Rony')
  end
end

describe('The delete stylist Path', {:type => :feature}) do
  it('Adds a Stylist') do
    visit('/stylists')
    click_link('Add a Stylist')
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")
    expect(page).to have_content('Gary')
    click_link('Gary')
    click_button('Remove Stylist')
    expect(page).to have_content('You have no stylists yet')
  end
end


describe('The add a client to stylist Path', {:type => :feature}) do
  it('Adds a Stylist') do
    visit('/stylists')
    click_link('Add a Stylist')
    fill_in("name", :with => "Gary")
    click_button("Add Stylist")
    expect(page).to have_content('Gary')
    click_link('Gary')
    click_link('Add a Client')
    expect(page).to have_content('Add a client for Gary')
  end
end
