class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :unit, type: String
  field :type, type: Integer
  field :io_direction, type: Integer
  
  belongs_to :device
  
  TYPES = ['number','boolean']
  
  validates :name, presence: true
  validates :unit, presence: true
  validates :type, inclusion: { in: TYPES }
end
