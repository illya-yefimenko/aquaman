class Device
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :property
  field :name, type: String
  
  validates :name, presence: true
end
