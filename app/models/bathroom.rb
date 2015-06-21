class Bathroom < ActiveRecord::Base
  validates :description, presence: true

  def self.status
    {
      "bathroom1": Bathroom.find_by(description: "bathroom1").status,
      "bathroom2": Bathroom.find_by(description: "bathroom2").status,
      "bathroom3": Bathroom.find_by(description: "bathroom3").status
    }
  end

  def self.updates(status)
    Bathroom.find_by(description: "bathroom1").update(status: status["bathroomOne"])
    Bathroom.find_by(description: "bathroom2").update(status: status["bathroomTwo"])
    Bathroom.find_by(description: "bathroom3").update(status: status["bathroomThree"])
  end

end