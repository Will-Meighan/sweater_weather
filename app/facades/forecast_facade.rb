class ForecastFacade
  attr_reader :id, :name, :data, :arrival_forecast

  def initialize(location)
    @id = nil
    location = GeolocationFacade.new(location)
    @data = ForecastService.new(location.lat, location.long).forecast.data
    @arrival_forecast = ForecastService.new(location.lat, location.long).forecast
  end

  def current
    @data[:current]
  end

  def hourly
    @data[:hourly]
  end

  def daily
    @data[:daily]
  end

end
