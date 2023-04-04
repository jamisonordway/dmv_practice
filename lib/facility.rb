class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees, 
              :daily_hours, 
              :holidays

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @daily_hours = facility_details[:daily_hours]
    @holidays = facility_details[:holidays]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if can_perform?('Vehicle Registration')
      if vehicle.antique? 
        @collected_fees += 25 
        vehicle.change_plate_type(:antique)
      elsif vehicle.electric_vehicle? 
        @collected_fees += 200 
        vehicle.change_plate_type(:ev)
      else
        @collected_fees += 100 
        vehicle.change_plate_type(:regular)
      end
      vehicle.change_registration_date
      @registered_vehicles << vehicle 
    end
  end

  def administer_written_test(registrant)
    if can_perform?('Written Test') 
      registrant.age >= 16 && registrant.permit? ? registrant.license_data[:written] = true : false
    else
      false
    end
  end
  
  def administer_road_test(registrant)
    if can_perform?('Road Test') 
      registrant.license_data[:written] == true ? registrant.license_data[:license] = true : false
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if can_perform?('Renew License') 
      registrant.license_data[:license] ? registrant.license_data[:renewed] = true : false
    else
      false
    end
  end

  #helpers
  def can_perform?(service)
    @services.include?(service)
  end
end

#Facilities:
#Add in a few more helpful attributes.
#What are the daily hours for each facility?
#For the states that provide (Missouri), which holidays are they closed?


