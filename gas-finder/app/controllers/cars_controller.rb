class CarsController < ApplicationController
  def index
  end

  def new
    @car = Car.new
    @fuelecon = Fuelecon.new
    year = HTTParty.get(@fuelecon.year)
    @years = year["menuItems"]["menuItem"].map { |year|
      year["value"]
    }
  end

  def ajax_make
    binding.pry
  end

  def create
  end

  protected
end
