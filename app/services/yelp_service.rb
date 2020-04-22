class YelpService

  def initialize(time, food, destination)
    @time = time
    @food = food
    @destination = destination
  end

  private

    def conn
      Faraday.new('https://api.yelp.com') do |f|
        f.adapter Faraday.default_adapter
        f.headers['Authorization'] = ENV['YELP_KEY']
      end
    end

    def response
      conn.get("/v3/businesses/search?term=#{@food}&location=#{@destination.split(',')[0]}&open_at=#{@time}")
    end
end
