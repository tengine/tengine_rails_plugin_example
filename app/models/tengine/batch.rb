class Tengine::Batch
  include Mongoid::Document
  field :name, type: String
  field :status_cd, type: Integer
  field :logs, type: Array
end
