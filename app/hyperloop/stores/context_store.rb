class ContextStore < ApplicationStore
  state :context, reader: true, scope: :class

  def self.init_test(data)
    init(data)
  end

  def self.refresh
    @component.force_update!
  end

  def self.to_hash
    state.context.to_hash
  end

  def self.handle_passed(context)
    context.pass_in(@passed)
  end

  def self.save
    ApiPut.run(route: 'context', api_url: @api_url, data: to_hash)
  end

  def self.remove_sub_element(name)
    context.scratch.remove_sub_element(name)
    context.elements.elements.each {|e| e.remove_sub_element(name)}
  end
end
