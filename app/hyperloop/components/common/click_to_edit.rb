module Common
  class ClickToEdit < Common::BaseComponent
    param :placeholder, type: String
    param :on_submit, type: Proc, default: lambda {}
    param :classes, type: String
    param :no_underline, type: Boolean, default: false

    def edit_field
      Common::TextInput(on_enter: method(:submit).to_proc)
    end

    def submit(val)
      params.on_submit(val)
      mutate.editing false
    end

    def classes
      ret = params.classes + ' clickable'
      ret += ' no-underline' if params.no_underline
      ret
    end

    def render
      div(class_name: classes) do
        if state.editing
          edit_field
        else
          span { params.placeholder }
        end
      end.on(:click) { mutate.editing true }
    end
  end
end