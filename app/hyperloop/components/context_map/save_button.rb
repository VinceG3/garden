module ContextMap
  class SaveButton < Common::BaseComponent
    def on_click
      put_data("context", ContextStore.to_hash) { on_save }
    end

    def on_save
      ContextStore.save
      mutate.button_text 'Saved!'
      $window.after(2) { mutate.button_text 'Save' }
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