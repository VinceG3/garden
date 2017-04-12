require 'forwardable'

module ::Entities
  class Entity
    def self.param(name)
      attr_reader name
      define_method("#{name}=".to_sym) do |value|
        self.instance_variable_set("@#{name}".to_sym, value)
      end
    end
  end
end
