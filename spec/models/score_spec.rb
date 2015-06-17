require 'rails_helper'

RSpec.describe Score, type: :model do 

  let!(:user)  { create(:user) }
  let!(:score) { Score.create(user_id: user.id)}

  it "has a default of 0 points" do
    expect(score.points).to eq(0)
  end

  it "belongs to a user" do
    expect(score.user_id).to eq(user.id)
  end

  it "can have negative points" do
    score.update(points: -100)
    expect(score.points).to eq(-100)
  end

  it "can have positive points" do
    score.update(points: 100)
    expect(score.points).to eq(100)
  end

end