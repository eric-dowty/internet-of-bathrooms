require 'rails_helper'

RSpec.describe TriviaService, type: :model do

  attr_reader :service

  before(:each) do
    @service = TriviaService.new
  end

  it "returns a triva question" do
    VCR.use_cassette("random_trivia_question") do
      result   = service.get_question
      expect(result.class).to eq(Array)
      expect(result[0].class).to eq(Hash)
      expect(result.size).to eq(1)
    end
  end

  it "returns question data" do
    VCR.use_cassette("random_trivia_question") do
      result   = service.get_question[0]
      expect(result[:answer]).to eq("Romeo & Juliet")
      expect(result[:value]).to eq(100)
      expect(result[:category][:title]).to eq("software that bytes")
    end
  end

end