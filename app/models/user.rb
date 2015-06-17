require 'ostruct'

class User < ActiveRecord::Base
  has_one :score
  has_one :trivia

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.email     = data.info.email
    user.nickname  = data.info.nickname
    user.image_url = data.info.image
    user.token     = data.credentials.token
    user.save

    user
  end

  def registered?
    true
  end

  def get_score
    Score.find_by(user_id: self.id).points
  end

  def get_trivia
    trivia = Trivia.find_by(user_id: self.id)
    {answer: trivia.answer, value: trivia.value}
  end

end
