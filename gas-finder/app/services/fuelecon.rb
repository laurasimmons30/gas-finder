class Fuelecon
  attr_reader :base_url
  require 'open-uri'

  def initialize
    @base_url = 'http://www.fueleconomy.gov/ws/rest/vehicle'
  end

  def year
    "#{@base_url}/menu/year"
  end

  def make(year)
    "#{@base_url}/menu/make?year=#{year}"
  end

  def model(year,make)
    "#{@base_url}/menu/model?year=#{year}&make=#{make}"
  end

  def get_vehicle_id(year,make,model)
    model = model.gsub(' ', '%20')
    make = make.gsub(' ', '%20')
    url = "#{@base_url}/menu/options?year=#{year}&make=#{make}&model=#{model}"
    HTTParty.get(url)['menuItems']['menuItem'].first['value']
  end

  def get_mpg_with_id(vehicle_id)
    vehicle_hash = HTTParty.get("#{@base_url}/#{vehicle_id}")['vehicle']
    city_mpg = vehicle_hash["city08"].to_f
    highway_mpg = vehicle_hash["highway08"].to_f
    avg_mpg = (city_mpg + highway_mpg) / 2

    mpg_hash = {city_mpg: city_mpg, highway_mpg: highway_mpg, avg_mpg: avg_mpg}
  end
end
  
