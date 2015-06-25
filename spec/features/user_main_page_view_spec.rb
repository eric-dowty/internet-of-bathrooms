require 'rails_helper'

RSpec.feature "user sees the main page" do

  let!(:user) { create(:user) }

  # scenario "can see trivia labels" do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #   visit bathrooms_path
  #   save_and_open_page
  #   expect(page).to have_content("Category:")
  # end

end