class PassengerTrain < Train

  def initialize(number, type = 'passenger')
    super(number, type)
  end

  def add_wag(wagon)
    if wagon.type == @type
      if @speed == 0
        @wagons << wagon
        puts "Вагон #{wagon} прицеплен"
      end
    end
  end

end
