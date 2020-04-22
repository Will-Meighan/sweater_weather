class MunchieFacade
  attr_reader :id

  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @id = nil
  end

  def end_location
    city = @end.split(',')[0].capitalize
    state = @end.split(',')[1].upcase
    "#{city}, #{state}"
  end

  def forecast
    forecast_object = ForecastFacade.new(@end).forecast_object
    forecast_object.arrival_forecast(distance.distance_value)
  end

  def restaurant
    {
      name: restaurant_info[0],
      address: restaurant_info[1]
    }
  end

  def travel_time
    distance.distance_text
  end


  private

    def travel_time_unix
      distance.distance_unix
    end

    def distance
      DirectionsService.new(@start, @end)
    end

    def arrival_time
      travel_time_unix + Time.now.to_i
    end

    def restaurant_info
      YelpService.new(arrival_time, @food, @end).business_info
    end

end
