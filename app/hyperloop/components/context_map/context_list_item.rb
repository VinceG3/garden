module ContextMap
  class ContextListItem < Common::ApplicationComponent
    param :context

    def handle_mutate_proc(topic)
      retval = ->(action) { ApiGet.run(route: "context/#{topic}", api_url: api_url)}
      retval
    end

    def render
      li do
        a(href: "/context-map/#{params.context['topic']}") { params.context['topic']}
        if state.hover
          Common::MutateIcons(on_action: handle_mutate_proc(params.context['topic']))
        end
      end
        .on(:mouse_enter){ mutate.hover true }
        .on(:mouse_leave){ mutate.hover false }
    end
  end
end
