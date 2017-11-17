class CustomLogger < Rails::Rack::Logger
  def initialize(app, opts = {})
    @app = app
    @opts = opts
    super
  end

  def true_conditions(env)
    return true if env['PATH_INFO'].match(/__OPAL_SOURCE_MAPS__/)
    return true if env['X-SILENCE-LOGGER']
    return false
  end

  def call(env)
    if true_conditions(env)
      Rails.logger.silence do
        @app.call(env)
      end
    else
      super(env)
    end
  end
end
