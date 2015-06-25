require 'rails_helper'
require 'json'

RSpec.describe ScoresController, type: :controller do

  let!(:user)  { create(:user) }
  let!(:score) { create(:score) }

  before(:each) do
    score.update(user_id: user.id, points: 100)
  end

  describe "GET #show" do 
    it "responds with the users current score" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      xhr :get, :show
      expect(response).to have_http_status(:success)
    end
  end

  it "returns a users score" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get :show, format: :json

    expect(response.body).to eq("100")
  end

  it "returns a triva question" do
    get :boards, format: :json
    scores = JSON.parse(response.body, symbolize_names: true)
    first_score = scores.first

    expect(first_score).to eq({:name=>"eric-dowty", :points=>100})
  end

end