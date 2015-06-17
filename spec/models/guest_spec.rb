require 'rails_helper'

RSpec.describe Guest, type: :model do

  let(:user) { Guest.new }

  it "is registered" do
    expect(user.registered?).to eq(false)
  end

end