module Components
  module ContextMap
    class InvElement < Common::BaseComponent
      def styles
        {
          width: '118px',
          height: '130px',
          border: '1px solid black',
          float: 'left',
          padding: '10px 20px',
          margin: '10px 10px',
          borderRadius: '10px',
        }
      end

      def text
        params.name
      end

      def is_add_new?
        params.name == 'Add'
      end

      def on_click
        alert('hi')
      end

      def render
        div(style: styles, onClick: method(:on_click).to_proc) do
          span(style: { textDecoration: 'underline' }) { text }
        end
      end
    end
  end
end