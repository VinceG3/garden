module Components
  module ContextMap
    class Context < Common::BaseComponent
      param :context
      param :on_element_add
      param :on_topic_save

      def elements
        params.context['elements'].collect do |k, v|
          InvElement(name: k, sub_elements: v)
        end
      end

      def add_new_element
        InvElement(
          name: '',
          on_element_add: params.on_element_add,
        )
      end

      def render
        div do
          Topic(
            name: params.context['topic'],
            on_save: params.on_topic_save,
          )
          div(class: 'context-map') do
            elements
            add_new_element if params.context['elements'].count < 4
          end
        end
      end
    end
  end
end
