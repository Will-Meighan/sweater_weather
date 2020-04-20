class GeolocationFacade
  attr_reader :id, :coordinates

  def initialize(location)
    @id = nil
    @coordinates = GeolocationService.new(location)
  end

  def name
    @coordinates.location.name
  end

  def lat
    @coordinates.location.lat
  end

  def long
    @coordinates.location.long
  end

end
