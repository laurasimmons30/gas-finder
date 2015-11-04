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
    @fuelecon = Fuelecon.new
    make = HTTParty.get(@fuelecon.make(params['year']))
    @makes = make["menuItems"]["menuItem"].map { |make|
      make["value"]
    }

    respond_to do |format|
      format.js { render 'car_makes.js.erb' }
    end
  end

  def create
  end

  protected
end
