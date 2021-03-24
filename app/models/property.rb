class Property
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
    validates :name, presence: true
  field :unit, type: String
    validates :unit, presence: true

  field :value_type
    VALUE_TYPES = [:number, :boolean]
    validates :value_type, inclusion: { in: VALUE_TYPES }

  field :io_direction
    IO_DIRECTIONS = [:input, :output]
    validates :io_direction, inclusion: {in: IO_DIRECTIONS }

  belongs_to :device
end
