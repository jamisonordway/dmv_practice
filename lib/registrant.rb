class Registrant
  attr_reader :name, 
              :age, 
              :permit, 
              :license_data
  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end
end