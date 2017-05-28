module ::Entities
  class Topic < Entity
    param :name
    
    def initialize(name = '')
      @name = name
    end
  end
end