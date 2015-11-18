namespace :data do
  desc "TODO"
  task load_routes: :environment do
    Bikeroute.delete_all
    require 'json'
    Dir.chdir(Rails.root + 'lib/assets')
    file = File.read('routeSeedData.json')
    data_hash = JSON.parse(file)
    data_hash.each do |record|
      hoods = record["geojson"]["properties"]["hoods"]
      record["geojson"] = record["geojson"].to_json
      record["elevation"] = record["elevation"].to_json
      new_record = Bikeroute.new(record)
      hoods.each do |hood|
        new_record.neighborhoods << Neighborhood.find_by( name: hood)
      end
      new_record.save
    end
  end
  # task connect: :environment do
  #   Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Western Addition')
  #   Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Haight Ashbury')
  #
  # end
end
