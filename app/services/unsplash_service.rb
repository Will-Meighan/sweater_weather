class UnsplashService
  def initialize(city)
    @city = city
  end

  def url
    JSON.parse(response.body, symbolize_names: true)[:results][0][:urls][:raw]
  end

  def conn
    Faraday.new('https://api.unsplash.com/')
  end

  def response
    just_city = @city.split(',').first
    conn.get("search/photos?query=#{just_city}&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}")
  end



end
