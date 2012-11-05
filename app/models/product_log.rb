class ProductLog
  include Mongoid::Document
  field :msg, type: String
  field :created_at, type: Time
end
