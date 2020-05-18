class PassWagon < Wagon

  def initialize(number, value, type = 'passenger')
    super
    @free_seats = value
    @occupied_seats = 0
  end

end
