module ContextMap
  class InvElement < Common::BaseComponent
    param :element

    def on_add_name(value)
      element.name = value
    end

    def text_class
      return 'clickable' if is_add_new?
      return ''
    end

    def add_se(value)
      name = value
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
