class Bikeroute < ActiveRecord::Base
  has_and_belongs_to_many :neighborhoods
  validates :name, presence: true
  accepts_nested_attributes_for :neighborhoods
end
