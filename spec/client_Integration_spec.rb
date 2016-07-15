require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('The View Clients Path', {:type => :feature}) do
  it('visits home page and ges to view Clients page') do
    visit('/')
    click_link('View Clients')

    expect(page).to have_content('You have no clients yet')
  end
end

describe('The Add client Path', {:type => :feature}) do
  it('Adds a Client') do
    visit('/clients')
    click_link('New Client')
    expect(page).to have_content("New Client")
    fill_in("name", :with => "Gary")
    click_button("Add Client")

    expect(page).to have_content('Gary')
  end
end

describe('The view client details Path', {:type => :feature}) do
  it('Lists all clients') do
    visit('/clients')
    click_link('New Client')
    fill_in("name", :with => "Gary")
    click_button("Add Client")
    expect(page).to have_content('Gary')
    click_link('Gary')
    expect(page).to have_content('Gary')
  end
end

describe('The update client Path', {:type => :feature}) do
  it("Updates a client's name") do
    visit('/clients')
    click_link('New Client')
    fill_in("name", :with => "Gary")
    click_button("Add Client")
    click_link('Gary')
    fill_in("name", :with => 'Rony')
    click_button('Update')
    expect(page).to have_content('Rony')
  end
end

describe('The delete client Path', {:type => :feature}) do
  it('Deletes a Client') do
    visit('/clients')
    click_link('New Client')
    fill_in("name", :with => "Gary")
    click_button("Add Client")
    expect(page).to have_content('Gary')
    click_link('Gary')
    click_button('Remove Client')
    expect(page).to have_content('You have no clients yet')
  end
end
