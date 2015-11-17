namespace :data do
  desc "TODO"
  task load_data: :environment do
    require 'json'
    Dir.chdir(Rails.root + 'lib/assets')
    file = File.read('routeSeedData.json')
    data_hash = JSON.parse(file)
    # puts data_hash
    data_hash.each do |record|
      # puts record["geojson"].to_json
      record["geojson"] = record["geojson"].to_json
      new_record = Bikeroute.new(record)
      new_record.save
    end
  end
  task connect_routes_to_neighborhoods: :environment do
    Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Alamo Square')
    Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Panhandle')
    Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Haight Ashbury')

  end
end