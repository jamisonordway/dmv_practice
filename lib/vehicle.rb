require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine, 
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def change_registration_date 
    @registration_date = Date.today
  end

  def change_plate_type(plate_type)
    @plate_type = plate_type
  end
end
