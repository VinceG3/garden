module Components
  module Projects
    class Show < Common::BaseComponent
      param :api_url

      before_mount do
        @@api_url = params.api_url
        state.projects! initial_projects
      end

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

      def projects
        state.projects.collect{|name| Project(name: name) }
      end

      def styles
        {
          width: '800px',
          margin: '100px auto 0'
        }
      end

      def add_project(name)
        new_projects = state.projects << Project(name: name)
        state.projects! new_projects
      end

      def render
        div(style: styles) do
          projects
            .push(Project(name: nil, on_add: method(:add_project).to_proc))
        end
      end
    end
  end
end
