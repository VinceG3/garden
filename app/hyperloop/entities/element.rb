module ::Entities
  class Element < Entity
    param :name
    param :sub_elements

    def initialize(name: '', sub_elements: 4.times.collect{SubElement.new})
      @name = name
      @sub_elements = sub_elements
    end

    def self.from_array(array = ['', []])
      new(
        name: array[0],
        sub_elements: SubElement.from_array(array[1])
      )
    end

    def to_hash
      {
        name: name,
        sub_elements: sub_elements.collect(&:name)
      }
    end
  end
end
