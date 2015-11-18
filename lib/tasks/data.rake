namespace :data do
  desc "TODO"
  task load_routes: :environment do
    Bikeroute.delete_all
    require 'json'
    Dir.chdir(Rails.root + 'lib/assets')
    file = File.read('routeSeedData.json')
    data_hash = JSON.parse(file)
    # puts data_hash
    data_hash.each do |record|
      # puts record["geojson"].to_json
      record["geojson"] = record["geojson"].to_json
      record["elevation"] = record["elevation"].to_json
      new_record = Bikeroute.new(record)
      new_record.save
    end
  end
  task connect: :environment do
    Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Western Addition')
    Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Haight Ashbury')

  end
end
