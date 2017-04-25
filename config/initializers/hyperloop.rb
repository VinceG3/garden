Hyperloop.configuration do |config|
  config.transport = :none
end

module Hyperloop
  module AutoCreate
    def needs_init?
      false
    end
  end
end
