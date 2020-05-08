class Interface

  protected

  attr_accessor :trains, :stations, :routes, :wagons

  public

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @wagons=[]
  end

#-------------------------------------------------------------------------------interface
  def run
    loop do
      puts 'Добро пожаловать в пользовательский интерфейс. Чтобы выбрать следующее действие, пожалуйста, введите номер действия и нажмите кнопку Enter'
      puts '1. Создать объект'
      puts '2. Выбрать объект и изменить объект'
      puts '3. Получить информацию об объекте'
      puts '0. Выйти из интерфейса'
      user = gets.to_i
      case user
      when 1
        create
      when 2
        change_information
      when 3
        information_object
      when 0
        break
      end
    end
  end

  private  #если я правильно понимаю, то эти методы используются только в этом классе и их вызов осуществляется через run, а значит, в публичном доступе они не нужны

  def create
    puts 'Меню создания объекта'
    puts '1. Создать станцию'
    puts '2. Создать пассажирский поезд'
    puts '3. Создать грузовой поезд'
    puts '4. Создать маршрут'
    puts '0. Вернуться в предыдущее меню'
    user = gets.to_i
    case user
    when 1
      create_station
    when 2
      create_train_pass
    when 3
      create_train_cargo
    when 4
      create_route
    when 0
      return
    end
  end

  def information_object
    puts '1. Список всех станций'
    puts '2. Список всех поездов на станции'
    puts '0. Вернуться в предыдущее меню'
    user = gets.to_i
    case user
    when 1
      stations_list
    when 2
      station_trains_list
    when 0
      return
    end
  end

  def change_information
    puts '1. Добавить станцию к маршруту'
    puts '2. Удалить станцию из маршрута'
    puts '3. Назначить маршрут поезду'
    puts '4. Прицепить вагон к поезду'
    puts '5. Отцепить вагон от поезда'
    puts '6. Переместить поезд'
    puts '0. Вернуться в предыдущее меню'
    user = gets.to_i
    case user
    when 1
      add_route_station
    when 2
      delete_route_station
    when 3
      route_assigment
    when 4
      add_wagon
    when 5
      delete_wagon 
    when 6
      move_train
    when 0
      return
    end
  end
#----------------------------------------------------------------------------------------------------------creation
  def create_station
    puts 'Введите название станции'
    name = gets.to_s
    station = Station.new(name)
    self.stations << station
    puts "Создана станция #{station}"
  end

  def create_train_pass
    puts 'Введите номер поезда'
    number = gets
    train = PassengerTrain.new(number)
    self.trains << train
    puts "Создан пассажирский поезд номер #{number}"
  end

  def create_train_cargo
    puts 'Введите номер поезда'
    number = gets
    train = CargoTrain.new(number)
    self.trains << train
    puts "Создан грузовой поезд номер #{number}"
  end

  def create_route
    if self.stations.empty?
      puts 'Нет доступных станций'
      return
    end
    puts 'Выберите начальную станцию маршрута'
    first_station = choose_station
    puts 'Выберите конечную станцию маршрута'
    last_station = choose_station
    route = Route.new(first_station, last_station)
    self.routes << route
    puts "Создан новый маршрут от станции #{first_station.name} до станции #{last_station.name}"
  end
#---------------------------------------------------------------------------------------------------------list
  def station_trains_list
    if self.stations.empty?
      puts 'Нет доступных станций'
      return
    end
    puts 'Выберите станцию'
    station = choose_station
    if station.trains.empty?
      puts 'Нет доступных поездов на станции'
      return
    end
    station.trains.each do |train|
      puts "Поезд номер #{train.number} типа #{train.type} с количеством вагонов #{train.wagons.length}"
    end
  end 
  
  def stations_list
    if self.stations.empty?
      puts 'Нет доступных станций'
      return
    end
    self.stations.each { |station| puts station.name }
  end
 #--------------------------------------------------------------------------------------------------------choosing
  def choose_station
     iterator(self.stations)
  end

  def choose_route
    iterator(self.routes)
  end
  
  def choose_train
    iterator(self.trains)
  end
#---------------------------------------------------------------------------------------------------------add-delete
  def add_route_station
    if self.routes.empty?
      puts 'Нет доступного маршрута'
      return
    end
    puts 'Выберите маршрут'
    route = choose_route
    puts 'Выберите станцию для добавления к маршруту'
    station = choose_station
    route.add_station(station)
  end

  def delete_route_station
    if self.routes.empty?
      puts 'Нет доступного маршрута'
      return
    end
    puts 'Выберите маршрут для изменения'
    route = choose_route
    puts 'Выберите станцию для удаления'
    station = iterator(route.stations)
    route.del_station(station)
  end

  def add_wagon
    if self.trains.empty?
      puts 'Нет доступных поездов'
      return
    end
    puts 'Выберите поезд'
    train = choose_train
    if train.class == PassengerTrain
      puts "Введите номер вагона"
      num = gets
      wagon = PassWagon.new(num)
    else
      puts "Введите номер вагона"
      num = gets
      wagon = CargoWagon.new(num)
    end
    train.add_wag(wagon)
  end

  def delete_wagon
    if self.trains.empty?
      puts 'Нет доступных поездов'
      return
    end
    puts 'Выберите поезд'
    train = choose_train
    puts 'Выберите вагон, который хотите отцепить'
    wagon = iterator(train.wagons)
    train.del_wag(wagon)
  end
#-------------------------------------------------------------------------------------assigment
  def route_assigment
    if self.trains.empty? || self.routes.empty?
      puts 'Нет доступных поездов или маршрутов'
      return
    end
    puts 'Выберите поезд'
    train = choose_train
    puts 'Выберите желаемый маршрут'
    route = choose_route
    train.route = route
  end
#--------------------------------------------------------------------------------------move
  def move_train
    if self.trains.empty?
      puts 'Нет доступных поездов'
      return
    end
    puts 'Выберите поезд'
    train = choose_train
    puts '1. Переместить поезд на станцию вперед'
    puts '2. Переместить поезд на станцию назад'
    puts '0. Вернуться в предыдущее меню'
    user = gets.to_i
    case user
    when 1
      train.move_next
    when 2
      train.move_prev
    when 0
      return
    end
  end

#-------------------------------------------------------------------------------iterator
  def iterator(arr)
    arr.each.with_index(1) do |value, index|
      puts "#{index}: #{value.to_s}"
    end
    arr[gets.to_i - 1]
  end

end