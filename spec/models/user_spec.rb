require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user)   { create(:user) }
  let!(:score) { Score.create(user_id: user.id, points: 100) }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is registered" do
    expect(user.registered?).to eq(true)
  end

  it "returns a score for a user" do
    score = user.get_score
    expect(score).to eq(100)
  end

end