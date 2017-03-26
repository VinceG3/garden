module Components
  module ContextMap
    class Topic < Common::BaseComponent
      param :name
      param :on_save, type: Proc

      def edit_field
        Common::ClickToEdit(
          classes: 'topic-edit',
          placeholder: params.name,
          on_submit: method(:on_save_topic).to_proc
        )
      end

      def on_save_topic(value)
        params.on_save(value)
      end

      def render
        div(class: 'topic') do
          edit_field
        end
      end
    end
  end
end
