atom_feed(:url => url_for(:controller => 'front_pages', :action => 'index', :format => :atom)) do |feed|
   feed.title("Planeta Málaga")
   feed.updated(@posts.first ? @posts.first.created_at : Time.now.utc)
 
   for post in @posts
     feed.entry(post, :url => post.permalink) do |entry|
       entry.title(post.feed.name + " » " + post.title)
       entry.content(post.body, :type => 'html')
     end
   end
 end