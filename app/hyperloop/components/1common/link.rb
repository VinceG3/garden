module Common
  class Link < ApplicationComponent
    param :text
    param :url

    def render
      a(href: params.url) { params.text }
    end
  end
end
