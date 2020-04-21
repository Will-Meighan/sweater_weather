class AntipodeService

  def connection
    Faraday.new("http://amypode.herokuapp.com")
  end

  def get_antipode(lat, long)
    response = connection.get("/api/v1/antipodes") do |call|
      call.headers[:api_key] = ENV['WILL_KEY']
      call.params[:lat] = lat
      call.params[:long] = long
    end
    JSON.parse(response.body, symbolize_names: true)
  end


end
