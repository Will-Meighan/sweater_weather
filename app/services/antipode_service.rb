class AntipodeService

  def antipode(location)
    json = get_json(request_antipode(location))
    json[:data][:attributes]
  end

  def request_antipode(location)
    conn.get("antipodes") do |req|
      req.params[:lat] = location.latitude
      req.params[:long] = location.longitude
    end
  end

  private

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers[:api_key] = ENV['WILL_API']
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
