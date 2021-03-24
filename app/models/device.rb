class Device
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  validates :name, presence: true

  has_many :properties, dependent: :destroy
end
