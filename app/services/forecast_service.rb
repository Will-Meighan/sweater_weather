class ForecastService
  attr_reader :forecast

  def initialize(lat, lon)
    data = get_json("data/2.5/onecall?APPID=#{ENV['WEATHER_API_KEY']}&lon=#{lon}&lat=#{lat}&units=imperial")
    @forecast = Forecast.new(data)
  end

  private

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://api.openweathermap.org/")
    end
end
