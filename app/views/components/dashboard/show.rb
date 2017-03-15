module Components
  module Dashboard
    class Show < Common::BaseComponent
      param :api_url

      before_mount do
        @@api_url = params.api_url
      end

      def render
        div do
          Panels::Ingest()
          Panels::InfoProcess()
          Panels::AddIdea()
          Panels::Reminders()
          Panels::ContextMap()
        end
      end
    end
  end
end
