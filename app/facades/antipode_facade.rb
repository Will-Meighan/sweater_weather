class AntipodeFacade
  attr_reader :geo_facade, :location_name, :forecast, :forecast, :antipode_city

  def initialize(query)
    @geo_facade = GeolocationFacade.new(query)
    @location_name = antipode_name
    @forecast = ForecastService.new(@location_name)
  end

  def antipode_name
    result = GeolocationService.reverse_geocode(antipode_lat, antipode_long)

    result[:results][0][:address_components][0][:long_name]
  end

  def antipode_lat
    AntipodeService.get_antipode(@geo_facade.lat, @geo_facade.long)[:data][:attributes][:lat]
  end

  def antipode_long
    AntipodeService.get_antipode(@geo_facade.lat, @geo_facade.long)[:data][:attributes][:long]
  end
end
