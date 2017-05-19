module Common
  class ButtonWrapper < ApplicationComponent
    param :endpoint, type: String, default: nil, allow_nil: true
    param :click_cb, type: Proc, default: nil, allow_nil: true
    param :text, type: String

    def click_action
      HTTP.post(api_endpoint(param.endpoint)) do |resp|
        params.click_cb(JSON.parse(resp.body))
      end
    end

    def render
      button { params.text }.on(:click) do
        click_action
      end
    end
  end
end
