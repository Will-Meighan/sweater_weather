class MunchieFacade
  attr_reader :id

  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @id = nil
    require "pry"; binding.pry
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

end
