module ContextMap
  class InvElement < Common::BaseComponent
    param :element

    def text_class
      return 'clickable' if is_add_new?
      return ''
    end

    def sub_elements
      ses = params.element.sub_elements
      ses.collect do |sub_element|
        SubElement(sub_element: sub_element)
      end
    end

    def placeholder
      params.element.name.empty? ? 'Name Element' : params.element.name
    end

    def render
      div(class: 'element') do
        Common::ClickToEdit(
          classes: 'text_class',
          placeholder: placeholder,
          on_submit: mutator_proc(:element, :name)
        )
        sub_elements
      end
    end
  end
end
