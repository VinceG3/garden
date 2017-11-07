Hyperloop.configuration do |config|
  config.transport = :none
  config.import 'active_support/core_ext'
  config.prerendering = :off
end

module Hyperloop
  module AutoCreate
    def needs_init?
      false
    end
  end
end
