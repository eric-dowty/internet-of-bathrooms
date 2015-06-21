require 'rails_helper'

RSpec.describe Bathroom, type: :model do

  it "has an initial status of 0" do
    Bathroom.create!(description: 'bathroom1')
    expect(Bathroom.first.description).to eq('bathroom1')
    expect(Bathroom.first.status).to eq(0)
  end

  it "is invalid without a description" do
    b = Bathroom.new(description: nil)
    expect(b).to_not be_valid
  end

  it "must be a unique bathroom" do
    Bathroom.create!(description: 'bathroom1')
    repeat = Bathroom.new(description: 'bathroom1')
    expect(repeat).to_not be_valid
  end

end