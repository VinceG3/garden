module ::Entities
  class Elements < Entity
    param :elements
    
    def initialize(elements: 4.times.collect{Element.new})
      @elements = elements
    end    

    def self.from_array(array)
      array ||= []
      elements = array.collect {|hash| Element.from_hash(hash) }
      elements += (elements.size < 4) ? (4 - elements.size).times.collect{Element.new} : []
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
