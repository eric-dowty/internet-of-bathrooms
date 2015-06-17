class Trivia < ActiveRecord::Base
  belongs_to :user

  def self.get_answer(user_id)
    Trivia.where(user_id: user_id).pluck(:answer).first
  end

  def self.get_value(user_id)
    Trivia.where(user_id: user_id).pluck(:value).first
  end

  def self.update_question(user_id, answer, value)
    current_trivia = Trivia.find_by(user_id: user_id)
    if current_trivia == nil
      Trivia.create!(user_id: user_id, answer: answer, value: value)
    else
      current_trivia.update!(answer: answer, value: value)
    end
  end

  def self.score_guess(user_id, words)
    score = nil
    user  = User.find(user_id)
    if strip(words) == strip(Trivia.get_answer(user_id))
      score = user.get_score + Trivia.get_value(user_id)
    else
      score = user.get_score - Trivia.get_value(user_id)
    end
    Score.where(user_id: user_id).first.update(points: score)
  end

  private

  def self.strip(words)
    words.downcase.split(' ').reject { |word| common_words.include?(word) }.sort.join
  end

  def self.common_words
    ["the", "be", "to", "of", "and", "a", "in", "that", "have", "I", "it", 
     "for", "not", "on", "with", "he", "as", "you", "do", "at", "this", "but",
     "his", "by", "&", "-" ]
  end

end