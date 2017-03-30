module Dashboard
  module Panels
    class InfoProcess < Panel
      before_mount do
        state.urls_to_read! []
      end

      after_mount do
        get_data('urls_to_read') do |resp|
          state.urls_to_read! resp.body
        end
      end

      def info_styles
        {
          textAlign: 'center'
        }
      end

      def render
        div(style: styles.merge(info_styles)) do
          div(style: {fontSize: '40px', marginTop: '10px'}) {"#{state.urls_to_read.count}" }
          div(style: {fontSize: '14px'}) {"URLs"}
        end
      end
    end
  end
end
