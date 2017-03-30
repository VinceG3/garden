module Common
  class Link < BaseComponent
    param :text
    param :url

    def render
      a(href: params.url) { params.text }
    end
  end
end
