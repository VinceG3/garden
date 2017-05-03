module ContextMap
  class Scratch < Common::BaseComponent
    param :scratch

    def placeholder_index
      ret = nil
      params.scratch.sub_elements.each_with_index do |se, i|
        next unless ret.nil?
        ret = i if se.name == ''
      end
      ret
    end

    def render
      div(class: 'scratch') do
        params.scratch.sub_elements.each_with_index.collect do |sub_element, i|
          SubElement(sub_element: sub_element, show_placeholder: placeholder_index == i)
        end
      end
    end
  end
end