class RoadTripFacade
  attr_reader :origin, :destination, :id

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
  end

  def distance
    DirectionsService.new(@origin, @destination)
  end

  def travel_time
    distance.distance_text
  end

  def arrival_forecast
    forecast_object = ForecastFacade.new(@destination).forecast_object
    forecast_object.arrival_forecast(distance.distance_value)
  end
end
