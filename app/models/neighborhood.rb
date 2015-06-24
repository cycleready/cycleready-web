class Neighborhood < ActiveRecord::Base
  has_and_belongs_to_many :bikeroutes
  validates :name, presence: true
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]
  # existing records should run Neighborhood.find_each(&:save)
  # in console to update with slug field
  # see http://railscasts.com/episodes/314-pretty-urls-with-friendlyid
  accepts_nested_attributes_for :bikeroutes
end
