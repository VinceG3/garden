module Common
  class ApplicationComponent < Hyperloop::Component
    def mutator_proc(param, attr, block = nil)
      Proc.new do |value|
        params.send(param.to_sym).send("#{attr}=".to_sym, value)
        ContextStore.refresh
        block.call unless block.nil?
      end
    end

    render do
      'hi'
    end
  end
end
