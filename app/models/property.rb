class Property
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
    validates :name, presence: true
  field :unit, type: String
    validates :unit, presence: true

  field :value_type, type: StringifiedSymbol
    VALUE_TYPES = [:number, :boolean]
    validates :value_type, inclusion: { in: VALUE_TYPES }

  field :io_direction, type: StringifiedSymbol
    IO_DIRECTIONS = [:input, :output]
    validates :io_direction, inclusion: { in: IO_DIRECTIONS }

  field :value

  belongs_to :device

  public
  def self.getValueTypes
    VALUE_TYPES
  end
  def self.getIODirections
    IO_DIRECTIONS
  end
  def getValue
    case :value_type
    when :number
      :value
    when :boolean
      :value ? true : false
    end
  end
end
