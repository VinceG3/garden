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
        div(class: 'main') do
          Topic(topic: params.context.topic)
          div(class: 'elements') { elements }
        end
        div(class: 'buttons') do
          SaveButton()
          BackButton()
        end
      end
    end
  end
end
