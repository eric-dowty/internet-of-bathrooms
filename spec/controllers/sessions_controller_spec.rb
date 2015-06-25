require 'rails_helper'

RSpec.describe SessionsController, type: :controller do 

  let!(:user) { create(:user) }

  describe "DELETE #destroy" do
    it "returns 302 (redirect)" do
      delete :destroy
      expect(response).to have_http_status(302)
    end
  end

end