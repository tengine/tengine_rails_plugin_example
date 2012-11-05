class ProductLog
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :msg, type: String
end
