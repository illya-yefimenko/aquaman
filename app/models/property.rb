class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :unit, type: String
  field :type, type: Integer
  field :io_direction, type: Integer
  
  belongs_to :device

  enum type: [:number, :boolean]
  enum io_direction: [:input, :output]

  validates :name, presence: true
  validates :unit, presence: true
  validates :type, inclusion: { in: types.keys }
  validates :io_direction, inclusion: { in: io_directions.keys }
end
