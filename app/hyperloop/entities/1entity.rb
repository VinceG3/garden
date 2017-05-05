require 'forwardable'

module ::Entities
  class Entity
    def self.param(name)
      attr_reader name
      define_method("#{name}=".to_sym) do |value|
        self.instance_variable_set("@#{name}".to_sym, value)
        on_change if respond_to?(:on_change)
      end
    end
  end
end
