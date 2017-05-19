# app/hyperloop/components/collection/collections.rb
class Collections < Common::BaseComponent
  param :api_url
  param :uid
  param :component_name
  set_store 'CollectionStore'

  def render
    if CollectionStore.collections
      "hi"
    end
  end
end
