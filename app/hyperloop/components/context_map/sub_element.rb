module ContextMap
  class SubElement < Common::BaseComponent
    param :sub_element

    def placeholder
      params.sub_element.name.empty? ? '+' : params.sub_element.name
    end

    def render
      div(class: 'sub-elements') do
        Common::ClickToEdit(
          classes: 'text_class',
          placeholder: placeholder,
          on_submit: mutator_proc(:sub_element, :name)
        )
      end
    end
  end
end