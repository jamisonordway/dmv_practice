require 'faraday'
require 'json'

class DmvDataService

  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
  end

  def ny_registrations
    @ny_registrations ||= load_data('https://data.ny.gov/resource/w4pv-hbkt.json')
  end

  def or_dmv_office_locations
    @or_dmv_office_locations ||= load_data('https://data.oregon.gov/resource/rj4w-f4jc.json')
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
  end
end
