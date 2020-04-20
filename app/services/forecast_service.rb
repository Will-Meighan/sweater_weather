class ForecastService
  attr_reader :forecast

  def initialize(location)
    data = get_json("data/2.5/onecall?APPID=#{ENV['WEATHER_API_KEY']}&lon=#{location.location.lon}&lat=#{location.location.lat}&units=imperial")
    @forecast = Forecast.new(data)
  end

  private

    def get_json(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://api.openweathermap.org/")
    end
end
