require 'rails_helper'

RSpec.describe TriviaService, type: :model do

  attr_reader :service

  before(:each) do
    @service = TriviaService.new
  end

  it "returns a triva question" do
    VCR.use_cassette("random_trivia_question") do
      result   = service.get_question
      expect(result.class).to eq(Hash)
    end
  end

  it "returns question data" do
    VCR.use_cassette("random_trivia_question") do
      result   = service.get_question
      expect(result[:answer]).to eq("Romeo & Juliet")
      expect(result[:value]).to eq(100)
      expect(result[:category][:title]).to eq("software that bytes")
    end
  end

end