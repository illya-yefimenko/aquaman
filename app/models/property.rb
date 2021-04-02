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
    IO_DIRECTIONS = [:input, :output, :variable]
    validates :io_direction, inclusion: { in: IO_DIRECTIONS }

  field :value
    validate :validate_value_match_type

  belongs_to :device
    has_many :historical_values, dependent: :destroy

  public
  def self.value_types
    VALUE_TYPES
  end
  def self.io_directions
    IO_DIRECTIONS
  end

  def push_to_historical_values
    if(created_at && !value.nil?)
      historical_values.create value: value
    end
  end

  def show_graph?
    io_direction != :variable
  end

  def validate_value_match_type
    if(created_at && !value.nil?)
      case value_type
      when :number
        errors.add :value, "is not a number" unless value.is_a? Numeric
      when :boolean
        errors.add :value, "is not a boolean" unless value.is_a? Numeric
      else
        fail "Unknown type"
      end
    end
  end

end
