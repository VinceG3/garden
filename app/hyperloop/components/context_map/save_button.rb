module ContextMap
  class SaveButton < Common::BaseComponent
    def on_click
      put_data("context", ContextStore.to_hash) { on_save }
    end

    def on_save
      mutate.button_text 'Saved!'
    end

    def button_text
      state.button_text || 'Save'
    end

    def render
      button.save_button { button_text }
        .on('click') { on_click }
    end
  end	
end