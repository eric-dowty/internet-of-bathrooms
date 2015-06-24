class Trivia < ActiveRecord::Base
  belongs_to :user

  def self.update_question(user_id, answer, value)
    current_trivia = Trivia.find_by(user_id: user_id)
    if current_trivia == nil
      Trivia.create!(user_id: user_id, answer: answer, value: value)
    else
      current_trivia.update!(answer: answer, value: value)
    end
  end

  def self.score_guess(user_id, words)
    trivia = Trivia.where(user_id: user_id).first
    answer = trivia.answer
    value  = trivia.value
    win    = good_guess?(words, answer)
    value  = value * -1 unless win
    score  = User.find(user_id).get_score + value
    Score.update_score(user_id, score)
    {guess: words, answer: answer, score: score, value: value, success: win}
  end

  private

  def self.good_guess?(words, answer)
    return true if words.downcase == "poopin"
    strip_words(strip_chars(words)) == strip_words(strip_chars(answer)) 
  end

  def self.strip_words(words)
    nothing_common = words.downcase.split(' ').reject do |word|
      common_words.include?(word)
    end
    nothing_common == [] ? ("noguess") : nothing_common.sort.join
  end

  def self.strip_chars(words)
    stripped_chars = words.downcase.chars.reject do |char|
      common_chars.include?(char)
    end
    stripped_chars.join
  end

  def self.common_words
    ["the", "be", "to", "of", "and", "a", "in", "that", "have", "I", "it", 
     "for", "not", "on", "with", "he", "as", "you", "do", "at", "this", "but",
     "his", "by", "&", "-", ",", ".", "\"", "(", ")", "<i>", "</i>", "<p>", "</p>",
     "<strong>", "</strong>", "[", "]", "{", "}"]
  end

  def self.common_chars
    [",", "\"", "'", "(", ")", "<", ">", "i", "/", "<p>", "</p>", "[", "]", "{", "}", "."]
  end

end