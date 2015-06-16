require 'rails_helper'

RSpec.describe ToiletService, type: :model do

  attr_reader :service

  before(:each) do
    @service = ToiletService.new
  end 

  it "returns bathroom data" do
    VCR.use_cassette("toilet_info") do
      expected = {"bathroom1": 1,"bathroom2": 0,"bathroom3": 1}
      results  = service.usage_data
      expect(results).to eq(expected)
    end
  end

end