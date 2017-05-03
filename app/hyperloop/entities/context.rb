module ::Entities
  class Context
    attr_reader :topic, :elements, :scratch
    
    def initialize(topic: Topic.new, elements: Elements.new, scratch: Scratch.new)
      @topic = topic
      @elements = elements
      @scratch = scratch
    end

    def self.from_hash(hash)
      elements = Elements.from_array(hash[:elements])
      scratch = Scratch.from_array(hash[:scratch])
      new(
        topic: Topic.new(hash[:topic]),
        elements: elements,
        scratch: scratch
      )
    end

    def to_hash
      {
        topic: topic.name,
        elements: elements.to_array
      }
    end
  end
end