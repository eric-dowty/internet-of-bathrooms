require 'rails_helper'

RSpec.feature "user visits bad path" do

  scenario "gets error message" do
    visit '/no_path'
    expect(page).to have_content("Oh no!This isn't a page.")
  end

end