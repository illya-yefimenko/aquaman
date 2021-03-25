class Property
  include Mongoid::Document
  include Mongoid::Timestamps

  before_save :push_to_historical_values

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
  has_many :historical_values, dependent: :destroy

  public
  def self.value_types
    VALUE_TYPES
  end
  def self.io_directions
    IO_DIRECTIONS
  end
  def get_value
    case :value_type
    when :number
      :value
    when :boolean
      :value ? true : false
    end
  end

  def push_to_historical_values
    historical_values.new value: get_value
  end
end
