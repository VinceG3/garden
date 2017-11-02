module Common
  class ClickToEdit < Common::ApplicationComponent
    param :placeholder, type: String
    param :on_submit, type: Proc, default: lambda {}
    param :classes, type: String
    param :no_underline, type: Boolean, default: false
    param autofocus: nil
    param link_if_present: nil
    param :empty, type: Boolean

    after_update do
      if state.editing
        Document.on(:click) do |event|
          unless event.target.tag_name == 'input'
            mutate.editing false
          end
        end
      end
    end

    before_unmount do
      Document.off(:click)
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

    def handle_mutate(action)
      if action == :edit
        mutate.editing true
      elsif action == :delete
        params.on_submit('')
      end
    end

    render do
      div(class_name: classes) do
        if state.editing || params.autofocus
          edit_field
        else
          span.link { params.placeholder }
            .on(:click) { handle_click }
          if state.hover && !params.empty
            MutateIcons(on_action: method(:handle_mutate).to_proc)
          end
        end
      end.on(:mouse_enter) { mutate.hover true }
         .on(:mouse_leave) { mutate.hover false }
    end
  end
end