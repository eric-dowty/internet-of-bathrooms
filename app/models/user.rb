require 'ostruct'

class User < ActiveRecord::Base
  has_one :score
  has_one :trivia

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    Score.set_user_score(user.id)
    
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

  def self.get_bot_data(user)
    {username: user.nickname, 
     bot: user.bot, 
     status: Bathroom.all.pluck(:status).reduce(:+)}
  end

  def self.update_bot_data(user)
    user = User.find(user.id) 
    user.bot ? user.update(bot: false) : user.update(bot: true)
    get_bot_data(user)
  end

end
