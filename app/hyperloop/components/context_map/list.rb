module ContextMap
  class List < Common::BaseComponent
    param :api_url
    param :endpoint
    param :component_name
    set_store 'ContextListStore'

    def render
      if ContextListStore.context_list
        div(class: 'list') do
          ContextList(context_list: ContextListStore.context_list)
        end
      end
    end
  end
end