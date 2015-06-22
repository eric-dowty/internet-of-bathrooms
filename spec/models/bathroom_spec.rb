require 'rails_helper'
require 'json'

RSpec.describe Bathroom, type: :model do

  before(:each) do 
    Bathroom.create!(description: 'bathroom1')
    Bathroom.create!(description: 'bathroom2')
    Bathroom.create!(description: 'bathroom3')
  end

  it "has an initial status of 0" do
    expect(Bathroom.first.description).to eq('bathroom1')
    expect(Bathroom.first.status).to eq(0)
  end

  it "is invalid without a description" do
    b = Bathroom.new(description: nil)
    expect(b).to_not be_valid
  end

  it "must be a unique bathroom" do
    repeat = Bathroom.new(description: 'bathroom1')
    expect(repeat).to_not be_valid
  end

  it "gets the current status for bathrooms" do
    expect(Bathroom.status).to eq({"bathroom1"=>0, "bathroom2"=>0, "bathroom3"=>0})
  end

  it "can update the status of a bathroom" do
    expect(Bathroom.status).to eq({"bathroom1"=>0, "bathroom2"=>0, "bathroom3"=>0})
    updates = ({"bathroomOne"=>0, "bathroomTwo"=>1, "bathroomThree"=>1}).to_json
    Bathroom.updates(updates)
    expect(Bathroom.status).to eq({"bathroom1"=>0, "bathroom2"=>1, "bathroom3"=>1})
  end

end