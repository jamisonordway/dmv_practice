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

    it 'begins without facilities' do 
      expect(@factory.facilities).to eq( [])
    end
  end
end