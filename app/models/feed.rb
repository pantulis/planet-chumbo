class Feed < ActiveRecord::Base

  has_many :feed_posts, :dependent => :destroy
  named_scope :published, :conditions => { :published => true }
  named_scope :banned, :conditions => { :published => false }
  
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

      if post.new_record?
        post.date_published = entry.date_published || Time.now
      end

      post.save
      
      self.feed_posts << post
    end
    self.update_attributes(:name => feed.title, :updated_at => Time.now)
  rescue
    logger.debug("Error parseando #{self.feed_url}, lo inhabilitamos")
    self.update_attributes(:published => false)
  end

  def avatar_url
    if self.read_attribute(:avatar_url).blank?
      "/images/default-avatar.jpg"
    else
      self.read_attribute(:avatar_url)
    end
  end
  
  def highlighted?
    !self.read_attribute(:avatar_url).blank?
  end
end

