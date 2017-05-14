module ContextMap
  class InvElement < Common::BaseComponent
    param :element

    def text_class
      return 'clickable' if is_add_new?
      return ''
    end

    def placeholder_index
      ret = nil
      params.element.sub_elements.each_with_index do |se, i|
        next unless ret.nil?
        ret = i if se.name == ''
      end
      ret
    end

    def sub_elements
      params.element.sub_elements.each_with_index.collect do |sub_element, i|
        SubElement(sub_element: sub_element, show_placeholder: placeholder_index == i)
      end
    end

    def placeholder
      condition = params.element.name.blank?
      condition ? 'Name Element' : params.element.name
    end

    def drop(ev)
      name = `#{ev.native_event}.native.dataTransfer.getData('ref')`
      ContextStore.remove_sub_element(name)
      params.element.add_sub_element(name)
    end

    def render
      div(class: 'element') do
        a(href: "/context-map/#{params.element.name}") { params.element.name }
        sub_elements
      end.on(:drop) {|ev| drop(ev) }
         .on(:drag_over) { |ev| ev.prevent_default }
    end
  end
end
