class PassengerTrain < Train

  def initialize(number, type = 'passenger')
    super
  end
  
  def add_wag(wagon)
    super(wagon) if wagon.class == PassWagon
  end

end
