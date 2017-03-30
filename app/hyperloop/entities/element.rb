module ::Entities
  class Element
    def from_array(array)
      new(
        name: array[0],
        subelements: SubElements.from_array(array[1])
      )
      @name = array[0]
      @subelements = 
    end
  end
end
