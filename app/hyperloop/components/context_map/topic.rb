module ContextMap
  class Topic < Common::BaseComponent
    param :topic

    def edit_field
      Common::ClickToEdit(
        classes: 'topic-edit',
        placeholder: params.topic.name,
        on_submit: mutator_proc(:topic, :name) 
      )
    end

    def render
      div(class: 'topic') do
        edit_field
      end
    end
  end
end
