module Accessor

  def attr_accessor_with_history (*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_history = "@#{name}_history".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym ) do
        instance_variable_get(var_history)
      end

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        history = instance_variable_get(var_history) || []
        instance_variable_set(var_history, history << value)
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class == type
        instance_variable_set(var_name, value)
      else
        raise "Тип переменной не совпадает с классом"
      end
    end
  end

end

=begin
class Test

  extend Accessor

  attr_accessor_with_history :r, :d, :n

end
=end
