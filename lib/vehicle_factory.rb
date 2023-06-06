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