require 'spec_helper'

RSpec.describe DmvDataService do
  before(:each) do
    @dds = DmvDataService.new
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService)
    end
  end

  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://data.oregon.gov/resource/rj4w-f4jc.json'
      data_response = @dds.load_data(source)
      expect(data_response).to be_an_instance_of(Array)
      expect(data_response.size).to eq(59)
    end
  end

  describe '#wa_ev_registrations' do
    it 'can load washington ev registration data' do
      expect(@dds.wa_ev_registrations.size).to eq(1000)
    end
  end

  describe '#or_dmv_office_locations' do
    it 'can load oregon dmv office locations' do
      expect(@dds.or_dmv_office_locations.size).to eq(59)
    end
  end

  describe '#ny_dmv_office_locations' do
    it 'can load new york dmv office locations' do
      expect(@dds.ny_dmv_office_locations.size).to eq(169)
    end
  end

  describe '#mo_dmv_office_locations' do
    it 'can load missouri dmv office locations' do
      expect(@dds.mo_dmv_office_locations.size).to eq(178)
    end
  end
end
