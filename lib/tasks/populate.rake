desc "Erase and fill database"
task :populate => :environment do
  Rake::Task['populate:administrators'].invoke
end
