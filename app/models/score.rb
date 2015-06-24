require 'ostruct'

class Score < ActiveRecord::Base
  belongs_to :user

  def self.update_score(user_id, score)
    Score.where(user_id: user_id).first.update(points: score)
  end

  def self.set_user_score(user_id)
    score = Score.where(user_id: user_id).first
    Score.create!(user_id: user_id) if score == nil
  end

  def self.boards
    Score.order(points: :desc).take(5).map do |score|
      {name: User.find(score.user_id).nickname, points: score.points}
    end
  end

end