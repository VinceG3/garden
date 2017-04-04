module ::Entities
  class Context
    attr_reader :topic, :elements
    
    def initialize(topic: Topic.new, elements: Elements.new)
      @topic = topic
      @elements = elements
    end

    def self.from_hash(hash)
      elements = Elements.from_hash(hash[:elements])
      new(
        topic: Topic.new(hash[:topic]),
        elements: elements,
      )
    end
  end
end