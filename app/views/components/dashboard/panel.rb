module Components
  module Dashboard
    class Panel < Common::BaseComponent
      param :text, type: String

      def styles
        {
          width: 200,
          height: 200,
          border: '1px solid black',
          borderRadius: '5px',
          padding: '10px 20px',
          display: 'inline-block',
          margin: '10px 20px'
        }
      end

      def render
        div(style: styles) { params.text }
      end
    end
  end
end