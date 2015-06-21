require 'json'

class Bathroom < ActiveRecord::Base
  validates :description, presence: true, uniqueness: true

  def self.status
    {
      "bathroom1" => Bathroom.find_by(description: "bathroom1").status,
      "bathroom2" => Bathroom.find_by(description: "bathroom2").status,
      "bathroom3" => Bathroom.find_by(description: "bathroom3").status
    }
  end

  def self.updates(status)
    current_status = JSON.parse(status)
    Bathroom.find_by(description: "bathroom1").update(status: current_status["bathroomOne"])
    Bathroom.find_by(description: "bathroom2").update(status: current_status["bathroomTwo"])
    Bathroom.find_by(description: "bathroom3").update(status: current_status["bathroomThree"])
  end

end