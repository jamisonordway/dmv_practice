require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    dmv_service = DmvDataService.new
    @wa_ev_registrations = dmv_service.wa_ev_registrations
    @ny_registrations = dmv_service.ny_registrations
  end

  describe '#initialize' do 
    it 'exists' do
      expect(@factory).to be_a VehicleFactory
    end

    it 'starts with no vehicles' do 
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do 
    it 'create vehicles from data' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      
      expect(@factory.vehicles).to_not be_empty
      expect(@factory.vehicles[0]).to be_a Vehicle
    end
    
    it 'washington vehicles have attributes' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)

      expect(@factory.vehicles[0].vin).to eq('WMEEJ9AA7E')
      expect(@factory.vehicles[0].year).to eq(2014)
      expect(@factory.vehicles[0].make).to eq('SMART')
      expect(@factory.vehicles[0].model).to eq('Fortwo Electric Drive')
    end

    it 'New York vehicles have attributes' do 
      @factory.create_ny_vehicles(@ny_registrations)
      
      expect(@factory.vehicles[0].vin).to eq('999999999999')
      expect(@factory.vehicles[0].year).to eq('1975')
      expect(@factory.vehicles[0].make).to eq('STARC')
      expect(@factory.vehicles[0].model).to eq('N/A')
    end
  end


  describe '#engine_type' do 
    it 'can decipher engines' do 
      expect(@factory.engine_type('PROPANE')).to eq(:combustion)
      expect(@factory.engine_type('ELECTRIC')).to eq(:ev)
      expect(@factory.engine_type('AN ACTUAL HORSE')).to eq(:wtf)
    end
  end

  def wa_ev_reg_test_data
    [{:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KAT1234KAT",
      :dol_vehicle_id=>"197458138",
      :model_year=>"2022",
      :make=>"TESLA",
      :model=>"Model Y",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"0",
      :odometer_code=>"Odometer reading is not collected at time of renewal",
      :new_or_used_vehicle=>"New",
      :sale_price=>"0",
      :base_msrp=>"0",
      :transaction_type=>"Original Registration",
      :transaction_date=>"2022-05-04T00:00:00.000",
      :transaction_year=>"2022",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
      :electric_vehicle_fee_paid=>"No",
      :transportation_electrification_fee_paid=>"No",
      :hybrid_vehicle_electrification_fee_paid=>"No",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KNDCC3LG2N",
      :dol_vehicle_id=>"177586440",
      :model_year=>"2022",
      :make=>"KIA",
      :model=>"Niro",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"20",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"New",
      :sale_price=>"45419",
      :date_of_vehicle_sale=>"2021-08-23T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Original Title",
      :transaction_date=>"2021-09-15T00:00:00.000",
      :transaction_year=>"2021",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>true,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Meets purchase date requirement",
      :_2019_hb_2042_sale_price_value_requirement=>"Sale price too high",
      :electric_vehicle_fee_paid=>"Not Applicable",
      :transportation_electrification_fee_paid=>"Not Applicable",
      :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KNDCC3LG2N",
      :dol_vehicle_id=>"177586440",
      :model_year=>"2022",
      :make=>"KIA",
      :model=>"Niro",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"0",
      :odometer_code=>"Odometer reading is not collected at time of renewal",
      :new_or_used_vehicle=>"New",
      :sale_price=>"0",
      :base_msrp=>"0",
      :transaction_type=>"Original Registration",
      :transaction_date=>"2021-09-15T00:00:00.000",
      :transaction_year=>"2021",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
      :electric_vehicle_fee_paid=>"No",
      :transportation_electrification_fee_paid=>"No",
      :hybrid_vehicle_electrification_fee_paid=>"No",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
      :vin_1_10=>"1G1RD6E43E",
      :dol_vehicle_id=>"205937539",
      :model_year=>"2014",
      :make=>"CHEVROLET",
      :model=>"Volt",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"38",
      :odometer_reading=>"62742",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"Used",
      :sale_price=>"0",
      :date_of_vehicle_sale=>"2019-04-09T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Original Title",
      :transaction_date=>"2022-06-10T00:00:00.000",
      :transaction_year=>"2022",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>true,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"Meets battery range requirement",
      :_2019_hb_2042_purchase_date_requirement=>"Sale before August 2019",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale",
      :electric_vehicle_fee_paid=>"Not Applicable",
      :transportation_electrification_fee_paid=>"Not Applicable",
      :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"}]
  end

  def ny_vehicles_test_data
    [{
      :record_type=>"BOAT",
      :vin=>"999999999999",
      :registration_class=>"BOT",
      :city=>"HILTON",
      :state=>"NY",
      :zip=>"14468",
      :county=>"MONROE",
      :model_year=>"1975",
      :make=>"STARC",
      :body_type=>"BOAT",
      :fuel_type=>"GAS",
      :reg_valid_date=>"2022-08-24T00:00:00.000",
      :reg_expiration_date=>"2025-07-31T00:00:00.000",
      :scofflaw_indicator=>"N",
      :suspension_indicator=>"N",
      :revocation_indicator=>"N"},
      {:record_type=>"VEH",
      :vin=>"9999236",
      :registration_class=>"HIS",
      :city=>"ROSLYN",
      :state=>"NY",
      :zip=>"11576",
      :county=>"NASSAU",
      :model_year=>"1937",
      :make=>"CHRY",
      :body_type=>"4DSD",
      :fuel_type=>"GAS",
      :unladen_weight=>"6300",
      :reg_valid_date=>"2023-05-09T00:00:00.000",
      :reg_expiration_date=>"2024-06-23T00:00:00.000",
      :color=>"BK",
      :scofflaw_indicator=>"N",
      :suspension_indicator=>"N",
      :revocation_indicator=>"N"}]
  end
end