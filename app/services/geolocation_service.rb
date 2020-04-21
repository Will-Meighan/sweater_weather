class GeolocationService
  attr_reader :location

  def initialize(location)
    data = get_json("maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
    @location = Location.new(data)
  end

  def reverse_geocode(lat, long)
    get_json("maps/api/geocode/json?latlng=#{lat},#{long}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  private

    def get_json(url)
      response = conn.post(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://maps.googleapis.com")
    end
end
