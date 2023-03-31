class VehicleFactory
  attr_reader :vehicles
  
  def initialize
    @vehicles = []
  end

  def create_vehicles(dmv_data)
    dmv_data.map do |registration|
      vehicles << Vehicle.new({
        vin: registration[:vin_1_10], 
        year: registration[:model_year].to_i, 
        model: registration[:model], engine: :ev
      })
    end.flatten!
  end
end