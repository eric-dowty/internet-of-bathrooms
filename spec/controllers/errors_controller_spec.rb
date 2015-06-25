require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET show" do 
    it "returns http success for show" do
      visit '/no_path'
      expect(response).to have_http_status(:success)
    end
  end

end