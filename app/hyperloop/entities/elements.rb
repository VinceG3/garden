module ::Entities
  class Elements < Entity
    param :elements
    
    def initialize(elements: [Element.new * 4])
      @elements = elements
    end    

    def self.from_hash(hash)
      elements = hash.collect {|a| Element.from_array(a) }
      elements += (elements.size < 4) ? [Element.new] * (4 - elements.size) : []
      new(elements: elements)
    end

    def all
      elements
    end
  end
end
