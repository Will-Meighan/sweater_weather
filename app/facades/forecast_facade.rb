class ForecastFacade
  attr_reader :id, :name, :data, :forecast_object

  def initialize(location)
    @id = nil
    location = GeolocationFacade.new(location)
    @forecast_object = ForecastService.new(location.lat, location.long).forecast
  end

  def current
    @forecast_object.data[:current]
  end

  def hourly
    @forecast_object.data[:hourly]
  end

  def daily
    @forecast_object.data[:daily]
  end

  def forecast_data
    @forecast_object.data
  end

end
