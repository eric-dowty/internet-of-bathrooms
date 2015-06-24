require 'json'

class Bathroom < ActiveRecord::Base
  validates :description, presence: true, uniqueness: true

  def self.status
    bathrooms = Bathroom.all
    {
      "bathroom1" => bathrooms.find_by(description: "bathroom1").status,
      "bathroom2" => bathrooms.find_by(description: "bathroom2").status,
      "bathroom3" => bathrooms.find_by(description: "bathroom3").status
    }
  end

  def self.updates(status)
    current_status = JSON.parse(status)
    bathrooms = Bathroom.all
    bathrooms.find_by(description: "bathroom1").update(status: current_status["bathroomOne"])
    bathrooms.find_by(description: "bathroom2").update(status: current_status["bathroomTwo"])
    bathrooms.find_by(description: "bathroom3").update(status: current_status["bathroomThree"])
  end

end