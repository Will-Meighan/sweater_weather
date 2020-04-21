class RoadTripFacade
  attr_reader :origin, :destination, :id

  def initialize(origin, destination)
    @id = "null"
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
    x = ForecastFacade.new(@destination).arrival_forecast
    x.arrival_forecast(distance.distance_value)
  end
end
