require 'rails_helper'

RSpec.describe TriviaService, type: :model do

  let(:user)   { create(:user) }  
  let(:trivia) { create(:trivia) }

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

  it "updates the score table with the answer and value for trivia" do
    VCR.use_cassette("random_trivia_question") do
      service.get_question
      trivia.update(user_id: user.id)
      trivia_answer = Trivia.find_by(user_id: user.id).answer
      trivia_value  = Trivia.find_by(user_id: user.id).value
      expect(trivia_answer).to eq("Romeo & Juliet")
      expect(trivia_value).to eq(100)
    end
  end

  xit "returns false if other media is included in the question" do
    VCR.use_cassette("random_trivia_question") do
      result = service.includes_other_media?("This includes Video")
      expect(result).to eq(true)
    end
  end

  xit "returns false if other media is included in the question" do
    VCR.use_cassette("random_trivia_question") do
      result = service.includes_complex_answers?("<i>This includes i</i>")
      expect(result).to eq(true)
      result = service.includes_complex_answers?("<strong>This includes strong</strong>")
      expect(result).to eq(true)
      result = service.includes_complex_answers?("[This includes brackets]")
      expect(result).to eq(true)
      result = service.includes_complex_answers?("(This includes parens)")
      expect(result).to eq(true)
      result = service.includes_complex_answers?("This is fine")
      expect(result).to eq(false)
    end
  end

end