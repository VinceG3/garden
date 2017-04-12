module ::Entities
  class SubElements < Entity
    param :sub_elements

    def initialize(sub_element_array = [SubElement.new] * 4)
      @sub_elements = sub_element_array
    end

    def all
      sub_elements
    end
  end
end
