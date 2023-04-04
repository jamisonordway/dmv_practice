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
      expect(@factory.or_facilities[0].daily_hours).to eq(nil)
      expect(@factory.or_facilities[0].holidays).to eq(nil)
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
      expect(@factory.ny_facilities[1].name).to eq('JAMAICA VEHICLE SAFETY')
      expect(@factory.ny_facilities[1].address).to eq('92-11 179TH PLACE JAMAICA NY 11433')
      expect(@factory.ny_facilities[1].phone).to eq('7185268546')
      expect(@factory.ny_facilities[1].daily_hours).to eq({
        :monday=>"8:45AM - 4:00PM", 
        :tuesday=>"8:45AM - 4:00PM", 
        :wednesday=>"8:45AM - 4:00PM",
        :thursday=>"8:45AM - 4:00PM", 
        :friday=>"8:45AM - 4:00PM"
      })
      expect(@factory.ny_facilities[1].holidays).to eq(nil)
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
      expect(@factory.mo_facilities[0].daily_hours).to eq('Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00')
      expect(@factory.mo_facilities[0].holidays).to eq("Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), 
      New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), 
      Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), 
      Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
    end
  end
end