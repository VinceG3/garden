module ::Entities
  class Context
    attr_reader :topic, :elements, :scratch
    
    def initialize(topic: Topic.new, elements: Elements.new, scratch: Scratch.new)
      @topic = topic
      @elements = elements
      @scratch = scratch
    end

    def self.from_hash(hash)
      hash ||= {}
      elements = Elements.from_array(hash[:elements])
      scratch = Scratch.from_array(hash[:scratch])
      new(
        topic: Topic.new(hash[:topic]),
        elements: elements,
        scratch: scratch
      )
    end

    def self.from_data(data)
      from_hash(data)
    end

    def to_hash
      {
        topic: topic.name,
        elements: elements.to_array,
        scratch: scratch.to_array
      }
    end

    def pass_in(passed_in_elements)
      return self if passed_in_elements.nil?
      collect_into_scratch
      elements = passed_in_elements.collect{|n| Element.new(name: n) }
      elements += (elements.size < 4) ? (4 - elements.size).times.collect{Element.new} : []
      @elements = Elements.new(elements: elements)
      self
    end

    def collect_into_scratch
      new_elements = @scratch.to_array
      new_elements += elements.elements.collect(&:name).reject{|name| name.empty? }
      new_elements += elements.elements.collect{|e| e.sub_elements.collect(&:name)}.flatten.reject{|name| name.empty?}
      @scratch = Scratch.new(new_elements)
    end
  end
end