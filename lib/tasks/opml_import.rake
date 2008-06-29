namespace :chumbo do

  require 'rexml/Document'


  # parse_opml (opml_node, parent_names=[])
  #
  # takes an REXML::Element that has OPML outline nodes as children, 
  # parses its subtree recursively and returns a hash:
  # { feed_url => [parent_name_1, parent_name_2, ...] } 
  #
  def parse_opml(opml_node, parent_names=[])
    feeds = {}
    opml_node.elements.each('outline') do |el|
      if (el.elements.size != 0) 
        feeds.merge!(parse_opml(el, parent_names + [el.attributes['text']]))
      end
      if (el.attributes['xmlUrl'])
        feeds[el.attributes['xmlUrl']] = parent_names
      end
    end
    return feeds
  end

  desc "Importa un archivo OPML FILE=<path al archivo>"
  task :import_opml => :environment do
    if (ENV['FILE'].blank?)
      puts "Error, debes pasar un path al fichero OPML"
    else

      path = ENV['FILE']
      puts "Parsing #{path}"
      opml = REXML::Document.new(File.read(path))
      feeds = parse_opml(opml.elements['opml/body'])

      feeds.each do |k,v|

        puts " --> #{k}"
        f = Feed.find_or_create_by_feed_url(k)
        if (f)
          f.published = true
          f.save
          puts "      Guardada con exito"
        else
          puts "      ERROR"
        end      
      end
    end
  end

  desc "Parsea todos los feeds"
  task :parse_all => :environment do 
    Feed.find(:all).each do |feed|
      puts "Downloading and parsing #{feed.feed_url}"
      
      feed.parse
      
    end
  end
end
