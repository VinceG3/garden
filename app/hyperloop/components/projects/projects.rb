module Projects
  class Projects < Common::BaseComponent
    param :api_url
    param component_name: 'projects'
    param passed_elements: nil
    set_store 'ProjectStore', passed_in: initial_projects

    def initial_projects
      [
        'Great Big Story',
        'Context Mapping',
        'Project Managing',
        'Hyperloop',
        'Workflow Optimizing',
        'New Business Ideas',
      ]
    end

    def styles
      {
        width: '800px',
        margin: '100px auto 0'
      }
    end

    def render
      if ProjectStore.projects
        div(class: 'show') do
          Projects(
            projects: ProjectsStore.projects
          )
        end
      end
    end
  end
end
