require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @ny_registrations = DmvDataService.new.ny_registrations
  end

  describe '#initialize' do 
    xit 'exists' do
      expect(@factory).to be_a VehicleFactory
    end

    xit 'starts with no vehicles' do 
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do 
    xit 'create vehicles from data' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.vehicles).to_not be_empty
      expect(@factory.vehicles[0]).to be_a Vehicle
    end
  end

  describe '#engine_type' do 
    xit 'can decipher engines' do 
      expect(@factory.engine_type('PROPANE')).to eq(:combustion)
      expect(@factory.engine_type('ELECTRIC')).to eq(:ev)
      expect(@factory.engine_type('AN ACTUAL HORSE')).to eq(:wtf)
    end
  end

  describe '#create_vehicles from new york' do 
    xit 'create vehicles from data' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.vehicles).to_not be_empty
      expect(@factory.vehicles[0]).to be_a Vehicle
    end

    xit 'vehicle methods can be called on vehicles created' do 
      @factory.create_ny_vehicles(@ny_registrations)
      expect(@factory.vehicles[0].vin).to eq('9999236')
      expect(@factory.vehicles[0].year).to eq(1937)
      expect(@factory.vehicles[0].model).to eq('4DSD')
      expect(@factory.vehicles[0].engine).to eq(:combustion)
      expect(@factory.vehicles[0].antique?).to be true
    end
  end

  describe 'EV registration data' do 
    it '#most_popular_model' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular_model).to eq('Leaf')
    end

    it '#most_popular_make' do 
      @factory.create_wa_vehicles(@wa_ev_registrations)
      require 'pry'; binding.pry
      expect(@factory.most_popular_make).to eq('nil')
    end
  end
end