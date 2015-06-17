class Score < ActiveRecord::Base
  belongs_to :user

  def self.update_score(user_id, score)

  end
end