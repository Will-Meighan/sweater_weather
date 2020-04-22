class YelpService

  def initialize(time, food, destination)
    @time = time
    @food = food
    @destination = destination
  end

  def business_info
    info = JSON.parse(response.body, symbolize_names: true)[:businesses][0]
    name = info[:name]
    address = info[:location][:address1]
    [name, address]
  end

  private

    def conn
      Faraday.new('https://api.yelp.com') do |f|
        f.adapter Faraday.default_adapter
        f.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      end
    end

    def response
      conn.get("/v3/businesses/search?term=#{@food}&location=#{@destination.split(',')[0]}&open_at=#{@time}")
    end
end
