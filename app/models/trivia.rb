class Trivia < ActiveRecord::Base

  def self.get_answer(user_id)
    Trivia.where(user_id: user_id).pluck(:answer).first
  end

  def self.get_value(user_id)
    Trivia.where(user_id: user_id).pluck(:value).first
  end

end