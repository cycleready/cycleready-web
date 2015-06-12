class Neighborhood < ActiveRecord::Base
  has_and_belongs_to_many :bikeroutes
  validates :name, presence: true
end
