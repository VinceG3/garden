module Components
  module ContextMap
    class InvElement < Common::BaseComponent
      param :name
      param :sub_elements, type: Array, default: []
      param :on_element_add, type: Proc
      param :on_sub_element_add, type: Proc, default: nil

      def name
        if is_add_new?
          Common::ClickToEdit(
            classes: 'text_class',
            placeholder: 'Name Element',
            on_submit: method(:on_add_name).to_proc,
          )
        else
          span(class: text_class) { params.name }
        end
      end

      def is_add_new?
        params.name == ''
      end

      def on_add_name(value)
        params.on_element_add(value)
      end

      def text_class
        return 'clickable' if is_add_new?
        return ''
      end

      def add_se(value)
        params.on_sub_element_add(value, params.name)
        state.editing! false
      end

      def sub_elements
        ses = params.sub_elements.take(4).collect do |name|
          div(class: 'sub-elements') do
            span { name }
          end
        end
        if ses.count < 4 && !is_add_new?
          Common::ClickToEdit(
            classes: 'new-sub-element',
            placeholder: '+',
            on_submit: method(:add_se).to_proc,
          )
        end
      end

      def render
        div(class: 'element') do
          name
          sub_elements
        end
      end
    end
  end
end