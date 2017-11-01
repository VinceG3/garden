module ContextMap
  class BackButton < Common::ApplicationComponent
    def on_click
      `window.location = '/context-map'`
    end

    def button_text
      state.button_text || 'Back'
    end

    def render
      button.button { button_text }
        .on('click') { on_click }
    end
  end 
end
