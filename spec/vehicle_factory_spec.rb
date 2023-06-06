require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @ny_registrations = DmvDataService.new.ny_registrations
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
      expect(@factory.vehicles[0].vin).to eq('9999236')
      expect(@factory.vehicles[0].year).to eq(1937)
      expect(@factory.vehicles[0].make).to eq('CHRY')
      expect(@factory.vehicles[0].model).to eq('4DSD')
    end
  end


  describe '#engine_type' do 
    it 'can decipher engines' do 
      expect(@factory.engine_type('PROPANE')).to eq(:combustion)
      expect(@factory.engine_type('ELECTRIC')).to eq(:ev)
      expect(@factory.engine_type('AN ACTUAL HORSE')).to eq(:wtf)
    end
  end

  describe '#create_vehicles from new york' do 
    it 'create vehicles from data' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.vehicles).to_not be_empty
      expect(@factory.vehicles[0]).to be_a Vehicle
    end

    it 'vehicle methods can be called on vehicles created' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.vehicles[0].vin).to eq('9999236')
      expect(@factory.vehicles[0].year).to eq(1937)
      expect(@factory.vehicles[0].model).to eq('4DSD')
      expect(@factory.vehicles[0].engine).to eq(:combustion)
      expect(@factory.vehicles[0].antique?).to be true
    end
  end

  describe 'EV registration data' do 
    xit '#most_popular_model' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular_model).to eq('Leaf')
    end

    xit '#most_popular_make' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular_make).to eq('TESLA')
    end
    
    xit '#count_by_model_year for washington' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.count_by_model_year(2012)).to eq(31)
    end

    xit '#count_by_model_year for new york' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.count_by_model_year(1968)).to eq(4)
    end

    xit '#most_registered_county for washington' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.most_registered_county(@wa_ev_registrations)).to eq('King')
    end

    xit '#most_registered_county for new york' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.most_registered_county(@ny_registrations)).to eq('OUT-OF-STATE')
    end
  end
end