require 'rails_helper'
require 'json'

RSpec.describe UsersController, type: :controller do

  let!(:user) { create(:user) }

  before(:each) do
    user.update(nickname: "eric-dowty")
  end

  describe "GET get_bot_data" do
    it "returns bot data" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :get_bot_data, format: :json
      bot = JSON.parse(response.body)
      expect(bot["username"]).to eq("eric-dowty")
      expect(bot["bot"]).to eq(false)
    end
  end

  describe "GET update_bot_data" do
    it "returns updatedbot data" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :update_bot_data, format: :json
      bot = JSON.parse(response.body)
      expect(bot["username"]).to eq("eric-dowty")
      expect(bot["bot"]).to eq(true)
    end
  end

end