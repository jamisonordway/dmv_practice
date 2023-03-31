require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    @factory = FacilityFactory.new
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@factory).to be_a FacilityFactory
    end

    it 'begins without oregon facilities' do 
      expect(@factory.or_facilities).to eq( [])
    end
  end

  describe '#create_or_facilities' do 
    it 'create facilities from data' do 
      @factory.create_or_facilities(@oregon_facilities)
      expect(@factory.or_facilities).to_not be_empty
      expect(@factory.or_facilities[0]).to be_a Facility
    end

    it 'facilities instantiate with attributes' do 
      @factory.create_or_facilities(@oregon_facilities)
      expect(@factory.or_facilities[0].name).to eq('Albany DMV Office')
      expect(@factory.or_facilities[0].address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@factory.or_facilities[0].phone).to eq('541-967-2014')
    end
  end
end