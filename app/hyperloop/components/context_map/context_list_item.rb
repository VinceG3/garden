module ContextMap
  class ContextListItem < Common::ApplicationComponent
    params :topic

    def handle_mutate_proc(topic)
      return ->(action) { puts 'deleting!' }
    end

    render do
      li do
        a(href: "/context-map/#{context['topic']}") { context['topic']}
        if state.hover
          Common::MutateIcons(on_action: handle_mutate_proc(context['topic']))
        end
      end.on(:mouse_enter) { mutate.hover true }
         .on(:mouse_leave) { mutate.hover false }
    end
  end
end