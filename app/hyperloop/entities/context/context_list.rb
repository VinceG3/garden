module ::Entities
  class ContextList
    def initialize(list)
      @list = list
    end

    def self.from_array(list)
      list ||= []
      new(list: list)
    end

    def self.from_data(data)
      from_array(data)
    end

    def list
      @list['list']
    end
  end
end