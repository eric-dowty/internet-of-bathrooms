class TriviaService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://jservice.io")
  end

  def get_question
    response = request_from_api
    response_body = parse(response.body).first
    if check_for_validity?(response_body)
      response_body
    else
      get_question
    end
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def request_from_api
    connection.get("/api/random")
  end

  def check_for_validity?(response_body)
    return false if incomplete?(response_body)
    return false if too_long?(response_body[:question])
    return false if includes_other_media?(response_body[:question])
    return false if includes_complex_answers?(response_body[:question])
    true
  end

  def incomplete?(response_body)
    return true if response_body[:answer] == nil || response_body[:answer] == ""
    return true if response_body[:question] == nil || response_body[:question] == ""
    return true if response_body[:value] == nil || response_body[:value] == ""
    return true if response_body[:category][:title] == nil || response_body[:category][:title] == ""
    false
  end

  def too_long?(question)
    question.chars.length > 200
  end

  def includes_other_media?(question)
    question.downcase.split(' ').any? { |word| other_media.include?(word) }
  end

  def other_media
    ["audio", "video", "pictured", "herein"]
  end

  def includes_complex_answers?(answer)
    answer.chars.any? { |char| complex_chars.include?(char) }
  end

  def complex_chars
    ["[", "]", "(", ")", "#", "$", "<", ">"]
  end

end