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
    answer = Trivia.get_answer(user_id)
    value  = Trivia.get_value(user_id)
    win    = good_guess?(words, answer)
    value  = value * -1 unless win
    score = User.find(user_id).get_score + value
    Score.update_score(user_id, score)
    { guess: words, answer: answer, score: score, value: value, success: win }
  end

  private

  def self.good_guess?(words, answer)
    strip(words) == strip(answer)
  end

  def self.strip(words)
    nothing_common = html_reject(words).downcase.split(' ').reject do |word|
      common_words.include?(word)
    end.sort.join
    nothing_common
  end

  def self.common_words
    ["the", "be", "to", "of", "and", "a", "in", "that", "have", "I", "it", 
     "for", "not", "on", "with", "he", "as", "you", "do", "at", "this", "but",
     "his", "by", "&", "-", ",", "\"", "(", ")", "<i>", "</i>", "<p>", "</p>",
     "<strong>", "</strong>", "[", "]", "{", "}"]
  end

  def self.html_reject(word_string)
    word_string.gsub(/(<i>|<\/i>|<strong>|<\/strong>)/,'')
  end

end