module Components
  module ContextMap
    class Topic < Common::BaseComponent
      param :name

      def styles
        {
          margin: '10px 0 0',
          minWidth: '400px',
          maxWidth: '800px',
          textAlign: 'center',
          fontSize: '32px',
        }
      end

      def render
        div(style: styles) do
          params.name
        end
      end
    end
  end
end
