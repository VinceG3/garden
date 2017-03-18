module Components
  module ContextMap
    class Topic < Common::BaseComponent
      param :name

      def styles
        style = {
          margin: '10px 0 0',
          minWidth: '400px',
          maxWidth: '800px',
          textAlign: 'center',
          fontSize: '32px',
        }
        style.merge!({ textDecoration: 'underline' }) if no_name?
      end

      def no_name?
        params.name.empty?
      end

      def name
        return 'Name Context' if no_name?
        params.name
      end

      def render
        div(style: styles) do
          name
        end
      end
    end
  end
end
