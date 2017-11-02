module Common
  class MutateIcons < Common::ApplicationComponent
    param :on_action, type: Proc, default: nil, allow_nil: true

    render do
      span.mutate_icons do
        span.icon { 'E' }.on(:click) { params.on_action(:edit) }
        span.icon { 'D' }.on(:click) { params.on_action(:delete) }
      end
    end
  end
end
