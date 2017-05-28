module ::Entities
  class SubElement < Entity
    param :name

    def initialize(name: '', on_change: nil)
      @name = name
      @on_change = on_change
    end

    def on_change
      return if @on_change.nil?
      @on_change.call
    end

    def self.from_array(array)
      array = [] if array.nil?
      ses = array.collect {|name| SubElement.new(name: name)}
      ses += (ses.size < 4) ? (4 - ses.size).times.collect{SubElement.new} : []
      ses
    end
  end
end
