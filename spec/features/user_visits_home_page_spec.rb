require 'rails_helper'

RSpec.feature "user visits home page" do

  scenario "see data on home page" do
    visit root_path
    expect(page).to have_content("GitHub Login")
    expect(page).to have_content("Just like students, the bathrooms at the Turing School are stupid smart!
They'll let you know when they are free... login for availability.")
  end

end