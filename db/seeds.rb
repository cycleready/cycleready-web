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

hoods = Neighborhood.create([
  {
    name: 'Tenderloin',
    map: 'route/to/tenderloin.map'
  },
  {
    name: 'Mission',
    map: 'route/to/mission.map'
  },
  {
    name: 'Alamo Square',
    map: 'route/to/alamosquare.map'
  },
  {
    name: 'Union Square',
    map: 'route/to/unionsquare.map'
  },
  {
    name: 'Civic Center',
    map: 'route/to/civiccenter.map'
  },
  {
    name: 'Upper Haight',
    map: 'route/to/upperhaight.map'
  },
  {
    name: 'Panhandle',
    map: 'route/to/panhandle.map'
  },
  {
    name: 'Castro',
    map: 'route/to/castro.map'
  },
  {
    name: 'SOMA',
    map: 'route/to/soma.map'
  },
  {
    name: 'Financial District',
    map: 'route/to/financialdistrict.map'
  },
  {
    name: 'Embarcadero',
    map: 'route/to/embarcadero.map'
  }
  ])

routes[0].neighborhoods << Neighborhood.find_by( name: 'Alamo Square')
routes[0].neighborhoods << Neighborhood.find_by( name: 'Panhandle')
routes[1].neighborhoods << Neighborhood.find_by( name: 'Tenderloin')
routes[1].neighborhoods << Neighborhood.find_by( name: 'Union Square')
routes[1].neighborhoods << Neighborhood.find_by( name: 'Civic Center')
routes[1].neighborhoods << Neighborhood.find_by( name: 'SOMA')
routes[1].neighborhoods << Neighborhood.find_by( name: 'Financial District')
routes[1].neighborhoods << Neighborhood.find_by( name: 'Embarcadero')
routes[2].neighborhoods << Neighborhood.find_by( name: 'Embarcadero')
routes[2].neighborhoods << Neighborhood.find_by( name: 'Financial District')
routes[3].neighborhoods << Neighborhood.find_by( name: 'Panhandle')
routes[3].neighborhoods << Neighborhood.find_by( name: 'Upper Haight')
routes[3].neighborhoods << Neighborhood.find_by( name: 'Alamo Square')
