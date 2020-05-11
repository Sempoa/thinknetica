module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_writer :instances

    def instances
      @instances
    end

  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances += 1
    end

  end

end

module Factory

  attr_reader :factory

  protected

  attr_writer :factory

end