module Common
  class TextInput < Common::BaseComponent
    param :on_enter, type: Proc

    def render
      input(type: 'text', autoFocus: true).on(:key_press) do |e|
        if e.key == 'Enter'
          params.on_enter(e.target.value)
        end
      end
    end
  end
end