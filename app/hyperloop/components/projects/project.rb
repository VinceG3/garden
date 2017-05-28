module Projects
  class Project < Common::ApplicationComponent
    param :name, type: String, allow_nil: true
    param :on_add, type: Proc, default: nil, allow_nil: true

    def render
      Common::ClickToEdit(
        placeholder: params.name || 'Add New',
        classes: 'project-name',
        no_underline: true,
        on_submit: Proc.new {|val| puts params.on_add }
      )
    end
  end
end
