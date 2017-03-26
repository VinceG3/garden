module Components
  module ContextMap
    class Context < Common::BaseComponent
      param :context
      param :on_element_add
      param :on_topic_save
      param :on_sub_element_add

      def elements
        es = params.context['elements'].collect do |k, v|
          InvElement(
            name: k,
            sub_elements: v,
            on_element_add: params.on_element_add,
            on_sub_element_add: params.on_sub_element_add
          )
        end
        es << add_new_element if params.context['elements'].count < 4
      end

      def add_new_element
        InvElement(
          name: '',
          on_element_add: params.on_element_add,
          on_sub_element_add: params.on_sub_element_add
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
          end
        end
      end
    end
  end
end
