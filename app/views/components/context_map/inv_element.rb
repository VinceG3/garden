module Components
  module ContextMap
    class InvElement < Common::BaseComponent
      param :name
      param :sub_elements, type: Array, default: []
      param :on_element_add, default: nil

      def text
        return "Add New" if is_add_new?
        params.name
      end

      def is_add_new?
        params.name == ''
      end

      def on_click
        return unless is_add_new?
        name = prompt('Name of new element')
        params.on_element_add.call(name)
      end

      def text_class
        return 'clickable' if is_add_new?
        return ''
      end

      def sub_elements
        ses = params.sub_elements.take(4).collect do |name|
          div(class: 'sub-elements') do
            span { name }
          end
        end
        if ses.count < 4
          div(class: 'new-sub-element') { span { '+' } }
        end
      end

      def render
        div(class: 'element', onClick: method(:on_click).to_proc) do
          span(class: text_class) { text }
          sub_elements
        end
      end
    end
  end
end