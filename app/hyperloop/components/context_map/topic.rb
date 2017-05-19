module ContextMap
  class Topic < Common::ApplicationComponent
    param :topic

    def edit_field
      params.topic.name
    end

    def render
      div(class: 'topic') do
        edit_field
      end
    end
  end
end
