class AntipodeFacade
  attr_reader :search_location, :location_name, :forecast, :id

  def initialize(query)
    @geo_facade = GeolocationFacade.new(query)
    require "pry"; binding.pry
  end

  def antipode_lat_coordinate
    -(@geo_facade.lat)
  end

  def antipode_long_coordinate
    -(@geo_facade.long)
  end

  def antipode_coords
    @geo_facade.coordinates.reverse_geocode(antipode_lat_coordinate, antipode_long_coordinate)
  end
end
