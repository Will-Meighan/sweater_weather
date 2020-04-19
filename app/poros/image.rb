class Image
  attr_reader :id, :url

  def initialize(city)
    @id = nil
    @url = UnsplashService.new(city).url
  end

end
