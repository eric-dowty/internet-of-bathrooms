class TriviaService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://jservice.io")
  end

  def get_question
    response = request_from_api
    if check_for_validity?(response)
      response_body = parse(response.body).first
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

  def check_for_validity?(response)
    true
  end

end