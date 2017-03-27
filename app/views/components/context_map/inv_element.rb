module Components
  module ContextMap
    class InvElement < Common::BaseComponent
      param :name, type: String, default: ''
      param :index, type: Number
      param :sub_elements, type: Array, default: []
      param :on_element_add, type: Proc
      param :on_sub_element_add, type: Proc

      def on_add_name(value)
        params.on_element_add(value, params.name)
      end

      def text_class
        return 'clickable' if is_add_new?
        return ''
      end

      def name
        return params.name if !params.name.empty?
        'Unnamed Element' unless params.sub_elements.empty?
        'Name Element'
      end

      def add_se(value)
        params.on_sub_element_add(value, params.index)
        state.editing! false
      end

      def sub_elements
        ses = params.sub_elements.take(4).collect do |name|
          div(class: 'sub-elements') do
            span { name }
          end
        end
        if ses.count < 4
          Common::ClickToEdit(
            classes: 'new-sub-element',
            placeholder: '+',
            on_submit: method(:add_se).to_proc,
          )
        end
      end

      def render
        div(class: 'element') do
          Common::ClickToEdit(
            classes: 'text_class',
            placeholder: name,
            on_submit: method(:on_add_name).to_proc,
          )
          sub_elements
        end
      end
    end
  end
end