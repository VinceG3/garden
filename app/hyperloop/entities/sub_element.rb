module ::Entities
  class SubElement < Entity
    param :name
    
    def initialize(name: '')
      @name = name
    end
  end
end