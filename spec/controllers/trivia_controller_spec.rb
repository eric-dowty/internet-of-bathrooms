require 'rails_helper'
require 'json'

RSpec.describe TriviaController, type: :controller do

  let!(:user)   { create(:user) }
  let!(:score)  { create(:score) }
  let!(:trivia) { create(:trivia) }

  before(:each) do
    trivia.update(user_id: user.id)
    score.update(user_id: user.id)
  end

  describe "GET #data" do
    it "returns trivia data" do
      VCR.use_cassette("random_trivia_question") do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        get :data, format: :json
        trivia = JSON.parse(response.body)
        expect(trivia["answer"]).to eq("Romeo & Juliet")
        expect(trivia["value"]).to eq(100)
        expect(trivia["question"]).to eq("A dangerous new virus is actually 2 files which share their names with these 2 Shakespearean lovers")
        expect(trivia["category"]["title"]).to eq("software that bytes")
      end
    end
  end

  describe "GET #answer" do
    it "returns trivia guess report" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :answer, guess: "Romeo & Juliet", format: :json
      report = JSON.parse(response.body)
      expect(report["success"]).to eq(true)
      expect(report["answer"]).to eq("Romeo & Juliet")
      expect(report["guess"]).to eq("Romeo & Juliet")
      expect(report["value"]).to eq(100)
      expect(report["score"]).to eq(100)
    end
  end

end