require 'rails_helper'
require 'json'

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
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #status" do
    it "returns the status of the bathrooms" do
      get :status, format: :json
      result = JSON.parse(response.body)
      expect(result).to eq({"bathroom1"=>0, "bathroom2"=>0, "bathroom3"=>0})
    end
  end

  describe "GET #updates" do
    it "returns the updated status for the bathrooms" do
      get :updates, format: :json
      result = {"bathroom1"=>0, "bathroom2"=>1, "bathroom3"=>0}
      expect(result).to eq({"bathroom1"=>0, "bathroom2"=>1, "bathroom3"=>0})
    end
  end

end