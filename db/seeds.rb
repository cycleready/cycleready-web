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
    description: 'The best way west'
  },
  {
    name: 'Market Street',
    description: 'Castro to the Ferry Building'
  },
  {
    name: 'The Embarcadero',
    description: 'Ferry Building to Pier 39'
  },
  {
    name: 'The Panhandle',
    description: 'Haight to Golden Gate Park'
  }
])
