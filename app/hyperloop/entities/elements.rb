module ::Entities
  class Elements < Entity
    param :elements
    
    def initialize(elements: [Element.new * 4])
      @elements = elements
    end    

    def self.from_array(array)
      array ||= []
      elements = array.collect {|hash| Element.from_hash(hash) }
      elements += (elements.size < 4) ? [Element.new] * (4 - elements.size) : []
      new(elements: elements)
    end

    def all
      elements
    end

    def to_array
      elements.collect(&:to_hash)
    end
  end
end
