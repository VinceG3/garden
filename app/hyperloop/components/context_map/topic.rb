module ContextMap
  class Topic < Common::BaseComponent
    param :topic

    def edit_field
      Common::ClickToEdit(
        classes: 'topic-edit',
        placeholder: params.topic,
        on_submit: method(:on_save_topic).to_proc
      )
    end

    def on_save_topic(value)
      params.topic = value
    end

    def render
      div(class: 'topic') do
        edit_field
      end
    end
  end
end
