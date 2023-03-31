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

    it 'begins without facilities of any type' do 
      expect(@factory.or_facilities).to eq([])
      expect(@factory.ny_facilities).to eq([])
      expect(@factory.mo_facilities).to eq([])
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

  describe '#create_ny_facilities' do 
    it 'create facilities from data' do 
      @factory.create_ny_facilities(@new_york_facilities)
      expect(@factory.ny_facilities).to_not be_empty
      expect(@factory.ny_facilities[0]).to be_a Facility
    end

    it 'facilities instantiate with attributes' do 
      @factory.create_ny_facilities(@new_york_facilities)
      expect(@factory.ny_facilities[1].name).to eq('JAMESTOWN')
      expect(@factory.ny_facilities[1].address).to eq('512 WEST 3RD STREET JAMESTOWN NY 14701')
      expect(@factory.ny_facilities[1].phone).to eq('7166618220')
    end
  end
  
  describe '#create_mo_facilities' do 
    it 'create facilities from data' do 
      @factory.create_mo_facilities(@missouri_facilities)
      expect(@factory.mo_facilities).to_not be_empty
      expect(@factory.mo_facilities[0]).to be_a Facility
    end

    it 'facilities instantiate with attributes' do 
      @factory.create_mo_facilities(@missouri_facilities)
      expect(@factory.mo_facilities[0].name).to eq('OAKVILLE')
      expect(@factory.mo_facilities[0].address).to eq('3164 TELEGRAPH ROAD ST LOUIS MO 63125')
      expect(@factory.mo_facilities[0].phone).to eq('(314) 887-1050')
    end
  end
end