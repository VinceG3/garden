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

      def on_element_add(name, existing = nil)
        new_context = state.context
        puts existing
        if existing.nil? or existing.empty?
          new_context[:elements][name] = []
        else
          new_context[:elements][name] = new_context[:elements][existing]
        end
        state.context! new_context
      end

      def on_topic_save(name)
        new_context = state.context
        new_context[:topic] = name
        state.context! new_context
      end

      def on_sub_element_add(name, index)
        new_context = state.context
        element = new_context[:elements].to_a[index]
        if element.nil?
          new_context[:elements]["Unnamed Element #{index}"] = [name]
        else
          new_context[:elements][element[0]] << name
        end
        state.context! new_context
      end

      def element(index, name = '', sub_elements = [])
        InvElement(
          name: name,
          sub_elements: sub_elements,
          index: index,
          on_element_add: method(:on_element_add).to_proc,
          on_sub_element_add: method(:on_sub_element_add).to_proc,
        )
      end

      def elements
        es = state.context['elements']
          .each_with_index
          .collect {|kv, i| element(i, kv[0], kv[1]) }
        es << element(es.count) if state.context['elements'].count < 4
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
