require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it('displays the landing page') do
    visit('/')
    expect(page).to have_content('Museum Tracker')
  end
end

describe('/curator/museums', {:type => :feature}) do
  it('displays the curator welcome page') do
    visit('/curator/museums')
    expect(page).to have_content('Welcome Curator')
    expect(page).to have_content('Current Museums')
    expect(page).to have_content('Do you want to:')
  end
end

describe('/curator/museums/new', {:type => :feature}) do
  it('displays the add museum page') do
    visit('/curator/museums/new')
    expect(page).to have_content('Add a Museum')
    fill_in('museum_name', :with => 'Met')
    click_button('Add this Museum')
  end
end

describe('/curator/artworks', {:type => :feature}) do
  it('asks the user which museum they want to add art to') do
    visit('/curator/artworks')
    expect(page).to have_content('Current Museums')
    expect(page).to have_content('Click on a museum to add art.')
  end
end

describe('/curator/artworks/add/', {:type => :feature}) do
  it('displays a form to add art') do
    visit('/curator/artworks/add/')
    expect(page).to have_content('Add a Artwork')
    fill_in('artwork_name', :with => 'David')
  end
end

describe('/curator/museums/131', {:type => :feature}) do
  it('edits the selected museum') do
    visit('/curator/museums/131')
    expect(page).to have_content('Edit:')
    expect(page).to have_content('Click on a art to edit it.')
    expect(page).to have_content('Update the Museum Name')
    fill_in('museum_name', :with => 'New Name')
    click_button('Change')
  end
end

describe('/')
