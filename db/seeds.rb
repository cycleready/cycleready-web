# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

routes = Bikeroute.create([
  {
    name: 'The Wiggle',
    description: 'The best way west',
    lane_type: 'Sharrows',
    grade: '2',
    distance: '0.7'
  },
  {
    name: 'Market Street',
    description: 'Castro to the Ferry Building',
    lane_type: 'Dedicated Lane',
    grade: '1',
    distance: '3'
  },
  {
    name: 'The Embarcadero',
    description: 'Ferry Building to Pier 39',
    lane_type: 'Separated Lane',
    grade: '0',
    distance: '2'
  },
  {
    name: 'The Panhandle',
    description: 'Haight to Golden Gate Park',
    lane_type: 'Bike Path',
    grade: '3',
    distance: '1'
  }
])
