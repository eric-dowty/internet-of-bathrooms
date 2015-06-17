class Score < ActiveRecord::Base
  belongs_to :user

  def self.update_score(user_id, score)
    Score.where(user_id: user_id).first.update(points: score)
  end
end