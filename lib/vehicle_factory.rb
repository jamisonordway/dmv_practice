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
        model: registration[:model], engine: :ev
      })
    end.flatten!
  end

  def create_ny_vehicles(dmv_data)
    dmv_data.map do |registration|
      if registration[:record_type] == 'VEH'  
        @vehicles << Vehicle.new({
          vin: registration[:vin], 
          year: registration[:model_year].to_i, 
          model: registration[:body_type], engine: engine_type(registration[:fuel_type])
        })
      end
      @vehicles.flatten!
    end
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
end