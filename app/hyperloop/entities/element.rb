module ::Entities
  class Element < Entity
    param :name
    param :sub_elements

    def initialize(name: '', sub_elements: SubElements.new)
      @name = name
      @sub_elements = sub_elements
    end

    def self.from_array(array = ['', []])
      new(
        name: array[0],
        sub_elements: SubElements.from_array(array[1])
      )
    end
  end
end
