module Components
  module Projects
    class Project < Common::BaseComponent
      param :name, type: String, allow_nil: true
      param :on_add, type: Proc, default: nil, allow_nil: true

      def name
        params.name ? params.name : "Add New"
      end

      def on_add
        state.currently_adding! true
      end

      def render
        if state.currently_adding
          div do
            input(type: text, autoFocus: true)
              .on(:key_press) do |e|
                if e.key == 'Enter'
                  params.on_add(e.target.value)
                  state.currently_adding!(false) 
                end
              end
          end
        else
          div do
            span(style: { marginRight: '10px' }) { name }
          end.on(:click) { on_add } 
        end
      end
    end
  end
end
