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

  end
end