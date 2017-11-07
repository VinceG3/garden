module ContextMap
  class ContextListItem < Common::ApplicationComponent
    param :topic

    def handle_mutate_proc(topic)
      retval = ->(action) { puts 'deleting!' }
      retval
    end

    def render
      li do
        a(href: "/context-map/#{context['topic']}") { context['topic']}
        if state.hover
          Common::MutateIcons(on_action: handle_mutate_proc(context['topic']))
        end
      end
        .on(:mouse_enter){ mutate.hover true }
        .on(:mouse_leave){ mutate.hover false }
    end
  end
end