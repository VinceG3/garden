module ContextMap
  class SubElement < Common::BaseComponent
    param :sub_element
    param :show_placeholder

    def placeholder
      return params.sub_element.name unless params.sub_element.name.empty?
      return '+' if params.show_placeholder
      ''
    end

    def render
      div(class: 'sub-elements') do
        Common::ClickToEdit(
          classes: 'text_class',
          placeholder: placeholder,
          on_submit: mutator_proc(:sub_element, :name),
          no_underline: true
        )
      end
    end
  end
end