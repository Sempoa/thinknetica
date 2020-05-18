class CargoWagon < Wagon

  def initialize(number, value, type = 'cargo')
    super
    @space_volume = value
    @nonfree_volume = 0
  end

end
