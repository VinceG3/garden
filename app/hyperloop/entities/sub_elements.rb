module ::Entities
  class SubElements < Entity
    include Enumerable
    extend Forwardable
    def_delegators :@sub_elements, :each, :<<
    param :sub_elements
    # delegate :each, to: :sub_elements

    def initialize(sub_element_array = [SubElement.new] * 4)
      @sub_elements = sub_element_array
    end

    def self.from_array(array)
      ses = array.collect {|name| SubElement.new(name: name)}
      ses += (ses.size < 4) ? [SubElement.new] * (4 - ses.size) : []
      new(ses)
    end
  end
end
