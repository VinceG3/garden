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

    def self.from_hash(hash = {})
      new(
        name: hash['name'],
        sub_elements: SubElement.from_array(hash['sub_elements'])
      )
    end

    def to_hash
      {
        name: name,
        sub_elements: sub_elements.collect(&:name)
      }
    end

    def add_sub_element(name)
      find_first_empty_sub_element.name = name
      ContextStore.refresh
    end

    def find_first_empty_sub_element
      sub_elements.find {|se| se.name == '' }
    end

    def remove_sub_element(name)
      sub_elements.find_all {|se| se.name == name }
                  .each {|se| se.name = '' }
    end
  end
end
