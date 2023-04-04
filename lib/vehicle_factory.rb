class VehicleFactory
  attr_reader :vehicles
  
  def initialize
    @vehicles = []
  end

  def create_wa_vehicles(dmv_data)
    dmv_data.map do |registration|
      vehicles << Vehicle.new({
        vin: registration[:vin_1_10], 
        year: registration[:model_year].to_i, 
        make: registration[:make],
        model: registration[:model], 
        engine: :ev
      })
    end.flatten!
  end
  
  #helpers 
  
  def engine_type(engine_type)
    if engine_type == 'GAS' || engine_type == 'DIESEL' || engine_type == 'PROPANE' || engine_type == 'FLEX'
      :combustion
    elsif engine_type == 'ELECTRIC'
      :ev
    else
      :wtf
    end
  end
  
  #iteration 4
  
  def create_ny_vehicles(dmv_data)
    dmv_data.map do |registration|
      if registration[:record_type] == 'VEH'  
        @vehicles << Vehicle.new({
          vin: registration[:vin], 
          year: registration[:model_year].to_i, 
          make: registration[:make],
          model: registration[:body_type], 
          engine: engine_type(registration[:fuel_type])
        })
      end
      @vehicles.flatten!
    end
  end
  
  def most_popular_model
    model_vehicles = @vehicles.sort_by(&:model)
    count_by_model = Hash.new(0)
    model_vehicles.map do |vehicle|
      count_by_model[vehicle.model] += 1 
    end
    most_pop_model = count_by_model.max_by{|model, amount| amount}.first
    most_pop_model
  end

  def most_popular_make
    make_vehicles = @vehicles.sort_by{|vehicle| vehicle.make}
    count_by_make = Hash.new(0)
    make_vehicles.map do |vehicle|
      count_by_make[vehicle.make] += 1 
    end
    most_pop_make = count_by_make.max_by{|make, amount| amount}.first
    "#{most_pop_make}"
  end

  def most_popular_model
    model_vehicles = @vehicles.sort_by(&:model)
    count_by_model = Hash.new(0)
    model_vehicles.map do |vehicle|
      count_by_model[vehicle.model] += 1 
    end
    most_pop_model = count_by_model.max_by{|model, amount| amount}.first
    most_pop_model
  end

  def most_popular_make
    make_vehicles = @vehicles.sort_by{|vehicle| vehicle.make}
    count_by_make = Hash.new(0)
    make_vehicles.map do |vehicle|
      count_by_make[vehicle.make] += 1 
    end
    most_pop_make = count_by_make.max_by{|make, amount| amount}.first
    "#{most_pop_make}"
  end
end