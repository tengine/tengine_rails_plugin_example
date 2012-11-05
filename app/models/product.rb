require 'eventmachine'

class Product
  include Mongoid::Document
  field :name, type: String
  field :code, type: String
  field :price, type: Integer

  after_create do |r|
    EventMachine.run do
      Tengine::Event.fire :'tengine.example.on_create', properties: { product: r.code }
    end
  end

  after_update do |r|
    EventMachine.run do
      Tengine::Event.fire :'tengine.example.on_update', properties: { product: r.code }
    end
  end

end
