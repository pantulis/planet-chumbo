namespace :db do
  desc "Loads a schema.rb file into the database and then loads the initial database fixtures."
  task :bootstrap do |task_args|
    mkdir_p File.join(RAILS_ROOT, 'log')
    
    %w(environment db:schema:load db:bootstrap:load tmp:create).each { |t| Rake::Task[t].execute task_args}
    
    puts
    puts '=' * 80
    puts
    puts "Thank you for trying out Chumbo Planet #{Chumbo::Version::STRING}: #{Chumbo::Version::TITLE} Edition!"
    puts
    puts "Now you can start the application with script/server, visit "
    puts "http://yourdomain.com/admin, and log in with admin / test."
    puts
  end
  
  namespace :bootstrap do
    desc "Load initial database fixtures (in db/bootstrap/*.yml) into the current environment's database.  Load specific fixtures using FIXTURES=x,y"
    task :load => :environment do
      require 'active_record/fixtures'
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
      (ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : Dir.glob(File.join(RAILS_ROOT, 'db', 'bootstrap', '*.{yml,csv}'))).each do |fixture_file|
        Fixtures.create_fixtures('db/bootstrap', File.basename(fixture_file, '.*'))
      end
    end
  end
end