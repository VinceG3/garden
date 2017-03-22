module Components
  module ContextMap
    class InvElement < Common::BaseComponent
      param :name
      param :on_element_add, default: nil

      def text
        params.name
      end

      def is_add_new?
        params.name == 'Add New'
      end

      def on_click
        return unless is_add_new?
        name = prompt('Name of new element')
        params.on_element_add.call(name)
      end

      def render
        div(class: 'element', onClick: method(:on_click).to_proc) do
          span(style: { textDecoration: 'underline' }) { text }
        end
      end
    end
  end
end