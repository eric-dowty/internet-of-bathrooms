require 'rails_helper'

RSpec.describe Trivia, type: :model do

  let(:user)   { create(:user) }
  let(:score)  { create(:score) }
  let(:trivia) { create(:trivia) }

  it "can get the answer for a user id" do
    trivia.update(user_id: user.id)
    expect(Trivia.get_answer(user.id)).to eq("Romeo & Juliet")
  end

  it "can get the value for a user id" do
    trivia.update(user_id: user.id)
    expect(Trivia.get_value(user.id)).to eq(100)
  end

  it "can update the question for existing trivia" do
    trivia.update(user_id: user.id)
    Trivia.update_question(user.id, "Cat", 300)
    expect(Trivia.get_answer(user.id)).to eq("Cat")
    expect(Trivia.get_value(user.id)).to eq(300)
  end

  it "can create a question for a user with no trivia" do
    Trivia.update_question(user.id, "Cat", 300)
    expect(Trivia.get_answer(user.id)).to eq("Cat")
    expect(Trivia.get_value(user.id)).to eq(300)
  end

  it "calculates total score for a guess" do
    score.update(user_id: user.id)
    trivia.update(user_id: user.id) 
    score = Trivia.score_guess(user.id, "Romeo & Juliet")
    expect(user.get_score).to eq(100)
    score = Trivia.score_guess(user.id, "Romeo")
    expect(user.get_score).to eq(0)
    score = Trivia.score_guess(user.id, "Romeo")
    expect(user.get_score).to eq(-100)
    expect(score).to eq({ guess: "Romeo", answer: "Romeo & Juliet", score: -100, value: -100, success: false })
  end

  it "calculates correct score for close guesses" do 
    score.update(user_id: user.id)
    trivia.update(user_id: user.id) 
    score = Trivia.score_guess(user.id, "Romeo and Juliet")
    expect(user.get_score).to eq(100)
    score = Trivia.score_guess(user.id, "jUliet RomEO")
    expect(user.get_score).to eq(200)
    score = Trivia.score_guess(user.id, "Romeo")
    expect(user.get_score).to eq(100)
    score = Trivia.score_guess(user.id, "Juliet")
    expect(user.get_score).to eq(0)
  end

end