class ContextStore < Hyperloop::Store
  # receives ApiGet do
  #   mutate.context
  # end

  state :context, reader: true, scope: :class

  def self.init(context_hash)
    mutate.context ::Entities::Context.from_hash(context_hash)
  end

  def self.init_test(data)
    # puts data
    init(data)
  end

  def self.to_hash
    state.context.to_hash
  end
end
