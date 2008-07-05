class FeedsController < ApplicationController
  def index
    @planet = Planet.find(:first)
    render_rss_feed_for FeedPost.find(:all, :order => 'date_published DESC', :limit => 15)
  end
end
