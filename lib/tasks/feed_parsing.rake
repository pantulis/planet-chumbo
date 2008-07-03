namespace :chumbo do

  desc "Parsea todos los feeds"
  task :parse_all => :environment do 
    Feed.find(:all).each do |feed|
      puts "Downloading and parsing #{feed.feed_url}"
      
      feed.parse
      
    end
  end

  desc "Parse some feeds"
  task :parse => :environment do
    if ENV['LIMIT'].blank?
      feeds = Feed.find(:all, :conditions => "published  = 't'", :order => 'updated_at ASC')
    else 
      length = ENV['LIMIT'].to_i
      feeds = Feed.find(:all, :conditions => "published = 't'", :order => 'updated_at ASC', :limit => length)
    end
    
    feeds.each do |feed|
      puts "Downloading and parsing #{feed.feed_url}"
      feed.parse
    end

  end

end