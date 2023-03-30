require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@registrant_1).to be_a Registrant
      expect(@registrant_2).to be_a Registrant
    end

    it 'has attributes' do 
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_1.license_data).to eq({
        :written=>false, 
        :license=>false, 
        :renewed=>false
      })
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit).to eq(false)
      expect(@registrant_2.license_data).to eq({
        :written=>false, 
        :license=>false, 
        :renewed=>false
      })
    end
  end

  describe '#permit?' do 
    it 'can check permit truthy' do 
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  
end