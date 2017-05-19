module ContextMap
  class InvElement < Common::ApplicationComponent
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

    def on_submit
      mutator_proc(:element, :name)
    end

    def name_href
      href = "/context-map/#{params.element.name}"
      href += "?elements=#{params.element.sub_elements.collect(&:name).join(',')}"
      href
    end

    def name_link
      a(href: name_href) { params.element.name }
    end

    def name
      unless params.element.name.empty?
        name_link
      else
        Common::ClickToEdit(
          classes: 'text_class',
          placeholder: 'Name Element',
          on_submit: on_submit
        )
      end
    end

    def render
      div(class: 'element') do
        name
        sub_elements
      end.on(:drop) {|ev| drop(ev) }
         .on(:drag_over) { |ev| ev.prevent_default }
    end
  end
end
