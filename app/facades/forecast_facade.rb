class ForecastFacade
  attr_reader :id, :name, :data

  def initialize(location)
    @id = nil
    @data = ForecastService.new(GeolocationFacade.new(location).coordinates).forecast.data
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
