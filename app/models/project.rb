class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :devices, dependent: :destroy
  belongs_to :user

  field :name, type: String

  scope :filter_by_user, -> (user) { where user: user }
end
