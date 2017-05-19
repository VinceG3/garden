module ContextMap
  class SaveButton < Common::ApplicationComponent
    def on_click
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