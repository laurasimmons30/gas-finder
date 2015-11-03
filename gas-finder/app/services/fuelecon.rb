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
    url = "#{@base_url}/menu/options?year=#{year}&make=#{make}&model=#{model}"
   puts HTTParty.get(url)
  end
end
  
