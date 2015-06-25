require 'rails_helper'

RSpec.feature "user logs out" do

  let!(:user) { create(:user) }
  let!(:bathroom1) { create(:bathroom1) }
  let!(:bathroom2) { create(:bathroom2) }
  let!(:bathroom3) { create(:bathroom3) }

  scenario "can logout" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit bathrooms_path
    click_on("Logout")
    expect(page).to have_content("GitHub Login")
  end

end