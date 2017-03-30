module ContextMap 
  class Context < Common::BaseComponent
    param :context
    
    before_mount do
      # Stores::Context.init_test
    end

    # def element(element = nil)
    #   InvElement(element: element)
    # end

    # def elements
    #   Stores::Context.elements.collect {|e| element(element) }
    # end

    def render
      div do
        Topic(topic: params.context.topic)
        # div(class: 'context-map') { elements }
      end
    end
  end
end
