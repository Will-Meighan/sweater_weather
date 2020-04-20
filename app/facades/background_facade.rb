class BackgroundFacade
  attr_reader :id, :url

  def initialize(city)
    @id = nil
    @url = BackgroundService.new(city).url
  end

end
