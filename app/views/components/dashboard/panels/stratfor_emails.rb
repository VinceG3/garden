module Components
  module Dashboard
    module Panels
      class StratforEmails < Panel
        before_mount do
          state.stratfor_emails! []
        end

        after_mount do
          HTTP.get(api_endpoint('stratfor_emails')) do |resp|
            state.stratfor_emails! JSON.parse(resp.body)
          end
        end

        def render
          div(style: styles) do
            "you have #{state.stratfor_emails.count} stratfor emails"
          end
        end
      end
    end
  end
end