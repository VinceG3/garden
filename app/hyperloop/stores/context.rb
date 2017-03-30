class ContextStore < Hyperloop::Store
  state :context, reader: true, scope: :class

  def self.init(context_hash)
    mutate.context ::Entities::Context.from_hash(context_hash)
  end

  def self.init_test
    init({
      topic: 'Self',
      elements: {
        'Identity' => ['Drive'],
        'Consciousness' => ['Perception', 'Growth'],
        'Personality' => ['Truth'],
      }
    })
  end
end
