module Components
  module ContextMap
    class Context < Common::BaseComponent
      param :context

      def elements_style
        {
          margin: '0 auto',
          width: '360px',
          height: '300px',
        }
      end

      def elements
        params.context['elements'].keys.collect{|k| InvElement(name: k) }
      end

      def add_new_element
        InvElement(name: 'Add')
      end

      def render
        div do
          Topic(name: params.context['topic'])
          div(style: elements_style) do
            elements
            add_new_element
          end
        end
      end
    end
  end
end
