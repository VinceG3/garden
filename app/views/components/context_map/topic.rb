module Components
  module ContextMap
    class Topic < Common::BaseComponent
      param :name

      def classes
        c = 'topic'
        c += ' clickable' if no_name?
      end

      def no_name?
        params.name.empty?
      end

      def editing?
        state.editing == true
      end

      def edit_field
        input(type: 'text', autoFocus: true)
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
