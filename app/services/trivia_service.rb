class TriviaService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://jservice.io")
  end

  def get_question
    response = connection.get("/api/random")
    response_body = parse(response.body).first
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end