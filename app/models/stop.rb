class Stop < ActiveRecord::Base
  belongs_to :place
  belongs_to :trip
  has_many :entries
  validates :place, :trip, presence: true

  delegate :state, :city, :country, to: :place
end