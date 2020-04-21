class AntipodeFacade
  attr_reader :search_location, :forecast, :id, :location_name

  def initialize(query)
    @id = nil
    @search_location = GeolocationFacade.new(query)
    @location_name = antipode_name
    @forecast = ForecastService.new(antipode_lat, antipode_long)
  end

  def antipode_name
    result = GeolocationService.reverse_geocode(antipode_lat, antipode_long)

    result[:results][0][:address_components][0][:long_name]
  end

  def antipode_lat
    AntipodeService.get_antipode(@search_location.lat, @search_location.long)[:data][:attributes][:lat]
  end

  def antipode_long
    AntipodeService.get_antipode(@search_location.lat, @search_location.long)[:data][:attributes][:long]
  end
end
