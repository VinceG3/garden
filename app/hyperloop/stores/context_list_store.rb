class ContextListStore < ApplicationStore
  state :context_list, reader: true, scope: :class
end