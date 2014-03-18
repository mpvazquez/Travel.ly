class Trip < ActiveRecord::Base
  validates :name, presence: true
  has_many :stops
  has_many :places, through: :stops
end
