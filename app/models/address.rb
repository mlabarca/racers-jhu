class Address
  attr_accessor :city, :state, :location

  def initialize(city, state, location)
    @city = city
    @state = state
    @location = location
  end

  #creates a DB-form of the instance
  def mongoize
    {city: @city, state: @state, loc: @location.mongoize}
  end
  
  #creates an instance of the class from the DB-form of the data
  def self.demongoize(object)
    Address.new(object[:city], object[:state], Point.demongoize(object[:loc])) if object
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
    when Address then object.mongoize
    when Hash then
      Address.new(object[:city], object[:state], Point.mongoize(object[:loc])).mongoize
    else object
    end
  end
  
  #used by criteria to convert object to DB-friendly form
  def self.evolve(object)
    case object
    when Address then object.mongoize
    else object
    end
  end
end