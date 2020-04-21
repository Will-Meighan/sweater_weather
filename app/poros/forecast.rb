class Forecast
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def arrival_forecast(duration)

    current_time = @data[:current][:dt]
    arrival_time = current_time + duration

    forecast = @data[:hourly].min_by do |time|
      (arrival_time - time[:dt]).abs
    end

    weather = forecast[:weather][0][:description]
    temp = forecast[:temp]
    {temp: temp, description: weather}
  end
end
