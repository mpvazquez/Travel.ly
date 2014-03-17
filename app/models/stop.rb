class Stop < ActiveRecord::Base
  belongs_to :place
  belongs_to :trip
  validates :place, :trip, presence: true
end