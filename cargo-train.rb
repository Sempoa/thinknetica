class CargoTrain < Train

  def initialize(number, type = 'cargo')
    super
  end
  
  def add_wag(wagon)
    super(wagon) if wagon.class == CargoWagon
  end

end
