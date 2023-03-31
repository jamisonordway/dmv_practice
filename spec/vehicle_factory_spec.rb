require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
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
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.vehicles).to have_at_least(1).things
      expect(@factory.vehicles[0]).to be_a Vehicle
    end
  end
end