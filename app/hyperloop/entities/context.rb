module ::Entities
  class Context
    def from_hash(hash)
      new(
        topic: hash[:topic],
        elements: Elements.from_hash(hash[:elements]),
      )
    end
  end
end