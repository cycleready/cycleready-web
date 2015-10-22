desc "load json seed data into db"
namespace :data do
  task :load_fakedata, [:filename] => [:environment] do |t, args|
    require 'csv'
    Dir.chdir(Rails.root + 'lib/assets')
    CSV.foreach(args[:filename], :headers => true) do |row|
      Model.create!({

        })
      # puts row.to_hash
    end
  end
end
#http://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file
#command: rake data:seed[seed_data.csv]
