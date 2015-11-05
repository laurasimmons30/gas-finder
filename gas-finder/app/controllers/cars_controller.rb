class CarsController < ApplicationController
  def index
  end

  def new
    @car = Car.new
    fuelecon = Fuelecon.new
    year = HTTParty.get(fuelecon.year)
    @years = year["menuItems"]["menuItem"].map { |year|
      year["value"]
    }
  end

  def ajax_make
    fuelecon = Fuelecon.new
    make = HTTParty.get(fuelecon.make(params['year']))
    @makes = make["menuItems"]["menuItem"].map { |make|
      make["value"]
    }

    respond_to do |format|
      format.js { render 'car_makes.js.erb' }
    end
  end

  def ajax_model
    fuelecon = Fuelecon.new
    model = HTTParty.get(fuelecon.model(params['year'],params['make']))
    @models = model["menuItems"]["menuItem"].map { |model|
      model["value"]
    }

    respond_to do |format|
      format.js { render 'car_models.js.erb'}
    end
  end

  def create
    car = Car.where(make: params[:make], model: params[:model], year: params[:year]).first

    if car
      car
    else
      fuelecon = Fuelecon.new
      vehicle_id = fuelecon.get_vehicle_id(params['year'],params['make'],params['model'])
      car_stats = fuelecon.get_mpg_with_id(vehicle_id)
      car = Car.create(
        vehicle_id: vehicle_id, 
        year: params['year'].to_i, 
        make: params["make"], 
        model: params["model"], 
        city_mpg: car_stats[:city_mpg], 
        highway_mgp: car_stats[:highway_mpg], 
        avg_mpg: car_stats[:avg_mpg]
        )
      # "city08U", "highway08U", 
      # now take the params and make the api call
    end
    redirect_to car_path(car.id)

    # so you'd start with the check, y'know>
    #where year,make,model is in the database, grab that entry
    #otherwise use those params to get vehicle_id and make new entry
  end

  def show
    @car = Car.find(params["id"])
  end

  protected
end
