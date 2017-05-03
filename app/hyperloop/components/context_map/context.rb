module ContextMap 
  class Context < Common::BaseComponent
    param :context
    
    def elements(element = nil)
      params.context.elements.all.collect do |element_entity|
        InvElement(element: element_entity)
      end
    end

    def render
      div(class: 'context-map') do
        Scratch(scratch: params.context.scratch)
        Topic(topic: params.context.topic)
        div { elements }
        SaveButton()
      end
    end
  end
end
