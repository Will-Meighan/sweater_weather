class GeolocationFacade
  attr_reader :id, :coordinates

  def initialize(location)
    @id = nil
    @coordinates = GeolocationService.new(location)
  end

  def name
    @coordinates.location.name
  end

end
