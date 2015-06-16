class ToiletService 

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://toilet-endpoint.herokuapp.com")
  end

  def usage_data
    response = connection.get("/api/v1/bathrooms.json")
    response_body = parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end