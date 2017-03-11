# app/views/components.rb
require 'opal'
require 'hyper-react'
if React::IsomorphicHelpers.on_opal_client?
  require 'opal-jquery'
  require 'browser'
  require 'browser/interval'
  require 'browser/delay'
  # add any additional requires that can ONLY run on client here
  require 'opal_hot_reloader'
  OpalHotReloader.listen
end

require_tree './components'

