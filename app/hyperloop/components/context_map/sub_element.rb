module ContextMap
  class SubElement < Common::BaseComponent
    param :sub_element
    param show_placeholder: false
    param on_edit: nil
    param autofocus: nil

    def placeholder
      return params.sub_element.name unless params.sub_element.name.empty?
      return '+' if params.show_placeholder
      ''
    end

    def on_submit
      if params.on_edit
        mutator_proc(:sub_element, :name, params.on_edit)
      else
        mutator_proc(:sub_element, :name)
      end
    end

    def render
      div(class: 'sub-elements') do
        Common::ClickToEdit(
          autofocus: params.autofocus,
          classes: 'text_class',
          placeholder: placeholder,
          on_submit: on_submit,
          no_underline: true
        )
      end
    end
  end
end