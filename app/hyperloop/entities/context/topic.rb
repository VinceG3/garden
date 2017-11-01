module ::Entities
  class Topic < Entity
    param :name
    
    def initialize(name = '')
      @name = name
        .tr('-', ' ')
        .split(/ |\_/)
        .map(&:capitalize)
        .join(' ')
    end
  end
end