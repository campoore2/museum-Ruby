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
