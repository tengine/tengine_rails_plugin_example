require 'tengine/batch'

class Product
  include Mongoid::Document
  field :name, type: String
  field :code, type: String
  field :price, type: Integer

  after_create{|r| Tengine::Batch.fire("example1.on_create", product_code: r.code) }
  after_update{|r| Tengine::Batch.fire("example1.on_update", product_code: r.code) }

end
