class HistoricalValue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value

  belongs_to :property
end
