module ::Entities
  class Scratch < Entity
    param :sub_elements

    def initialize(sub_element_array = [])
      @sub_elements = sub_element_array << SubElement.new
    end

    def self.from_array(array)
      array ||= ['']
      sub_elements = SubElement.from_array(array)
      new(sub_elements)
    end

    def all
      sub_elements
    end
  end
end