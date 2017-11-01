module Common
  class ClickToEdit < Common::ApplicationComponent
    param :placeholder, type: String
    param :on_submit, type: Proc, default: lambda {}
    param :classes, type: String
    param :no_underline, type: Boolean, default: false
    param autofocus: nil
    param link_if_present: nil

    after_update do
      if state.editing
        Document.on(:click) do |event|
          unless event.target.tag_name == 'input'
            Document.off(:click)
            mutate.editing false
          end
        end
      end
    end

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

    def handle_click
      if params.link_if_present
        `window.location = #{params.link_if_present}`
      else
        mutate.editing true
      end
    end

    def render
      div(class_name: classes) do
        if state.editing || params.autofocus
          edit_field
        else
          span { params.placeholder }
        end
      end.on(:click) { handle_click }
    end
  end
end