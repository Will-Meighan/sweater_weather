class BackgroundService
  def initialize(city)
    @city = city
  end

  def url
    response = get
    JSON.parse(response.body, symbolize_names: true)[:results][0][:urls][:raw]
  end

  def conn
    just_city = @city.split(',').first
    Faraday.new("https://api.unsplash.com/search/photos?query=#{just_city}&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}")
  end

  def get
    conn.get
  end

end
