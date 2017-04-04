module Common
  class ClickToEdit < Common::BaseComponent
    param :placeholder, type: String
    param :on_submit, type: Proc, default: lambda {}
    param :classes, type: String

    def edit_field
      Common::TextInput(on_enter: method(:submit).to_proc)
    end

    def submit(val)
      params.on_submit(val)
      mutate.editing false
    end

    def noop; end

    def render
      div(class_name: params.classes + ' clickable') do
        if state.editing
          edit_field
        else
          span { params.placeholder }
        end
      end.on(:click) { mutate.editing true }
    end
  end
end