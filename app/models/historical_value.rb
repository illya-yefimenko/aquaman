class HistoricalValue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer

  belongs_to :property
end
