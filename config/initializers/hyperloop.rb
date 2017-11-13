Hyperloop.configuration do |config|
  config.transport = :none
  config.import 'active_support/core_ext'
  config.prerendering = :off
  config.compress_system_assets = false
end

module Hyperloop
  module AutoCreate
    def needs_init?
      false
    end
  end
end
