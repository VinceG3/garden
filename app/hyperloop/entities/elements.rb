module ::Entities
  class Elements
    def from_hash(hash)
      new(elements: hash.collect{|a| Element.from_array(a) })
    end
  end
end