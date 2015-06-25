require 'rails_helper'

RSpec.feature "user sees the main page" do

  let!(:user) { create(:user) }
  let!(:bathroom1) { create(:bathroom1) }
  let!(:bathroom2) { create(:bathroom2) }
  let!(:bathroom3) { create(:bathroom3) }

  scenario "can see trivia labels" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit bathrooms_path
    expect(page).to have_content("Category:")
    expect(page).to have_content("Question:")
    expect(page).to have_content("Big workspace bathroom availability.")
    expect(page).to have_content("Trivia while you wait, for ")
    expect(page).to have_content("Skip")
    expect(page).to have_content("What is")
    expect(page).to have_content("Submit")
  end

  scenario "can submit an answer for points" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit bathrooms_path
    click_on("Submit")
    expect(page).to have_content("Guess")
    expect(page).to have_content("Answer")
  end

end