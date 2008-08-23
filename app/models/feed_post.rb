class FeedPost < ActiveRecord::Base
  belongs_to :feed
  def highlighted?
    self.feed.highlighted?
  end
end
