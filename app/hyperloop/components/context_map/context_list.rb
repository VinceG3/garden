module ContextMap
  class ContextList < Common::BaseComponent
    param :context_list

    def on_new(val)
      `window.location = '/context-map/' + #{val}`
    end

    def render
      div.context_list do
        Common::TextInput(on_enter: method(:on_new).to_proc)
        ul.context_list do
          params.context_list.list.each do |context|
            ContextListItem(
              context: context
            )
          end
        end
      end
    end
  end
end