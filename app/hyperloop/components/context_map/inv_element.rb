module ContextMap
  class InvElement < Common::BaseComponent
    param :element

    def text_class
      return 'clickable' if is_add_new?
      return ''
    end

    def placeholder_index
      ret = nil
      params.element.sub_elements.each_with_index do |se, i|
        next unless ret.nil?
        ret = i if se.name == ''
      end
      ret
    end

    def sub_elements
      params.element.sub_elements.each_with_index.collect do |sub_element, i|
        SubElement(sub_element: sub_element, show_placeholder: placeholder_index == i)
      end
    end

    def placeholder
      condition = params.element.name.blank?
      condition ? 'Name Element' : params.element.name
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
