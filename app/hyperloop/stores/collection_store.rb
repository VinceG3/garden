class CollectionStore < ApplicationStore
  state :collections, reader: true, scope: :class
end