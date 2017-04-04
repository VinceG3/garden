require 'forwardable'

module ::Entities
  class Entity
    def self.param(name)
      attr_reader name
      define_method("#{name}=".to_sym) do |value|
        puts 'mutating!'
        instance_variable_set("@#{name}".to_sym, value)
      end
    end
  end
end