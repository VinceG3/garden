module ContextMap 
  class Context < Common::BaseComponent
    param :context
    
    def elements(element = nil)
      params.context.elements.all.collect do |element_entity|
        InvElement(element: element_entity)
      end
    end

    def render
      div do
        Topic(topic: params.context.topic)
        div(class: 'context-map') { elements }
        SaveButton()
      end
    end
  end
end
