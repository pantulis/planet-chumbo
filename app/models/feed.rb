class Feed < ActiveRecord::Base

  has_many :feed_posts

  require 'feed-normalizer'
  
  
  def parse
    return unless self.published? 
    
    feed = FeedNormalizer::FeedNormalizer.parse open(self.feed_url)
    feed.clean!
    feed.entries.each do |entry|
      post = FeedPost.find_or_initialize_by_permalink(entry.urls.first)
      post.title = entry.title
      post.body = entry.content
      post.authors = entry.authors.join(',')
      post.categories = entry.categories.join(',')
      post.date_published = entry.date_published
      
      post.save
      
      self.feed_posts << post
    end
    self.update_attributes(:name => feed.title)
    self.save
  rescue
    logger.debug("Error parseando #{self.feed_url}, lo inhabilitamos")
    self.update_attributes(:published => false)
  end

end
