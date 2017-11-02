module ContextMap
  class SubElement < Common::ApplicationComponent
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

    def link_if_present
      "/context-map/#{params.sub_element.name}" unless params.sub_element.name.empty?
    end

    def render
      div(class: 'sub-elements', draggable: true) do
        Common::ClickToEdit(
          autofocus: params.autofocus,
          classes: 'text_class',
          placeholder: placeholder,
          on_submit: on_submit,
          no_underline: true,
          link_if_present: link_if_present,
          empty: params.show_placeholder
        )
      end.on(:drag_start) do |ev|
        `#{ev.native_event}.native.dataTransfer.setData("ref", #{params.sub_element.name})`
      end
    end
  end
end