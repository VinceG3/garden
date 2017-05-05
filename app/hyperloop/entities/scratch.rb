module ::Entities
  class Scratch < Entity
    param :sub_elements

    def initialize(array)
      array ||= []
      ses = array.collect do |name|
        SubElement.new(name: name, on_change: method(:on_change).to_proc)
      end
      ses << SubElement.new(on_change: method(:on_change).to_proc)
      @sub_elements = ses
    end

    def self.from_array(array)
      new(array)
    end

    def on_change
      if @sub_elements.last.name != ''
        @sub_elements << SubElement.new(on_change: method(:on_change).to_proc)
        ContextStore.refresh
      end
    end

    def all
      sub_elements
    end

    def to_array
      sub_elements.collect(&:name)
    end
  end
end