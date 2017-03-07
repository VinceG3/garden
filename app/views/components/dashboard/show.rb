module Components
  module Dashboard
    class Show < React::Component::Base
      before_mount do
        state.stratfor_emails! []
      end

      after_mount do
        HTTP.get('http://data.vincentguidry.net/stratfor_emails') do |resp|
          state.stratfor_emails! JSON.parse(resp.body)
        end
      end

      def render
        "You have #{state.stratfor_emails.count} emails in your inbox"
      end
    end
  end
end