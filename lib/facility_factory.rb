class FacilityFactory
  attr_reader :or_facilities,
              :ny_facilities,
              :mo_facilities
  
  def initialize
    @or_facilities = []
    @ny_facilities = []
    @mo_facilities = []
  end

  def create_or_facilities(dmv_data)
    dmv_data.map do |facility|
      address_info = eval(facility[:location_1][:human_address])
      @or_facilities << Facility.new({
        name: facility[:title], 
        address: address_info.values.join(' '), 
        phone: facility[:phone_number] 
      })
    end
  end

  def create_ny_facilities(dmv_data)
    dmv_data.map do |facility|
      address = [facility[:street_address_line_1], facility[:city], facility[:state], facility[:zip_code]]
      @ny_facilities << Facility.new({
        name: facility[:office_name], 
        address: address.join(' '), 
        phone: facility[:public_phone_number] 
      })
    end
  end

  def create_mo_facilities(dmv_data)
    dmv_data.map do |facility|
      address = [facility[:address1], facility[:city], facility[:state], facility[:zipcode]]
      @mo_facilities << Facility.new({
        name: facility[:name], 
        address: address.join(' '), 
        phone: facility[:phone] 
      })
    end
  end
end