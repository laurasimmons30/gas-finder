class CarsController < ApplicationController
  def index
  end

  def new
    @car = Car.new
    @fuelecon = Fuelecon.new
    @year = HTTParty.get(@fuelecon.year)
    @make = HTTParty.get(@fuelecon.make(@year))
    @model = HTTParty.get(@fuelecon.model(@year,@make))

  end

  def create
  end

  protected
end
