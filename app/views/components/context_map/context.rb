module Components
  module ContextMap
    class Context < Common::BaseComponent
      before_mount do
        state.context!({
          topic: 'Self',
          elements: {
            'Identity' => [],
            'Consciousness' => ['Perception', 'Growth']
          }
        })
      end

      def on_element_add(name)
        new_context = state.context
        new_context[:elements][name] = []
        state.context! new_context
      end

      def on_topic_save(name)
        new_context = state.context
        new_context[:topic] = name
        state.context! new_context
      end

      def on_sub_element_add(name, element)
        new_context = state.context
        new_context[:elements][element] << name
        state.context! new_context
      end

      def element(name = '', sub_elements = [])
        InvElement(
          name: name,
          sub_elements: sub_elements,
          on_element_add: method(:on_element_add).to_proc,
          on_sub_element_add: method(:on_sub_element_add).to_proc,
        )
      end

      def elements
        es = state.context['elements'].collect {|k, v| element(k,v) }
        es << element if state.context['elements'].count < 4
      end

      def render
        div do
          Topic(
            name: state.context['topic'],
            on_save: method(:on_topic_save).to_proc
          )
          div(class: 'context-map') do
            elements
          end
        end
      end
    end
  end
end
