module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      @validates ||= {}
      @validates[name] = *args
      puts "validate #{@validates}"
    end
  end

  module InstanceMethods
    def validate!
      valid_vars = self.class.instance_variable_get("@validates")
      puts "validate! #{valid_vars}"
      valid_vars.each do |name, args|
        @name_value = instance_variable_get("@#{name}")
        @param = args[1]
        send args[0]
      end
    end
    def valid?
        validate!
        true
    rescue
        false
    end

    def presence
      raise "Недопустимый формат аттрибута: пусто или nil" if @name_value.nil? || @name_value.empty?
    end

    def format
      raise "Недопустимый формат аттрибута: неправильный номер или имя аттрибута" if @name_value !~ @param
    end

    def type
      raise "Типы аттрибута и класса не совпадают" unless @name_value.is_a?(@param)
    end
  end

end
