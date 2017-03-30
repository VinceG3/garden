module Home
  class Show < Common::BaseComponent

    param :say_hello_to

    def render
      puts "Rendering my first component!"
      "hello #{params.say_hello_to if params.say_hello_to}"
    end
  end
end
