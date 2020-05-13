require_relative 'factory'
require_relative 'instance_counter'

class Wagon

  include Factory
  include InstanceCounter

  attr_accessor :type, :number

  def initialize(number, type)
    @number = number
    @type = type
    register_instance
  end

end
