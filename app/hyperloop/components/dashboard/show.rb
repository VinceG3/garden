module Dashboard
  class Show < Common::BaseComponent
    param :api_url
    # set_store('ContextStore')

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
