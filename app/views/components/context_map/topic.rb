module Components
  module ContextMap
    class Topic < Common::BaseComponent
      param :name
      param :on_save, type: Proc, default: nil, allow_nil: true

      def classes
        c = 'topic'
        c += ' clickable' if no_name?
        c
      end

      def no_name?
        params.name.empty?
      end

      def editing?
        state.editing == true
      end

      def edit_field
        input(type: 'text', autoFocus: true).on(:key_press) do |e|
          if e.key == 'Enter'
            params.on_save(e.target.value)
            state.editing! false
          end
        end
      end

      def name
        return edit_field if editing?
        return 'Name Context' if no_name?
        params.name
      end

      def click_handler
        state.editing! true
      end

      def render
        div(class: classes, onClick: method(:click_handler).to_proc) do
          name
        end
      end
    end
  end
end
