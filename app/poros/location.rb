
class Location
  attr_reader :name, :lat, :long

  def initialize(data)
    @name = data[:results][0][:formatted_address]
    @lat = data[:results][0][:geometry][:location][:lat]
    @long = data[:results][0][:geometry][:location][:lng]
  end
end
