require 'rails_helper'

RSpec.describe BathroomsController, type: :controller do

  let!(:bathroom1) { create(:bathroom1) }
  let!(:bathroom2) { create(:bathroom2) }
  let!(:bathroom3) { create(:bathroom3) }

  describe "the bathrooms" do
    it "has statuses" do
      expect(bathroom1.description).to eq("bathroom1")
      expect(bathroom1.status).to eq(0)
      expect(bathroom2.description).to eq("bathroom2")
      expect(bathroom2.status).to eq(0)
      expect(bathroom3.description).to eq("bathroom3")
      expect(bathroom3.status).to eq(0)
    end
  end

  describe "GET #home" do
    it "returns http success for home" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #main" do
    it "returns http success for main" do
      get :main
      expect(response).to have_http_status(:success)
    end
  end


end